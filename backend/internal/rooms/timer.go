package rooms

import (
	"fmt"
	"log"
	"sync"
	"time"

	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/database"
)

// DurationManager manages meeting duration timers
type DurationManager struct {
	timers map[uuid.UUID]*RoomTimer
	mu     sync.RWMutex
	hub    SignalingHub // Interface for sending warnings
}

// RoomTimer represents a timer for a single room
type RoomTimer struct {
	RoomID           uuid.UUID
	MaxDuration      int // in minutes
	WarningThreshold int // in minutes (e.g., 5 minutes before end)
	stopChan         chan bool
	warningSent      bool
}

// SignalingHub interface for sending messages to room participants
type SignalingHub interface {
	BroadcastToRoom(roomID uuid.UUID, messageType string, data interface{})
}

var (
	durationManager *DurationManager
	once            sync.Once
)

// GetDurationManager returns the singleton instance
func GetDurationManager() *DurationManager {
	once.Do(func() {
		durationManager = &DurationManager{
			timers: make(map[uuid.UUID]*RoomTimer),
		}
	})
	return durationManager
}

// SetSignalingHub sets the signaling hub for broadcasting messages
func (dm *DurationManager) SetSignalingHub(hub SignalingHub) {
	dm.mu.Lock()
	defer dm.mu.Unlock()
	dm.hub = hub
}

// StartTimer starts a duration timer for a room
func (dm *DurationManager) StartTimer(roomID uuid.UUID, maxDuration int) {
	if maxDuration == 0 {
		// Unlimited duration for paid plans
		return
	}

	dm.mu.Lock()
	defer dm.mu.Unlock()

	// Check if timer already exists
	if _, exists := dm.timers[roomID]; exists {
		log.Printf("Timer already exists for room %s", roomID)
		return
	}

	timer := &RoomTimer{
		RoomID:           roomID,
		MaxDuration:      maxDuration,
		WarningThreshold: 5, // 5 minutes warning
		stopChan:         make(chan bool),
		warningSent:      false,
	}

	dm.timers[roomID] = timer

	log.Printf("Starting duration timer for room %s: %d minutes", roomID, maxDuration)

	go dm.runTimer(timer)
}

// StopTimer stops a duration timer for a room
func (dm *DurationManager) StopTimer(roomID uuid.UUID) {
	dm.mu.Lock()
	defer dm.mu.Unlock()

	timer, exists := dm.timers[roomID]
	if !exists {
		return
	}

	log.Printf("Stopping duration timer for room %s", roomID)

	close(timer.stopChan)
	delete(dm.timers, roomID)
}

// GetRemainingTime returns the remaining time in seconds for a room
func (dm *DurationManager) GetRemainingTime(roomID uuid.UUID) int {
	db := database.GetDB()

	var room models.Room
	if err := db.First(&room, roomID).Error; err != nil {
		return 0
	}

	if room.StartedAt == nil {
		return 0
	}

	// Get the max duration from the timer
	dm.mu.RLock()
	timer, exists := dm.timers[roomID]
	dm.mu.RUnlock()

	if !exists {
		return 0 // No limit
	}

	elapsed := time.Since(*room.StartedAt).Seconds()
	maxSeconds := float64(timer.MaxDuration * 60)
	remaining := maxSeconds - elapsed

	if remaining < 0 {
		return 0
	}

	return int(remaining)
}

// runTimer runs the actual timer logic
func (dm *DurationManager) runTimer(timer *RoomTimer) {
	maxDuration := time.Duration(timer.MaxDuration) * time.Minute
	warningTime := maxDuration - (time.Duration(timer.WarningThreshold) * time.Minute)

	// Create tickers
	checkInterval := 10 * time.Second
	ticker := time.NewTicker(checkInterval)
	defer ticker.Stop()

	startTime := time.Now()

	for {
		select {
		case <-timer.stopChan:
			log.Printf("Timer stopped for room %s", timer.RoomID)
			return

		case <-ticker.C:
			elapsed := time.Since(startTime)

			// Send warning if threshold reached
			if !timer.warningSent && elapsed >= warningTime {
				dm.sendWarning(timer)
				timer.warningSent = true
			}

			// End room if max duration reached
			if elapsed >= maxDuration {
				log.Printf("Max duration reached for room %s, ending meeting", timer.RoomID)
				dm.endRoomDueToTimeout(timer.RoomID)
				return
			}
		}
	}
}

// sendWarning sends a warning to all participants
func (dm *DurationManager) sendWarning(timer *RoomTimer) {
	remainingMinutes := timer.WarningThreshold

	log.Printf("Sending %d-minute warning to room %s", remainingMinutes, timer.RoomID)

	if dm.hub != nil {
		dm.hub.BroadcastToRoom(timer.RoomID, "time_warning", map[string]interface{}{
			"remaining_minutes": remainingMinutes,
			"message":           fmt.Sprintf("This meeting will end in %d minutes due to plan limits", remainingMinutes),
		})
	}
}

// endRoomDueToTimeout ends a room due to duration timeout
func (dm *DurationManager) endRoomDueToTimeout(roomID uuid.UUID) {
	db := database.GetDB()

	var room models.Room
	if err := db.First(&room, roomID).Error; err != nil {
		log.Printf("Error finding room %s: %v", roomID, err)
		return
	}

	// Check if room is still active
	if room.Status != models.RoomStatusActive {
		log.Printf("Room %s is not active, skipping timeout end", roomID)
		return
	}

	// Send final notification
	if dm.hub != nil {
		dm.hub.BroadcastToRoom(roomID, "room_ended", map[string]interface{}{
			"reason":  "duration_limit",
			"message": "This meeting has ended due to plan duration limits",
		})
	}

	// End the room
	room.End()

	// Mark all participants as left
	now := time.Now()
	db.Model(&models.RoomParticipant{}).
		Where("room_id = ? AND left_at IS NULL", roomID).
		Update("left_at", now)

	if err := db.Save(&room).Error; err != nil {
		log.Printf("Error ending room %s: %v", roomID, err)
		return
	}

	log.Printf("Room %s ended due to duration timeout", roomID)

	// Stop the timer
	dm.StopTimer(roomID)
}

// CleanupExpiredTimers removes timers for rooms that are no longer active
func (dm *DurationManager) CleanupExpiredTimers() {
	dm.mu.Lock()
	defer dm.mu.Unlock()

	db := database.GetDB()

	for roomID := range dm.timers {
		var room models.Room
		if err := db.First(&room, roomID).Error; err != nil || room.Status == models.RoomStatusEnded {
			// Room doesn't exist or is ended, clean up timer
			if timer, exists := dm.timers[roomID]; exists {
				close(timer.stopChan)
				delete(dm.timers, roomID)
				log.Printf("Cleaned up expired timer for room %s", roomID)
			}
		}
	}
}
