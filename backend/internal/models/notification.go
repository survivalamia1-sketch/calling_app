package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type NotificationType string

const (
	NotificationTypeMeetingInvite      NotificationType = "meeting_invite"
	NotificationTypeMeetingStarted     NotificationType = "meeting_started"
	NotificationTypeMeetingEnded       NotificationType = "meeting_ended"
	NotificationTypeRecordingAvailable NotificationType = "recording_available"
	NotificationTypeParticipantJoined  NotificationType = "participant_joined"
	NotificationTypeParticipantLeft    NotificationType = "participant_left"
	NotificationTypeChatMessage        NotificationType = "chat_message"
	NotificationTypeSystem             NotificationType = "system"
)

type Notification struct {
	ID        uuid.UUID        `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	UserID    uuid.UUID        `gorm:"type:uuid;not null;index" json:"user_id"`
	Type      NotificationType `gorm:"not null;index" json:"type"`
	Title     string           `gorm:"size:255;not null" json:"title"`
	Message   string           `gorm:"type:text;not null" json:"message"`
	Data      string           `gorm:"type:text" json:"data,omitempty"` // JSON data
	IsRead    bool             `gorm:"default:false;index" json:"is_read"`
	ReadAt    *time.Time       `json:"read_at,omitempty"`
	CreatedAt time.Time        `gorm:"index" json:"created_at"`
	UpdatedAt time.Time        `json:"updated_at"`
	DeletedAt gorm.DeletedAt   `gorm:"index" json:"-"`

	// Relationships
	User *User `gorm:"foreignKey:UserID" json:"user,omitempty"`
}

// MarkAsRead marks the notification as read
func (n *Notification) MarkAsRead() {
	if !n.IsRead {
		now := time.Now()
		n.IsRead = true
		n.ReadAt = &now
	}
}
