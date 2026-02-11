package rooms

import (
	"errors"
	"fmt"
	"math/rand"
	"time"

	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/database"
	"gorm.io/gorm"
)

type Service struct{}

func NewService() *Service {
	return &Service{}
}

type CreateRoomInput struct {
	Name             string     `json:"name"`
	Description      string     `json:"description"`
	Password         string     `json:"password"`
	IsPasswordLocked bool       `json:"is_password_locked"`
	HasWaitingRoom   bool       `json:"has_waiting_room"`
	MaxParticipants  int        `json:"max_participants"`
	ScheduledAt      *time.Time `json:"scheduled_at"`
}

type JoinRoomInput struct {
	Password string `json:"password"`
	Name     string `json:"name"` // For guest users
}

// GetOrCreatePersonalRoom returns the host's personal meeting room.
// If the room does not exist yet, it creates one with Zoom-style defaults.
func (s *Service) GetOrCreatePersonalRoom(hostID uuid.UUID) (*models.Room, error) {
	db := database.GetDB()

	var room models.Room
	err := db.Where("host_id = ? AND name = ?", hostID, "Personal Meeting Room").First(&room).Error
	if err == nil {
		db.Preload("Host").First(&room, room.ID)
		return &room, nil
	}

	if !errors.Is(err, gorm.ErrRecordNotFound) {
		return nil, fmt.Errorf("database error: %w", err)
	}

	input := CreateRoomInput{
		Name:            "Personal Meeting Room",
		Description:     "Always-available personal room for instant meetings",
		HasWaitingRoom:  true,
		MaxParticipants: 10,
	}

	return s.CreateRoom(hostID, input)
}

// generateRoomCode generates a unique 9-digit room code
func (s *Service) generateRoomCode() string {
	db := database.GetDB()

	for {
		// Generate 9-digit code (format: XXX-XXX-XXX)
		code := fmt.Sprintf("%03d-%03d-%03d",
			rand.Intn(1000),
			rand.Intn(1000),
			rand.Intn(1000),
		)

		// Check if code already exists
		var count int64
		db.Model(&models.Room{}).Where("code = ?", code).Count(&count)

		if count == 0 {
			return code
		}
		// If code exists, loop and try again
	}
}

// CreateRoom creates a new meeting room
func (s *Service) CreateRoom(hostID uuid.UUID, input CreateRoomInput) (*models.Room, error) {
	db := database.GetDB()

	// Get user with subscription
	var user models.User
	if err := db.Preload("Subscription.Plan").First(&user, hostID).Error; err != nil {
		return nil, fmt.Errorf("user not found: %w", err)
	}

	// Check subscription limits
	if user.Subscription != nil && input.MaxParticipants > user.Subscription.GetMaxParticipants() {
		return nil, fmt.Errorf("max participants exceeds your plan limit of %d", user.Subscription.GetMaxParticipants())
	}

	// Set default max participants if not specified
	maxParticipants := input.MaxParticipants
	if maxParticipants == 0 {
		if user.Subscription != nil {
			maxParticipants = user.Subscription.GetMaxParticipants()
		} else {
			maxParticipants = 3 // Default for free
		}
	}

	// Create room
	room := models.Room{
		HostID:           hostID,
		Code:             s.generateRoomCode(),
		Name:             input.Name,
		Description:      input.Description,
		Password:         input.Password,
		IsPasswordLocked: input.IsPasswordLocked,
		HasWaitingRoom:   input.HasWaitingRoom,
		MaxParticipants:  maxParticipants,
		ScheduledAt:      input.ScheduledAt,
		Status:           models.RoomStatusWaiting,
	}

	if input.ScheduledAt != nil {
		room.Status = models.RoomStatusScheduled
	}

	if err := db.Create(&room).Error; err != nil {
		return nil, fmt.Errorf("failed to create room: %w", err)
	}

	// Load host relationship
	db.Preload("Host").First(&room, room.ID)

	return &room, nil
}

// GetRoom gets a room by ID
func (s *Service) GetRoom(roomID uuid.UUID) (*models.Room, error) {
	db := database.GetDB()

	var room models.Room
	if err := db.Preload("Host").Preload("Participants.User").First(&room, roomID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("room not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	return &room, nil
}

// GetRoomByCode gets a room by its unique code
func (s *Service) GetRoomByCode(code string) (*models.Room, error) {
	db := database.GetDB()

	var room models.Room
	if err := db.Where("code = ?", code).Preload("Host").Preload("Participants.User").First(&room).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("room not found with this code")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	return &room, nil
}

// GetUserRooms gets all rooms for a user
func (s *Service) GetUserRooms(userID uuid.UUID) ([]models.Room, error) {
	db := database.GetDB()

	var rooms []models.Room
	if err := db.Where("host_id = ?", userID).
		Preload("Host").
		Order("created_at DESC").
		Find(&rooms).Error; err != nil {
		return nil, fmt.Errorf("database error: %w", err)
	}

	return rooms, nil
}

// JoinRoom allows a user to join a room
func (s *Service) JoinRoom(roomID, userID uuid.UUID, input JoinRoomInput) (*models.RoomParticipant, error) {
	db := database.GetDB()

	// Get room
	var room models.Room
	if err := db.Preload("Participants").Preload("Host").First(&room, roomID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("room not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	// Check if room is active
	if !room.CanJoin(room.GetActiveParticipantCount()) {
		return nil, errors.New("room is full or has ended")
	}

	// Check password if room is locked
	if room.IsPasswordLocked && room.Password != input.Password {
		return nil, errors.New("invalid room password")
	}

	// Check if user is already in room
	var existingParticipant models.RoomParticipant
	result := db.Where("room_id = ? AND user_id = ? AND left_at IS NULL", roomID, userID).First(&existingParticipant)
	if result.RowsAffected > 0 {
		return &existingParticipant, nil
	}

	// Get user info
	var user models.User
	isGuest := false
	name := input.Name

	if userID != uuid.Nil {
		if err := db.First(&user, userID).Error; err == nil {
			name = user.GetFullName()
		}
	} else {
		isGuest = true
		if name == "" {
			name = "Guest"
		}
	}

	// Create participant
	participant := models.RoomParticipant{
		RoomID:   roomID,
		UserID:   userID,
		Name:     name,
		IsGuest:  isGuest,
		IsHost:   room.HostID == userID,
		JoinedAt: time.Now(),
	}

	if err := db.Create(&participant).Error; err != nil {
		return nil, fmt.Errorf("failed to join room: %w", err)
	}

	// If this is the first participant or the host, start the room
	if room.Status == models.RoomStatusWaiting || room.Status == models.RoomStatusScheduled {
		room.Start()
		db.Save(&room)

		// Start duration timer for the room based on host's subscription
		var host models.User
		if err := db.Preload("Subscription.Plan").First(&host, room.HostID).Error; err == nil {
			maxDuration := 45 // Default for free tier (in minutes)

			if host.Subscription != nil {
				maxDuration = host.Subscription.GetMaxMeetingDuration()
			}

			// Start timer (0 = unlimited for paid plans)
			GetDurationManager().StartTimer(room.ID, maxDuration)
		}
	}

	// Load user relationship
	db.Preload("User").First(&participant, participant.ID)

	return &participant, nil
}

// LeaveRoom removes a user from a room
func (s *Service) LeaveRoom(roomID, userID uuid.UUID) error {
	db := database.GetDB()

	var participant models.RoomParticipant
	if err := db.Where("room_id = ? AND user_id = ? AND left_at IS NULL", roomID, userID).First(&participant).Error; err != nil {
		return errors.New("participant not found in room")
	}

	// Mark as left
	now := time.Now()
	participant.LeftAt = &now

	if err := db.Save(&participant).Error; err != nil {
		return fmt.Errorf("failed to leave room: %w", err)
	}

	// Check if room should end (all participants left)
	var activeCount int64
	db.Model(&models.RoomParticipant{}).
		Where("room_id = ? AND left_at IS NULL", roomID).
		Count(&activeCount)

	if activeCount == 0 {
		var room models.Room
		if err := db.First(&room, roomID).Error; err == nil {
			room.End()
			db.Save(&room)

			// Stop duration timer
			GetDurationManager().StopTimer(roomID)
		}
	}

	return nil
}

// EndRoom ends a room (host only)
func (s *Service) EndRoom(roomID, hostID uuid.UUID) error {
	db := database.GetDB()

	var room models.Room
	if err := db.First(&room, roomID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return errors.New("room not found")
		}
		return fmt.Errorf("database error: %w", err)
	}

	// Check if user is host
	if room.HostID != hostID {
		return errors.New("only host can end the room")
	}

	// End the room
	room.End()

	// Mark all participants as left
	now := time.Now()
	db.Model(&models.RoomParticipant{}).
		Where("room_id = ? AND left_at IS NULL", roomID).
		Update("left_at", now)

	if err := db.Save(&room).Error; err != nil {
		return fmt.Errorf("failed to end room: %w", err)
	}

	// Stop duration timer
	GetDurationManager().StopTimer(roomID)

	return nil
}

// DeleteRoom deletes a room (soft delete)
func (s *Service) DeleteRoom(roomID, hostID uuid.UUID) error {
	db := database.GetDB()

	var room models.Room
	if err := db.First(&room, roomID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return errors.New("room not found")
		}
		return fmt.Errorf("database error: %w", err)
	}

	// Check if user is host
	if room.HostID != hostID {
		return errors.New("only host can delete the room")
	}

	// Soft delete
	if err := db.Delete(&room).Error; err != nil {
		return fmt.Errorf("failed to delete room: %w", err)
	}

	return nil
}

// GetRoomParticipants gets all participants in a room
func (s *Service) GetRoomParticipants(roomID uuid.UUID) ([]models.RoomParticipant, error) {
	db := database.GetDB()

	var participants []models.RoomParticipant
	if err := db.Where("room_id = ? AND left_at IS NULL", roomID).
		Preload("User").
		Find(&participants).Error; err != nil {
		return nil, fmt.Errorf("database error: %w", err)
	}

	return participants, nil
}

// GetRoomStatus gets the status of a room including remaining time
func (s *Service) GetRoomStatus(roomID uuid.UUID) (map[string]interface{}, error) {
	db := database.GetDB()

	var room models.Room
	if err := db.Preload("Host.Subscription.Plan").First(&room, roomID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("room not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	status := map[string]interface{}{
		"room_id":    room.ID,
		"status":     room.Status,
		"started_at": room.StartedAt,
		"ended_at":   room.EndedAt,
		"duration":   room.Duration,
	}

	// Add remaining time if room is active
	if room.Status == models.RoomStatusActive {
		remainingSeconds := GetDurationManager().GetRemainingTime(roomID)
		status["remaining_seconds"] = remainingSeconds

		// Check if there's a time limit
		if room.Host != nil && room.Host.Subscription != nil {
			maxDuration := room.Host.Subscription.GetMaxMeetingDuration()
			status["max_duration_minutes"] = maxDuration
			status["has_time_limit"] = maxDuration > 0
		} else {
			status["max_duration_minutes"] = 45 // Free tier default
			status["has_time_limit"] = true
		}
	}

	return status, nil
}
