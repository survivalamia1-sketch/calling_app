package scheduled_meetings

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

// CreateScheduledMeeting godoc
// @Summary Create scheduled meeting
// @Description Create a new scheduled meeting
// @Tags scheduled-meetings
// @Accept json
// @Produce json
// @Security BearerAuth
// @Param input body CreateScheduledMeetingInput true "Meeting details"
// @Success 201 {object} models.ScheduledMeeting
// @Failure 400 {object} map[string]interface{}
// @Router /scheduled-meetings [post]
func (h *Handler) CreateScheduledMeeting(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	var input CreateScheduledMeetingInput
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error":   "Invalid input",
			"details": err.Error(),
		})
		return
	}

	meeting, err := h.service.CreateScheduledMeeting(userID, input)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusCreated, meeting)
}

// GetScheduledMeetings godoc
// @Summary Get scheduled meetings
// @Description Get all scheduled meetings for the user
// @Tags scheduled-meetings
// @Produce json
// @Security BearerAuth
// @Param status query string false "Filter by status (scheduled, in_progress, completed, cancelled)"
// @Success 200 {array} models.ScheduledMeeting
// @Router /scheduled-meetings [get]
func (h *Handler) GetScheduledMeetings(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	status := c.Query("status")

	meetings, err := h.service.GetScheduledMeetings(userID, status)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, meetings)
}

// GetScheduledMeeting godoc
// @Summary Get scheduled meeting
// @Description Get a single scheduled meeting by ID
// @Tags scheduled-meetings
// @Produce json
// @Security BearerAuth
// @Param id path string true "Meeting ID"
// @Success 200 {object} models.ScheduledMeeting
// @Failure 404 {object} map[string]interface{}
// @Router /scheduled-meetings/{id} [get]
func (h *Handler) GetScheduledMeeting(c *gin.Context) {
	meetingIDStr := c.Param("id")
	meetingID, err := uuid.Parse(meetingIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid meeting ID",
		})
		return
	}

	meeting, err := h.service.GetScheduledMeeting(meetingID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, meeting)
}

// UpdateScheduledMeeting godoc
// @Summary Update scheduled meeting
// @Description Update a scheduled meeting
// @Tags scheduled-meetings
// @Accept json
// @Produce json
// @Security BearerAuth
// @Param id path string true "Meeting ID"
// @Param input body UpdateScheduledMeetingInput true "Updated meeting details"
// @Success 200 {object} models.ScheduledMeeting
// @Failure 400 {object} map[string]interface{}
// @Router /scheduled-meetings/{id} [put]
func (h *Handler) UpdateScheduledMeeting(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	meetingIDStr := c.Param("id")
	meetingID, err := uuid.Parse(meetingIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid meeting ID",
		})
		return
	}

	var input UpdateScheduledMeetingInput
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error":   "Invalid input",
			"details": err.Error(),
		})
		return
	}

	meeting, err := h.service.UpdateScheduledMeeting(meetingID, userID, input)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, meeting)
}

// DeleteScheduledMeeting godoc
// @Summary Delete scheduled meeting
// @Description Delete a scheduled meeting
// @Tags scheduled-meetings
// @Produce json
// @Security BearerAuth
// @Param id path string true "Meeting ID"
// @Success 200 {object} map[string]interface{}
// @Failure 400 {object} map[string]interface{}
// @Router /scheduled-meetings/{id} [delete]
func (h *Handler) DeleteScheduledMeeting(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	meetingIDStr := c.Param("id")
	meetingID, err := uuid.Parse(meetingIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid meeting ID",
		})
		return
	}

	if err := h.service.DeleteScheduledMeeting(meetingID, userID); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Meeting deleted successfully",
	})
}

// StartScheduledMeeting godoc
// @Summary Start scheduled meeting
// @Description Start a scheduled meeting and convert it to an active room
// @Tags scheduled-meetings
// @Produce json
// @Security BearerAuth
// @Param id path string true "Meeting ID"
// @Success 200 {object} models.Room
// @Failure 400 {object} map[string]interface{}
// @Router /scheduled-meetings/{id}/start [post]
func (h *Handler) StartScheduledMeeting(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	meetingIDStr := c.Param("id")
	meetingID, err := uuid.Parse(meetingIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid meeting ID",
		})
		return
	}

	room, err := h.service.StartScheduledMeeting(meetingID, userID)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, room)
}

// GetUpcomingMeetings godoc
// @Summary Get upcoming meetings
// @Description Get all upcoming scheduled meetings for the user
// @Tags scheduled-meetings
// @Produce json
// @Security BearerAuth
// @Success 200 {array} models.ScheduledMeeting
// @Router /scheduled-meetings/upcoming [get]
func (h *Handler) GetUpcomingMeetings(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	meetings, err := h.service.GetUpcomingMeetings(userID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, meetings)
}
