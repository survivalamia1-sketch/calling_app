package notifications

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

// CreateNotification creates a new notification for a user
func (s *Service) CreateNotification(userID uuid.UUID, notifType models.NotificationType, title, message string, data map[string]interface{}) (*models.Notification, error) {
	db := database.GetDB()

	notification := models.Notification{
		UserID:  userID,
		Type:    notifType,
		Title:   title,
		Message: message,
		IsRead:  false,
	}

	if err := db.Create(&notification).Error; err != nil {
		return nil, fmt.Errorf("failed to create notification: %w", err)
	}

	return &notification, nil
}

// GetUserNotifications retrieves all notifications for a user
func (s *Service) GetUserNotifications(userID uuid.UUID, limit int) ([]models.Notification, error) {
	db := database.GetDB()

	if limit <= 0 {
		limit = 50
	}

	var notifications []models.Notification
	if err := db.Where("user_id = ?", userID).
		Order("created_at DESC").
		Limit(limit).
		Find(&notifications).Error; err != nil {
		return nil, fmt.Errorf("database error: %w", err)
	}

	return notifications, nil
}

// MarkAsRead marks a notification as read
func (s *Service) MarkAsRead(notificationID, userID uuid.UUID) error {
	db := database.GetDB()

	var notification models.Notification
	if err := db.Where("id = ? AND user_id = ?", notificationID, userID).First(&notification).Error; err != nil {
		return fmt.Errorf("notification not found: %w", err)
	}

	notification.MarkAsRead()

	if err := db.Save(&notification).Error; err != nil {
		return fmt.Errorf("failed to update notification: %w", err)
	}

	return nil
}

// MarkAllAsRead marks all notifications for a user as read
func (s *Service) MarkAllAsRead(userID uuid.UUID) error {
	db := database.GetDB()

	now := time.Now()
	if err := db.Model(&models.Notification{}).
		Where("user_id = ? AND is_read = ?", userID, false).
		Updates(map[string]interface{}{
			"is_read": true,
			"read_at": now,
		}).Error; err != nil {
		return fmt.Errorf("failed to mark notifications as read: %w", err)
	}

	return nil
}

// GetUnreadCount returns the count of unread notifications
func (s *Service) GetUnreadCount(userID uuid.UUID) (int64, error) {
	db := database.GetDB()

	var count int64
	if err := db.Model(&models.Notification{}).
		Where("user_id = ? AND is_read = ?", userID, false).
		Count(&count).Error; err != nil {
		return 0, fmt.Errorf("database error: %w", err)
	}

	return count, nil
}
