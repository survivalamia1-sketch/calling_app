package admin

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/middleware"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/config"
)

type Handler struct {
	authService  *AuthService
	adminService *AdminService
	config       *config.Config
}

func NewHandler(cfg *config.Config) *Handler {
	return &Handler{
		authService:  NewAuthService(cfg),
		adminService: NewAdminService(),
		config:       cfg,
	}
}

// ===== AUTHENTICATION =====

// Login godoc
// @Summary Admin login
// @Description Authenticate admin and return JWT token
// @Tags admin
// @Accept json
// @Produce json
// @Param input body AdminLoginInput true "Login credentials"
// @Success 200 {object} AdminAuthResponse
// @Router /admin/auth/login [post]
func (h *Handler) Login(c *gin.Context) {
	var input AdminLoginInput

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid input",
		})
		return
	}

	response, err := h.authService.Login(input)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, response)
}

// GetProfile godoc
// @Summary Get admin profile
// @Description Get authenticated admin profile
// @Tags admin
// @Produce json
// @Security BearerAuth
// @Success 200 {object} models.PublicAdmin
// @Router /admin/auth/profile [get]
func (h *Handler) GetProfile(c *gin.Context) {
	adminID, exists := middleware.GetAdminID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	admin, err := h.authService.GetAdminByID(adminID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, admin.ToPublic())
}

// ChangePassword godoc
// @Summary Change admin password
// @Description Change current admin's password
// @Tags admin
// @Accept json
// @Produce json
// @Security BearerAuth
// @Success 200 {object} map[string]interface{}
// @Router /admin/auth/change-password [post]
func (h *Handler) ChangePassword(c *gin.Context) {
	adminID, exists := middleware.GetAdminID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	var input struct {
		OldPassword string `json:"old_password" binding:"required"`
		NewPassword string `json:"new_password" binding:"required,min=8"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid input",
		})
		return
	}

	if err := h.authService.ChangePassword(adminID, input.OldPassword, input.NewPassword); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Password changed successfully",
	})
}

// CreateAdmin godoc
// @Summary Create new admin
// @Description Create a new admin user (super admin only)
// @Tags admin
// @Accept json
// @Produce json
// @Security BearerAuth
// @Success 201 {object} models.PublicAdmin
// @Router /admin/admins [post]
func (h *Handler) CreateAdmin(c *gin.Context) {
	var input struct {
		Email     string           `json:"email" binding:"required,email"`
		Password  string           `json:"password" binding:"required,min=8"`
		FirstName string           `json:"first_name" binding:"required"`
		LastName  string           `json:"last_name" binding:"required"`
		Role      models.AdminRole `json:"role" binding:"required"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid input",
		})
		return
	}

	admin, err := h.authService.CreateAdmin(input.Email, input.Password, input.FirstName, input.LastName, input.Role)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusCreated, admin.ToPublic())
}

// ===== USER MANAGEMENT =====

// GetAllUsers godoc
// @Summary Get all users
// @Description Retrieve all users with filtering and pagination
// @Tags admin-users
// @Produce json
// @Security BearerAuth
// @Success 200 {object} PaginatedUsers
// @Router /admin/users [get]
func (h *Handler) GetAllUsers(c *gin.Context) {
	var filter UserListFilter
	if err := c.ShouldBindQuery(&filter); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid query parameters",
		})
		return
	}

	users, err := h.adminService.GetAllUsers(filter)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, users)
}

// GetUserDetails godoc
// @Summary Get user details
// @Description Get detailed information about a specific user
// @Tags admin-users
// @Produce json
// @Security BearerAuth
// @Param id path string true "User ID"
// @Success 200 {object} map[string]interface{}
// @Router /admin/users/{id} [get]
func (h *Handler) GetUserDetails(c *gin.Context) {
	userIDStr := c.Param("id")
	userID, err := uuid.Parse(userIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid user ID",
		})
		return
	}

	details, err := h.adminService.GetUserDetails(userID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, details)
}

// ActivateUser godoc
// @Summary Activate user
// @Description Activate a user account
// @Tags admin-users
// @Produce json
// @Security BearerAuth
// @Param id path string true "User ID"
// @Success 200 {object} map[string]interface{}
// @Router /admin/users/{id}/activate [post]
func (h *Handler) ActivateUser(c *gin.Context) {
	userIDStr := c.Param("id")
	userID, err := uuid.Parse(userIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid user ID",
		})
		return
	}

	if err := h.adminService.ActivateUser(userID); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "User activated successfully",
	})
}

// DeactivateUser godoc
// @Summary Deactivate user
// @Description Deactivate a user account
// @Tags admin-users
// @Produce json
// @Security BearerAuth
// @Param id path string true "User ID"
// @Success 200 {object} map[string]interface{}
// @Router /admin/users/{id}/deactivate [post]
func (h *Handler) DeactivateUser(c *gin.Context) {
	userIDStr := c.Param("id")
	userID, err := uuid.Parse(userIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid user ID",
		})
		return
	}

	if err := h.adminService.DeactivateUser(userID); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "User deactivated successfully",
	})
}

// ResetUserPassword godoc
// @Summary Reset user password
// @Description Reset a user's password (admin action)
// @Tags admin-users
// @Accept json
// @Produce json
// @Security BearerAuth
// @Param id path string true "User ID"
// @Success 200 {object} map[string]interface{}
// @Router /admin/users/{id}/reset-password [post]
func (h *Handler) ResetUserPassword(c *gin.Context) {
	userIDStr := c.Param("id")
	userID, err := uuid.Parse(userIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid user ID",
		})
		return
	}

	var input struct {
		NewPassword string `json:"new_password" binding:"required,min=8"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid input",
		})
		return
	}

	if err := h.adminService.ResetUserPassword(userID, input.NewPassword); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Password reset successfully",
	})
}

// ===== SUBSCRIPTION MANAGEMENT =====

// GetAllSubscriptions godoc
// @Summary Get all subscriptions
// @Description Retrieve all subscriptions with filtering and pagination
// @Tags admin-subscriptions
// @Produce json
// @Security BearerAuth
// @Success 200 {object} PaginatedSubscriptions
// @Router /admin/subscriptions [get]
func (h *Handler) GetAllSubscriptions(c *gin.Context) {
	var filter SubscriptionListFilter
	if err := c.ShouldBindQuery(&filter); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid query parameters",
		})
		return
	}

	subscriptions, err := h.adminService.GetAllSubscriptions(filter)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, subscriptions)
}

// ManuallyUpgradeSubscription godoc
// @Summary Manually upgrade subscription
// @Description Upgrade a user's subscription plan (admin action)
// @Tags admin-subscriptions
// @Accept json
// @Produce json
// @Security BearerAuth
// @Param user_id path string true "User ID"
// @Success 200 {object} map[string]interface{}
// @Router /admin/subscriptions/upgrade/{user_id} [post]
func (h *Handler) ManuallyUpgradeSubscription(c *gin.Context) {
	userIDStr := c.Param("user_id")
	userID, err := uuid.Parse(userIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid user ID",
		})
		return
	}

	var input struct {
		PlanType string `json:"plan_type" binding:"required"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid input",
		})
		return
	}

	planType := models.PlanType(input.PlanType)
	if err := h.adminService.ManuallyUpgradeSubscription(userID, planType); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Subscription upgraded successfully",
	})
}

// ExtendSubscription godoc
// @Summary Extend subscription
// @Description Extend a subscription by specified days
// @Tags admin-subscriptions
// @Accept json
// @Produce json
// @Security BearerAuth
// @Param id path string true "Subscription ID"
// @Success 200 {object} map[string]interface{}
// @Router /admin/subscriptions/{id}/extend [post]
func (h *Handler) ExtendSubscription(c *gin.Context) {
	subIDStr := c.Param("id")
	subID, err := uuid.Parse(subIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid subscription ID",
		})
		return
	}

	var input struct {
		Days int `json:"days" binding:"required,min=1"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid input",
		})
		return
	}

	if err := h.adminService.ExtendSubscription(subID, input.Days); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Subscription extended successfully",
	})
}

// CancelSubscription godoc
// @Summary Cancel subscription
// @Description Cancel a subscription (admin action)
// @Tags admin-subscriptions
// @Produce json
// @Security BearerAuth
// @Param id path string true "Subscription ID"
// @Success 200 {object} map[string]interface{}
// @Router /admin/subscriptions/{id}/cancel [post]
func (h *Handler) CancelSubscription(c *gin.Context) {
	subIDStr := c.Param("id")
	subID, err := uuid.Parse(subIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid subscription ID",
		})
		return
	}

	if err := h.adminService.CancelSubscription(subID); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Subscription canceled successfully",
	})
}

// ===== ROOM/MEETING MANAGEMENT =====

// GetAllRooms godoc
// @Summary Get all rooms
// @Description Retrieve all rooms/meetings
// @Tags admin-rooms
// @Produce json
// @Security BearerAuth
// @Success 200 {object} PaginatedRooms
// @Router /admin/rooms [get]
func (h *Handler) GetAllRooms(c *gin.Context) {
	var filter RoomListFilter
	if err := c.ShouldBindQuery(&filter); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid query parameters",
		})
		return
	}

	rooms, err := h.adminService.GetAllRooms(filter)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, rooms)
}

// ForceEndRoom godoc
// @Summary Force end room
// @Description Force end a meeting room (admin action)
// @Tags admin-rooms
// @Produce json
// @Security BearerAuth
// @Param id path string true "Room ID"
// @Success 200 {object} map[string]interface{}
// @Router /admin/rooms/{id}/end [post]
func (h *Handler) ForceEndRoom(c *gin.Context) {
	roomIDStr := c.Param("id")
	roomID, err := uuid.Parse(roomIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid room ID",
		})
		return
	}

	if err := h.adminService.ForceEndRoom(roomID); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Room ended successfully",
	})
}

// ===== ANALYTICS =====

// GetDashboardStats godoc
// @Summary Get dashboard statistics
// @Description Get dashboard KPIs and statistics
// @Tags admin-analytics
// @Produce json
// @Security BearerAuth
// @Success 200 {object} DashboardStats
// @Router /admin/analytics/dashboard [get]
func (h *Handler) GetDashboardStats(c *gin.Context) {
	stats, err := h.adminService.GetDashboardStats()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, stats)
}

// GetRevenueChart godoc
// @Summary Get revenue chart data
// @Description Get revenue data for charting
// @Tags admin-analytics
// @Produce json
// @Security BearerAuth
// @Param days query int false "Number of days" default(30)
// @Success 200 {array} map[string]interface{}
// @Router /admin/analytics/revenue [get]
func (h *Handler) GetRevenueChart(c *gin.Context) {
	days := c.DefaultQuery("days", "30")
	daysInt := 30
	fmt.Sscanf(days, "%d", &daysInt)

	data, err := h.adminService.GetRevenueChart(daysInt)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, data)
}

// GetSignupsChart godoc
// @Summary Get signups chart data
// @Description Get signup data for charting
// @Tags admin-analytics
// @Produce json
// @Security BearerAuth
// @Param days query int false "Number of days" default(30)
// @Success 200 {array} map[string]interface{}
// @Router /admin/analytics/signups [get]
func (h *Handler) GetSignupsChart(c *gin.Context) {
	days := c.DefaultQuery("days", "30")
	daysInt := 30
	fmt.Sscanf(days, "%d", &daysInt)

	data, err := h.adminService.GetSignupsChart(daysInt)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, data)
}

// ===== PAYMENTS =====

// GetAllPayments godoc
// @Summary Get all payments
// @Description Retrieve all payment transactions
// @Tags admin-payments
// @Produce json
// @Security BearerAuth
// @Success 200 {object} PaginatedPayments
// @Router /admin/payments [get]
func (h *Handler) GetAllPayments(c *gin.Context) {
	var filter PaymentListFilter
	if err := c.ShouldBindQuery(&filter); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid query parameters",
		})
		return
	}

	payments, err := h.adminService.GetAllPayments(filter)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, payments)
}

// ===== SYSTEM SETTINGS =====

// GetSystemSettings godoc
// @Summary Get system settings
// @Description Retrieve all system settings
// @Tags admin-settings
// @Produce json
// @Security BearerAuth
// @Success 200 {array} models.SystemSettings
// @Router /admin/settings [get]
func (h *Handler) GetSystemSettings(c *gin.Context) {
	settings, err := h.adminService.GetSystemSettings()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, settings)
}

// UpdateSystemSetting godoc
// @Summary Update system setting
// @Description Update a specific system setting
// @Tags admin-settings
// @Accept json
// @Produce json
// @Security BearerAuth
// @Success 200 {object} map[string]interface{}
// @Router /admin/settings [put]
func (h *Handler) UpdateSystemSetting(c *gin.Context) {
	var input struct {
		Key   string `json:"key" binding:"required"`
		Value string `json:"value" binding:"required"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid input",
		})
		return
	}

	if err := h.adminService.UpdateSystemSetting(input.Key, input.Value); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Setting updated successfully",
	})
}

// GetAuditLogs godoc
// @Summary Get audit logs
// @Description Retrieve admin activity logs
// @Tags admin-settings
// @Produce json
// @Security BearerAuth
// @Success 200 {object} map[string]interface{}
// @Router /admin/audit-logs [get]
func (h *Handler) GetAuditLogs(c *gin.Context) {
	page := c.DefaultQuery("page", "1")
	pageSize := c.DefaultQuery("page_size", "50")

	pageInt, pageSizeInt := 1, 50
	fmt.Sscanf(page, "%d", &pageInt)
	fmt.Sscanf(pageSize, "%d", &pageSizeInt)

	logs, total, err := h.adminService.GetAuditLogs(pageInt, pageSizeInt)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"logs":  logs,
		"total": total,
		"page":  pageInt,
		"page_size": pageSizeInt,
	})
}
