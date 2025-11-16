package chat

import (
	"errors"
	"fmt"
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

// SaveMessage persists a chat message to the database
func (s *Service) SaveMessage(roomID, senderID uuid.UUID, senderName, content string, recipientID *uuid.UUID) (*models.ChatMessage, error) {
	db := database.GetDB()

	isPrivate := recipientID != nil

	message := models.ChatMessage{
		RoomID:      roomID,
		SenderID:    senderID,
		SenderName:  senderName,
		RecipientID: recipientID,
		Content:     content,
		IsPrivate:   isPrivate,
		CreatedAt:   time.Now(),
	}

	if err := db.Create(&message).Error; err != nil {
		return nil, fmt.Errorf("failed to save message: %w", err)
	}

	return &message, nil
}

// GetRoomMessages retrieves chat history for a room
func (s *Service) GetRoomMessages(roomID uuid.UUID, limit int) ([]models.ChatMessage, error) {
	db := database.GetDB()

	if limit <= 0 {
		limit = 50 // Default limit
	}

	var messages []models.ChatMessage
	if err := db.Where("room_id = ? AND is_deleted = ?", roomID, false).
		Order("created_at DESC").
		Limit(limit).
		Find(&messages).Error; err != nil {
		return nil, fmt.Errorf("database error: %w", err)
	}

	// Reverse to get chronological order
	for i, j := 0, len(messages)-1; i < j; i, j = i+1, j-1 {
		messages[i], messages[j] = messages[j], messages[i]
	}

	return messages, nil
}

// DeleteMessage marks a message as deleted
func (s *Service) DeleteMessage(messageID, userID uuid.UUID) error {
	db := database.GetDB()

	var message models.ChatMessage
	if err := db.First(&message, messageID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return errors.New("message not found")
		}
		return fmt.Errorf("database error: %w", err)
	}

	// Only sender can delete their own message
	if message.SenderID != userID {
		return errors.New("you can only delete your own messages")
	}

	// Mark as deleted instead of hard delete
	message.IsDeleted = true
	if err := db.Save(&message).Error; err != nil {
		return fmt.Errorf("failed to delete message: %w", err)
	}

	return nil
}
