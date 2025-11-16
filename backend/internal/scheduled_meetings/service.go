package scheduled_meetings

import (
	"encoding/json"
	"errors"
	"fmt"
	"time"

	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/internal/rooms"
	"github.com/yourusername/calling-app-backend/pkg/database"
	"gorm.io/gorm"
)

type Service struct {
	roomService *rooms.Service
}

func NewService() *Service {
	return &Service{
		roomService: rooms.NewService(),
	}
}

type CreateScheduledMeetingInput struct {
	Title               string   `json:"title" binding:"required"`
	Description         string   `json:"description"`
	ScheduledAt         string   `json:"scheduled_at" binding:"required"` // ISO 8601 format
	DurationMinutes     int      `json:"duration_minutes" binding:"required,min=1"`
	MaxParticipants     int      `json:"max_participants"`
	Password            string   `json:"password"`
	RequiresApproval    bool     `json:"requires_approval"`
	WaitingRoomEnabled  bool     `json:"waiting_room_enabled"`
	AllowJoinBeforeHost bool     `json:"allow_join_before_host"`
	MuteOnEntry         bool     `json:"mute_on_entry"`
	InvitedEmails       []string `json:"invited_emails"`
	IsRecurring         bool     `json:"is_recurring"`
	RecurrencePattern   map[string]interface{} `json:"recurrence_pattern"`
}

type UpdateScheduledMeetingInput struct {
	Title               *string                `json:"title"`
	Description         *string                `json:"description"`
	ScheduledAt         *string                `json:"scheduled_at"` // ISO 8601 format
	DurationMinutes     *int                   `json:"duration_minutes"`
	MaxParticipants     *int                   `json:"max_participants"`
	Password            *string                `json:"password"`
	RequiresApproval    *bool                  `json:"requires_approval"`
	WaitingRoomEnabled  *bool                  `json:"waiting_room_enabled"`
	AllowJoinBeforeHost *bool                  `json:"allow_join_before_host"`
	MuteOnEntry         *bool                  `json:"mute_on_entry"`
	InvitedEmails       []string               `json:"invited_emails"`
	IsRecurring         *bool                  `json:"is_recurring"`
	RecurrencePattern   map[string]interface{} `json:"recurrence_pattern"`
}

// CreateScheduledMeeting creates a new scheduled meeting
func (s *Service) CreateScheduledMeeting(hostID uuid.UUID, input CreateScheduledMeetingInput) (*models.ScheduledMeeting, error) {
	db := database.GetDB()

	// Parse scheduled time
	scheduledAt, err := time.Parse(time.RFC3339, input.ScheduledAt)
	if err != nil {
		return nil, fmt.Errorf("invalid scheduled_at format: %w", err)
	}

	// Validate scheduled time is in the future
	if scheduledAt.Before(time.Now()) {
		return nil, errors.New("scheduled time must be in the future")
	}

	// Serialize invited emails to JSON
	invitedEmailsJSON := "[]"
	if len(input.InvitedEmails) > 0 {
		emailsBytes, _ := json.Marshal(input.InvitedEmails)
		invitedEmailsJSON = string(emailsBytes)
	}

	// Serialize recurrence pattern to JSON
	recurrencePatternJSON := ""
	if input.IsRecurring && len(input.RecurrencePattern) > 0 {
		patternBytes, _ := json.Marshal(input.RecurrencePattern)
		recurrencePatternJSON = string(patternBytes)
	}

	// Set default max participants if not specified
	maxParticipants := input.MaxParticipants
	if maxParticipants == 0 {
		maxParticipants = 10
	}

	// Create scheduled meeting
	meeting := models.ScheduledMeeting{
		HostID:              hostID,
		Title:               input.Title,
		Description:         input.Description,
		ScheduledAt:         scheduledAt,
		DurationMinutes:     input.DurationMinutes,
		MaxParticipants:     maxParticipants,
		Password:            input.Password,
		RequiresApproval:    input.RequiresApproval,
		WaitingRoomEnabled:  input.WaitingRoomEnabled,
		AllowJoinBeforeHost: input.AllowJoinBeforeHost,
		MuteOnEntry:         input.MuteOnEntry,
		InvitedEmails:       invitedEmailsJSON,
		IsRecurring:         input.IsRecurring,
		RecurrencePattern:   recurrencePatternJSON,
		Status:              models.ScheduledMeetingStatusScheduled,
	}

	if err := db.Create(&meeting).Error; err != nil {
		return nil, fmt.Errorf("failed to create scheduled meeting: %w", err)
	}

	// Load host relationship
	db.Preload("Host").First(&meeting, meeting.ID)

	return &meeting, nil
}

// GetScheduledMeetings gets all scheduled meetings for a user with optional status filter
func (s *Service) GetScheduledMeetings(hostID uuid.UUID, status string) ([]models.ScheduledMeeting, error) {
	db := database.GetDB()

	query := db.Where("host_id = ?", hostID)

	if status != "" {
		query = query.Where("status = ?", status)
	}

	var meetings []models.ScheduledMeeting
	if err := query.
		Preload("Host").
		Preload("Room").
		Order("scheduled_at ASC").
		Find(&meetings).Error; err != nil {
		return nil, fmt.Errorf("database error: %w", err)
	}

	return meetings, nil
}

// GetScheduledMeeting gets a single scheduled meeting by ID
func (s *Service) GetScheduledMeeting(meetingID uuid.UUID) (*models.ScheduledMeeting, error) {
	db := database.GetDB()

	var meeting models.ScheduledMeeting
	if err := db.Preload("Host").Preload("Room").First(&meeting, meetingID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("scheduled meeting not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	return &meeting, nil
}

// UpdateScheduledMeeting updates a scheduled meeting
func (s *Service) UpdateScheduledMeeting(meetingID, hostID uuid.UUID, input UpdateScheduledMeetingInput) (*models.ScheduledMeeting, error) {
	db := database.GetDB()

	var meeting models.ScheduledMeeting
	if err := db.First(&meeting, meetingID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("scheduled meeting not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	// Check if user is host
	if meeting.HostID != hostID {
		return nil, errors.New("only host can update the meeting")
	}

	// Can only update if meeting is scheduled
	if meeting.Status != models.ScheduledMeetingStatusScheduled {
		return nil, errors.New("can only update scheduled meetings")
	}

	// Apply updates
	if input.Title != nil {
		meeting.Title = *input.Title
	}
	if input.Description != nil {
		meeting.Description = *input.Description
	}
	if input.ScheduledAt != nil {
		scheduledAt, err := time.Parse(time.RFC3339, *input.ScheduledAt)
		if err != nil {
			return nil, fmt.Errorf("invalid scheduled_at format: %w", err)
		}
		if scheduledAt.Before(time.Now()) {
			return nil, errors.New("scheduled time must be in the future")
		}
		meeting.ScheduledAt = scheduledAt
	}
	if input.DurationMinutes != nil {
		meeting.DurationMinutes = *input.DurationMinutes
	}
	if input.MaxParticipants != nil {
		meeting.MaxParticipants = *input.MaxParticipants
	}
	if input.Password != nil {
		meeting.Password = *input.Password
	}
	if input.RequiresApproval != nil {
		meeting.RequiresApproval = *input.RequiresApproval
	}
	if input.WaitingRoomEnabled != nil {
		meeting.WaitingRoomEnabled = *input.WaitingRoomEnabled
	}
	if input.AllowJoinBeforeHost != nil {
		meeting.AllowJoinBeforeHost = *input.AllowJoinBeforeHost
	}
	if input.MuteOnEntry != nil {
		meeting.MuteOnEntry = *input.MuteOnEntry
	}
	if input.InvitedEmails != nil {
		emailsBytes, _ := json.Marshal(input.InvitedEmails)
		meeting.InvitedEmails = string(emailsBytes)
	}
	if input.IsRecurring != nil {
		meeting.IsRecurring = *input.IsRecurring
	}
	if input.RecurrencePattern != nil {
		patternBytes, _ := json.Marshal(input.RecurrencePattern)
		meeting.RecurrencePattern = string(patternBytes)
	}

	if err := db.Save(&meeting).Error; err != nil {
		return nil, fmt.Errorf("failed to update meeting: %w", err)
	}

	// Reload with relationships
	db.Preload("Host").First(&meeting, meeting.ID)

	return &meeting, nil
}

// DeleteScheduledMeeting deletes a scheduled meeting (soft delete)
func (s *Service) DeleteScheduledMeeting(meetingID, hostID uuid.UUID) error {
	db := database.GetDB()

	var meeting models.ScheduledMeeting
	if err := db.First(&meeting, meetingID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return errors.New("scheduled meeting not found")
		}
		return fmt.Errorf("database error: %w", err)
	}

	// Check if user is host
	if meeting.HostID != hostID {
		return errors.New("only host can delete the meeting")
	}

	// Soft delete
	if err := db.Delete(&meeting).Error; err != nil {
		return fmt.Errorf("failed to delete meeting: %w", err)
	}

	return nil
}

// StartScheduledMeeting converts a scheduled meeting to an active room
func (s *Service) StartScheduledMeeting(meetingID, hostID uuid.UUID) (*models.Room, error) {
	db := database.GetDB()

	var meeting models.ScheduledMeeting
	if err := db.First(&meeting, meetingID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("scheduled meeting not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	// Check if user is host
	if meeting.HostID != hostID {
		return nil, errors.New("only host can start the meeting")
	}

	// Check if meeting can be started
	if !meeting.CanStart() {
		return nil, errors.New("meeting cannot be started")
	}

	// Create a room for the scheduled meeting
	roomInput := rooms.CreateRoomInput{
		Name:             meeting.Title,
		Description:      meeting.Description,
		Password:         meeting.Password,
		IsPasswordLocked: meeting.Password != "",
		HasWaitingRoom:   meeting.WaitingRoomEnabled,
		MaxParticipants:  meeting.MaxParticipants,
	}

	room, err := s.roomService.CreateRoom(hostID, roomInput)
	if err != nil {
		return nil, fmt.Errorf("failed to create room: %w", err)
	}

	// Update scheduled meeting status
	meeting.Start(room.ID)
	if err := db.Save(&meeting).Error; err != nil {
		return nil, fmt.Errorf("failed to update meeting status: %w", err)
	}

	return room, nil
}

// GetUpcomingMeetings gets all upcoming scheduled meetings for a user
func (s *Service) GetUpcomingMeetings(hostID uuid.UUID) ([]models.ScheduledMeeting, error) {
	db := database.GetDB()

	var meetings []models.ScheduledMeeting
	if err := db.
		Where("host_id = ? AND status = ? AND scheduled_at > ?",
			hostID,
			models.ScheduledMeetingStatusScheduled,
			time.Now()).
		Preload("Host").
		Order("scheduled_at ASC").
		Limit(10). // Limit to next 10 upcoming meetings
		Find(&meetings).Error; err != nil {
		return nil, fmt.Errorf("database error: %w", err)
	}

	return meetings, nil
}
