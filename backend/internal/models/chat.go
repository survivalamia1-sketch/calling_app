package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type ChatMessage struct {
	ID          uuid.UUID  `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	RoomID      uuid.UUID  `gorm:"type:uuid;not null;index" json:"room_id"`
	SenderID    uuid.UUID  `gorm:"type:uuid;not null;index" json:"sender_id"`
	SenderName  string     `gorm:"size:255;not null" json:"sender_name"`
	RecipientID *uuid.UUID `gorm:"type:uuid;index" json:"recipient_id,omitempty"` // For private messages
	Content     string     `gorm:"type:text;not null" json:"content"`
	IsPrivate   bool       `gorm:"default:false;index" json:"is_private"`
	IsDeleted   bool       `gorm:"default:false" json:"is_deleted"`
	CreatedAt   time.Time  `gorm:"index" json:"created_at"`
	UpdatedAt   time.Time  `json:"updated_at"`
	DeletedAt   gorm.DeletedAt `gorm:"index" json:"-"`

	// Relationships
	Room   *Room `gorm:"foreignKey:RoomID" json:"room,omitempty"`
	Sender *User `gorm:"foreignKey:SenderID" json:"sender,omitempty"`
}

// ToPublic returns the chat message with deleted content hidden
func (cm *ChatMessage) ToPublic() *ChatMessage {
	if cm.IsDeleted {
		cm.Content = "[This message was deleted]"
	}
	return cm
}
