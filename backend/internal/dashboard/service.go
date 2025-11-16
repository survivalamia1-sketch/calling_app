package dashboard

import (
	"fmt"
	"time"

	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/database"
)

type Service struct{}

func NewService() *Service {
	return &Service{}
}

// DashboardStats represents dashboard statistics
type DashboardStats struct {
	TotalMeetings     int     `json:"totalMeetings"`
	UpcomingMeetings  int     `json:"upcomingMeetings"`
	TotalHours        float64 `json:"totalHours"`
	TotalParticipants int     `json:"totalParticipants"`
	MeetingsThisMonth int     `json:"meetingsThisMonth"`
	MeetingsThisWeek  int     `json:"meetingsThisWeek"`
	MeetingsToday     int     `json:"meetingsToday"`
}

// GetDashboardStats calculates dashboard statistics for a user
func (s *Service) GetDashboardStats(userID uuid.UUID) (*DashboardStats, error) {
	db := database.GetDB()

	stats := &DashboardStats{}

	// Calculate time boundaries
	now := time.Now()
	startOfDay := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location())
	startOfWeek := startOfDay.AddDate(0, 0, -int(now.Weekday()))
	startOfMonth := time.Date(now.Year(), now.Month(), 1, 0, 0, 0, 0, now.Location())

	// Total meetings created by user
	var totalMeetings int64
	if err := db.Model(&models.Room{}).
		Where("host_id = ?", userID).
		Count(&totalMeetings).Error; err != nil {
		return nil, fmt.Errorf("failed to count total meetings: %w", err)
	}
	stats.TotalMeetings = int(totalMeetings)

	// Upcoming meetings (scheduled or waiting status)
	var upcomingMeetings int64
	if err := db.Model(&models.Room{}).
		Where("host_id = ? AND (status = ? OR status = ?)",
			userID, models.RoomStatusScheduled, models.RoomStatusWaiting).
		Count(&upcomingMeetings).Error; err != nil {
		return nil, fmt.Errorf("failed to count upcoming meetings: %w", err)
	}
	stats.UpcomingMeetings = int(upcomingMeetings)

	// Total hours from all ended meetings
	var totalSeconds int64
	if err := db.Model(&models.Room{}).
		Where("host_id = ? AND status = ?", userID, models.RoomStatusEnded).
		Select("COALESCE(SUM(duration), 0)").
		Row().Scan(&totalSeconds); err != nil {
		return nil, fmt.Errorf("failed to calculate total hours: %w", err)
	}
	stats.TotalHours = float64(totalSeconds) / 3600.0 // Convert seconds to hours

	// Total unique participants across all meetings
	var totalParticipants int64
	if err := db.Model(&models.RoomParticipant{}).
		Joins("JOIN rooms ON rooms.id = room_participants.room_id").
		Where("rooms.host_id = ? AND room_participants.is_guest = ?", userID, false).
		Distinct("room_participants.user_id").
		Count(&totalParticipants).Error; err != nil {
		return nil, fmt.Errorf("failed to count total participants: %w", err)
	}
	stats.TotalParticipants = int(totalParticipants)

	// Meetings this month
	var meetingsThisMonth int64
	if err := db.Model(&models.Room{}).
		Where("host_id = ? AND created_at >= ?", userID, startOfMonth).
		Count(&meetingsThisMonth).Error; err != nil {
		return nil, fmt.Errorf("failed to count meetings this month: %w", err)
	}
	stats.MeetingsThisMonth = int(meetingsThisMonth)

	// Meetings this week
	var meetingsThisWeek int64
	if err := db.Model(&models.Room{}).
		Where("host_id = ? AND created_at >= ?", userID, startOfWeek).
		Count(&meetingsThisWeek).Error; err != nil {
		return nil, fmt.Errorf("failed to count meetings this week: %w", err)
	}
	stats.MeetingsThisWeek = int(meetingsThisWeek)

	// Meetings today
	var meetingsToday int64
	if err := db.Model(&models.Room{}).
		Where("host_id = ? AND created_at >= ?", userID, startOfDay).
		Count(&meetingsToday).Error; err != nil {
		return nil, fmt.Errorf("failed to count meetings today: %w", err)
	}
	stats.MeetingsToday = int(meetingsToday)

	return stats, nil
}

// GetUpcomingMeetings gets upcoming/scheduled meetings for a user
func (s *Service) GetUpcomingMeetings(userID uuid.UUID, limit int) ([]models.Room, error) {
	db := database.GetDB()

	if limit <= 0 {
		limit = 5
	}

	var rooms []models.Room
	query := db.Where("host_id = ? AND (status = ? OR status = ?)",
		userID, models.RoomStatusScheduled, models.RoomStatusWaiting).
		Preload("Host").
		Order("CASE WHEN scheduled_at IS NOT NULL THEN scheduled_at ELSE created_at END ASC").
		Limit(limit)

	if err := query.Find(&rooms).Error; err != nil {
		return nil, fmt.Errorf("failed to fetch upcoming meetings: %w", err)
	}

	return rooms, nil
}
