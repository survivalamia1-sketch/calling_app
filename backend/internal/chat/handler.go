package chat

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/middleware"
)

type Handler struct {
	service *Service
}

func NewHandler() *Handler {
	return &Handler{
		service: NewService(),
	}
}

// GetRoomMessages godoc
// @Summary Get room chat history
// @Description Retrieve chat messages for a room
// @Tags chat
// @Produce json
// @Security BearerAuth
// @Param room_id path string true "Room ID"
// @Param limit query int false "Message limit (default 50)"
// @Success 200 {array} models.ChatMessage
// @Router /rooms/{room_id}/messages [get]
func (h *Handler) GetRoomMessages(c *gin.Context) {
	roomIDStr := c.Param("room_id")
	roomID, err := uuid.Parse(roomIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid room ID",
		})
		return
	}

	limitStr := c.DefaultQuery("limit", "50")
	limit, _ := strconv.Atoi(limitStr)

	messages, err := h.service.GetRoomMessages(roomID, limit)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, messages)
}

// DeleteMessage godoc
// @Summary Delete chat message
// @Description Mark a chat message as deleted
// @Tags chat
// @Produce json
// @Security BearerAuth
// @Param room_id path string true "Room ID"
// @Param message_id path string true "Message ID"
// @Success 200 {object} map[string]interface{}
// @Router /rooms/{room_id}/messages/{message_id} [delete]
func (h *Handler) DeleteMessage(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	messageIDStr := c.Param("message_id")
	messageID, err := uuid.Parse(messageIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid message ID",
		})
		return
	}

	if err := h.service.DeleteMessage(messageID, userID); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Message deleted successfully",
	})
}
