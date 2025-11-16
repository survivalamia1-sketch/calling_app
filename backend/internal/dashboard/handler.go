package dashboard

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
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

// GetDashboardStats godoc
// @Summary Get dashboard statistics
// @Description Get dashboard statistics for the authenticated user
// @Tags dashboard
// @Produce json
// @Security BearerAuth
// @Success 200 {object} DashboardStats
// @Failure 401 {object} map[string]interface{}
// @Router /dashboard/stats [get]
func (h *Handler) GetDashboardStats(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	stats, err := h.service.GetDashboardStats(userID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, stats)
}

// GetUpcomingMeetings godoc
// @Summary Get upcoming meetings
// @Description Get upcoming meetings for the authenticated user
// @Tags dashboard
// @Produce json
// @Security BearerAuth
// @Param limit query int false "Number of meetings to return (default: 5)"
// @Success 200 {object} map[string]interface{}
// @Failure 401 {object} map[string]interface{}
// @Router /dashboard/upcoming-meetings [get]
func (h *Handler) GetUpcomingMeetings(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	// Get limit from query params
	limit := 5
	if limitStr := c.Query("limit"); limitStr != "" {
		if parsedLimit, err := strconv.Atoi(limitStr); err == nil && parsedLimit > 0 {
			limit = parsedLimit
		}
	}

	meetings, err := h.service.GetUpcomingMeetings(userID, limit)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"meetings": meetings,
	})
}
