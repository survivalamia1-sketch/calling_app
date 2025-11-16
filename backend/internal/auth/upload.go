package auth

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/middleware"
	"github.com/yourusername/calling-app-backend/pkg/database"
)

const (
	maxAvatarSize = 5 * 1024 * 1024 // 5MB
	avatarDir     = "./uploads/avatars"
)

// UploadAvatar godoc
// @Summary Upload user avatar
// @Description Upload a profile picture for the authenticated user
// @Tags auth
// @Accept multipart/form-data
// @Produce json
// @Security BearerAuth
// @Param avatar formData file true "Avatar image file"
// @Success 200 {object} map[string]interface{}
// @Failure 400 {object} map[string]interface{}
// @Router /auth/avatar [post]
func (h *Handler) UploadAvatar(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	// Parse multipart form
	file, header, err := c.Request.FormFile("avatar")
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "No file uploaded",
		})
		return
	}
	defer file.Close()

	// Validate file size
	if header.Size > maxAvatarSize {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": fmt.Sprintf("File size exceeds maximum of %dMB", maxAvatarSize/(1024*1024)),
		})
		return
	}

	// Validate file type
	allowedExtensions := map[string]bool{
		".jpg":  true,
		".jpeg": true,
		".png":  true,
		".gif":  true,
		".webp": true,
	}

	ext := strings.ToLower(filepath.Ext(header.Filename))
	if !allowedExtensions[ext] {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid file type. Allowed: jpg, jpeg, png, gif, webp",
		})
		return
	}

	// Create uploads directory if it doesn't exist
	if err := os.MkdirAll(avatarDir, 0755); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Failed to create upload directory",
		})
		return
	}

	// Generate unique filename
	filename := fmt.Sprintf("%s%s", uuid.New().String(), ext)
	filepath := filepath.Join(avatarDir, filename)

	// Save file
	out, err := os.Create(filepath)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Failed to save file",
		})
		return
	}
	defer out.Close()

	if _, err := io.Copy(out, file); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Failed to save file",
		})
		return
	}

	// Update user's avatar URL in database
	avatarURL := fmt.Sprintf("/uploads/avatars/%s", filename)
	db := database.GetDB()
	if err := db.Model(h.service.GetUserModel()).
		Where("id = ?", userID).
		Update("avatar", avatarURL).Error; err != nil {
		// Clean up uploaded file if database update fails
		os.Remove(filepath)
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Failed to update user avatar",
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message":    "Avatar uploaded successfully",
		"avatar_url": avatarURL,
	})
}

// Helper method for getting user model reference
func (s *Service) GetUserModel() interface{} {
	return &struct {
		Avatar string `gorm:"column:avatar"`
	}{}
}
