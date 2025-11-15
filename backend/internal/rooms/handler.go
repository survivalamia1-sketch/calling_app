package rooms

import (
	"net/http"

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

// CreateRoom godoc
// @Summary Create room
// @Description Create a new meeting room
// @Tags rooms
// @Accept json
// @Produce json
// @Security BearerAuth
// @Param input body CreateRoomInput true "Room details"
// @Success 201 {object} models.Room
// @Failure 400 {object} map[string]interface{}
// @Router /rooms [post]
func (h *Handler) CreateRoom(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	var input CreateRoomInput
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error":   "Invalid input",
			"details": err.Error(),
		})
		return
	}

	room, err := h.service.CreateRoom(userID, input)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusCreated, room)
}

// GetRoom godoc
// @Summary Get room
// @Description Get room details by ID
// @Tags rooms
// @Produce json
// @Param id path string true "Room ID"
// @Success 200 {object} models.Room
// @Failure 404 {object} map[string]interface{}
// @Router /rooms/{id} [get]
func (h *Handler) GetRoom(c *gin.Context) {
	roomIDStr := c.Param("id")
	roomID, err := uuid.Parse(roomIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid room ID",
		})
		return
	}

	room, err := h.service.GetRoom(roomID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, room)
}

// GetUserRooms godoc
// @Summary Get user rooms
// @Description Get all rooms created by the user
// @Tags rooms
// @Produce json
// @Security BearerAuth
// @Success 200 {array} models.Room
// @Router /rooms [get]
func (h *Handler) GetUserRooms(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	rooms, err := h.service.GetUserRooms(userID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, rooms)
}

// JoinRoom godoc
// @Summary Join room
// @Description Join a meeting room
// @Tags rooms
// @Accept json
// @Produce json
// @Security BearerAuth (optional)
// @Param id path string true "Room ID"
// @Param input body JoinRoomInput true "Join details"
// @Success 200 {object} models.RoomParticipant
// @Failure 400 {object} map[string]interface{}
// @Router /rooms/{id}/join [post]
func (h *Handler) JoinRoom(c *gin.Context) {
	roomIDStr := c.Param("id")
	roomID, err := uuid.Parse(roomIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid room ID",
		})
		return
	}

	// Get user ID (optional - can be guest)
	userID, _ := middleware.GetUserID(c)

	var input JoinRoomInput
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid input",
		})
		return
	}

	participant, err := h.service.JoinRoom(roomID, userID, input)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, participant)
}

// LeaveRoom godoc
// @Summary Leave room
// @Description Leave a meeting room
// @Tags rooms
// @Produce json
// @Security BearerAuth
// @Param id path string true "Room ID"
// @Success 200 {object} map[string]interface{}
// @Router /rooms/{id}/leave [post]
func (h *Handler) LeaveRoom(c *gin.Context) {
	roomIDStr := c.Param("id")
	roomID, err := uuid.Parse(roomIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid room ID",
		})
		return
	}

	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	if err := h.service.LeaveRoom(roomID, userID); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Left room successfully",
	})
}

// EndRoom godoc
// @Summary End room
// @Description End a meeting room (host only)
// @Tags rooms
// @Produce json
// @Security BearerAuth
// @Param id path string true "Room ID"
// @Success 200 {object} map[string]interface{}
// @Router /rooms/{id}/end [post]
func (h *Handler) EndRoom(c *gin.Context) {
	roomIDStr := c.Param("id")
	roomID, err := uuid.Parse(roomIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid room ID",
		})
		return
	}

	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	if err := h.service.EndRoom(roomID, userID); err != nil {
		c.JSON(http.StatusForbidden, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Room ended successfully",
	})
}

// DeleteRoom godoc
// @Summary Delete room
// @Description Delete a room (host only)
// @Tags rooms
// @Produce json
// @Security BearerAuth
// @Param id path string true "Room ID"
// @Success 200 {object} map[string]interface{}
// @Router /rooms/{id} [delete]
func (h *Handler) DeleteRoom(c *gin.Context) {
	roomIDStr := c.Param("id")
	roomID, err := uuid.Parse(roomIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid room ID",
		})
		return
	}

	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	if err := h.service.DeleteRoom(roomID, userID); err != nil {
		c.JSON(http.StatusForbidden, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Room deleted successfully",
	})
}

// GetRoomParticipants godoc
// @Summary Get room participants
// @Description Get all participants in a room
// @Tags rooms
// @Produce json
// @Param id path string true "Room ID"
// @Success 200 {array} models.RoomParticipant
// @Router /rooms/{id}/participants [get]
func (h *Handler) GetRoomParticipants(c *gin.Context) {
	roomIDStr := c.Param("id")
	roomID, err := uuid.Parse(roomIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid room ID",
		})
		return
	}

	participants, err := h.service.GetRoomParticipants(roomID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, participants)
}

// GetRoomStatus godoc
// @Summary Get room status
// @Description Get room status including remaining time
// @Tags rooms
// @Produce json
// @Param id path string true "Room ID"
// @Success 200 {object} map[string]interface{}
// @Router /rooms/{id}/status [get]
func (h *Handler) GetRoomStatus(c *gin.Context) {
	roomIDStr := c.Param("id")
	if roomIDStr == "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Room ID is required",
		})
		return
	}

	roomID, err := uuid.Parse(roomIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid room ID",
		})
		return
	}

	status, err := h.service.GetRoomStatus(roomID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, status)
}
