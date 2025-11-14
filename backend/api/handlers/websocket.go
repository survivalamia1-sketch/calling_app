package handlers

import (
	"net/http"

	"calling_app/backend/internal/signaling"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/gorilla/websocket"
)

var upgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
	CheckOrigin: func(r *http.Request) bool {
		// Allow all origins in development
		// In production, check against allowed origins
		return true
	},
}

type WebSocketHandler struct {
	hub *signaling.Hub
}

func NewWebSocketHandler(hub *signaling.Hub) *WebSocketHandler {
	return &WebSocketHandler{hub: hub}
}

// HandleWebSocket handles WebSocket connections for signaling
func (h *WebSocketHandler) HandleWebSocket(c *gin.Context) {
	roomID := c.Query("room_id")
	if roomID == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "room_id is required"})
		return
	}

	// Get user ID from context (set by auth middleware)
	userID, exists := c.Get("user_id")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "unauthorized"})
		return
	}

	conn, err := upgrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to upgrade connection"})
		return
	}

	clientID := uuid.New().String()
	client := signaling.NewClient(clientID, roomID, userID.(string), conn, h.hub)

	// Register client
	h.hub.Register() <- client

	// Start goroutines for reading and writing
	go client.WritePump()
	go client.ReadPump()
}

// GetRoomStats returns statistics about a room
func (h *WebSocketHandler) GetRoomStats(c *gin.Context) {
	roomID := c.Param("room_id")
	if roomID == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "room_id is required"})
		return
	}

	stats := h.hub.GetRoomStats(roomID)
	c.JSON(http.StatusOK, stats)
}
