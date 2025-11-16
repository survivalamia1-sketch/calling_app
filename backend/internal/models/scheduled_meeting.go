package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type ScheduledMeetingStatus string

const (
	ScheduledMeetingStatusScheduled   ScheduledMeetingStatus = "scheduled"
	ScheduledMeetingStatusInProgress  ScheduledMeetingStatus = "in_progress"
	ScheduledMeetingStatusCompleted   ScheduledMeetingStatus = "completed"
	ScheduledMeetingStatusCancelled   ScheduledMeetingStatus = "cancelled"
)

type ScheduledMeeting struct {
	ID                   uuid.UUID              `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	HostID               uuid.UUID              `gorm:"type:uuid;not null;index" json:"host_id"`
	Title                string                 `gorm:"size:255;not null" json:"title"`
	Description          string                 `json:"description"`
	ScheduledAt          time.Time              `gorm:"not null;index" json:"scheduled_at"`
	DurationMinutes      int                    `gorm:"not null" json:"duration_minutes"`
	MaxParticipants      int                    `gorm:"default:10" json:"max_participants"`
	Password             string                 `json:"password,omitempty"`
	RequiresApproval     bool                   `gorm:"default:false" json:"requires_approval"`
	WaitingRoomEnabled   bool                   `gorm:"default:false" json:"waiting_room_enabled"`
	AllowJoinBeforeHost  bool                   `gorm:"default:true" json:"allow_join_before_host"`
	MuteOnEntry          bool                   `gorm:"default:false" json:"mute_on_entry"`
	InvitedEmails        string                 `gorm:"type:text" json:"invited_emails"` // JSON array
	IsRecurring          bool                   `gorm:"default:false" json:"is_recurring"`
	RecurrencePattern    string                 `gorm:"type:text" json:"recurrence_pattern,omitempty"` // JSON object
	Status               ScheduledMeetingStatus `gorm:"default:'scheduled';index" json:"status"`
	RoomID               *uuid.UUID             `gorm:"type:uuid;index" json:"room_id,omitempty"` // Set when meeting starts
	CreatedAt            time.Time              `json:"created_at"`
	UpdatedAt            time.Time              `json:"updated_at"`
	DeletedAt            gorm.DeletedAt         `gorm:"index" json:"-"`

	// Relationships
	Host *User `gorm:"foreignKey:HostID" json:"host,omitempty"`
	Room *Room `gorm:"foreignKey:RoomID" json:"room,omitempty"`
}

// IsUpcoming checks if the meeting is scheduled in the future
func (sm *ScheduledMeeting) IsUpcoming() bool {
	return sm.Status == ScheduledMeetingStatusScheduled && time.Now().Before(sm.ScheduledAt)
}

// CanStart checks if the meeting can be started now
func (sm *ScheduledMeeting) CanStart() bool {
	return sm.Status == ScheduledMeetingStatusScheduled
}

// Start transitions the meeting to in-progress status
func (sm *ScheduledMeeting) Start(roomID uuid.UUID) {
	sm.Status = ScheduledMeetingStatusInProgress
	sm.RoomID = &roomID
}

// Complete transitions the meeting to completed status
func (sm *ScheduledMeeting) Complete() {
	sm.Status = ScheduledMeetingStatusCompleted
}

// Cancel transitions the meeting to cancelled status
func (sm *ScheduledMeeting) Cancel() {
	sm.Status = ScheduledMeetingStatusCancelled
}
