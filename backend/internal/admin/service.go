package admin

import (
	"errors"
	"fmt"
	"time"

	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/database"
	"gorm.io/gorm"
)

type AdminService struct{}

func NewAdminService() *AdminService {
	return &AdminService{}
}

// ===== USER MANAGEMENT =====

type UserListFilter struct {
	Search          string `form:"search"`
	SubscriptionPlan string `form:"plan"`
	IsActive        *bool  `form:"is_active"`
	Page            int    `form:"page"`
	PageSize        int    `form:"page_size"`
}

type PaginatedUsers struct {
	Users      []models.User `json:"users"`
	Total      int64         `json:"total"`
	Page       int           `json:"page"`
	PageSize   int           `json:"page_size"`
	TotalPages int           `json:"total_pages"`
}

// GetAllUsers retrieves all users with filtering and pagination
func (s *AdminService) GetAllUsers(filter UserListFilter) (*PaginatedUsers, error) {
	db := database.GetDB()

	// Set defaults
	if filter.Page < 1 {
		filter.Page = 1
	}
	if filter.PageSize < 1 || filter.PageSize > 100 {
		filter.PageSize = 20
	}

	query := db.Model(&models.User{}).Preload("Subscription.Plan")

	// Apply filters
	if filter.Search != "" {
		search := "%" + filter.Search + "%"
		query = query.Where("email LIKE ? OR first_name LIKE ? OR last_name LIKE ?", search, search, search)
	}

	if filter.IsActive != nil {
		query = query.Where("is_active = ?", *filter.IsActive)
	}

	// Count total
	var total int64
	if err := query.Count(&total).Error; err != nil {
		return nil, err
	}

	// Get paginated results
	offset := (filter.Page - 1) * filter.PageSize
	var users []models.User
	if err := query.Offset(offset).Limit(filter.PageSize).Order("created_at DESC").Find(&users).Error; err != nil {
		return nil, err
	}

	totalPages := int(total) / filter.PageSize
	if int(total)%filter.PageSize > 0 {
		totalPages++
	}

	return &PaginatedUsers{
		Users:      users,
		Total:      total,
		Page:       filter.Page,
		PageSize:   filter.PageSize,
		TotalPages: totalPages,
	}, nil
}

// GetUserDetails gets detailed user information
func (s *AdminService) GetUserDetails(userID uuid.UUID) (map[string]interface{}, error) {
	db := database.GetDB()

	var user models.User
	if err := db.Preload("Subscription.Plan").First(&user, userID).Error; err != nil {
		return nil, err
	}

	// Get user's rooms
	var rooms []models.Room
	db.Where("host_id = ?", userID).Order("created_at DESC").Limit(10).Find(&rooms)

	// Get payment history
	var payments []models.Payment
	db.Where("user_id = ?", userID).Order("created_at DESC").Limit(10).Find(&payments)

	return map[string]interface{}{
		"user":     user,
		"rooms":    rooms,
		"payments": payments,
	}, nil
}

// ActivateUser activates a user account
func (s *AdminService) ActivateUser(userID uuid.UUID) error {
	db := database.GetDB()
	return db.Model(&models.User{}).Where("id = ?", userID).Update("is_active", true).Error
}

// DeactivateUser deactivates a user account
func (s *AdminService) DeactivateUser(userID uuid.UUID) error {
	db := database.GetDB()
	return db.Model(&models.User{}).Where("id = ?", userID).Update("is_active", false).Error
}

// ResetUserPassword resets a user's password (admin action)
func (s *AdminService) ResetUserPassword(userID uuid.UUID, newPassword string) error {
	db := database.GetDB()

	var user models.User
	if err := db.First(&user, userID).Error; err != nil {
		return err
	}

	if err := user.HashPassword(newPassword); err != nil {
		return err
	}

	return db.Save(&user).Error
}

// ===== SUBSCRIPTION MANAGEMENT =====

type SubscriptionListFilter struct {
	Status   string `form:"status"`
	PlanType string `form:"plan_type"`
	Page     int    `form:"page"`
	PageSize int    `form:"page_size"`
}

type PaginatedSubscriptions struct {
	Subscriptions []models.Subscription `json:"subscriptions"`
	Total         int64                 `json:"total"`
	Page          int                   `json:"page"`
	PageSize      int                   `json:"page_size"`
	TotalPages    int                   `json:"total_pages"`
}

// GetAllSubscriptions retrieves all subscriptions
func (s *AdminService) GetAllSubscriptions(filter SubscriptionListFilter) (*PaginatedSubscriptions, error) {
	db := database.GetDB()

	if filter.Page < 1 {
		filter.Page = 1
	}
	if filter.PageSize < 1 || filter.PageSize > 100 {
		filter.PageSize = 20
	}

	query := db.Model(&models.Subscription{}).Preload("User").Preload("Plan")

	if filter.Status != "" {
		query = query.Where("status = ?", filter.Status)
	}

	var total int64
	query.Count(&total)

	offset := (filter.Page - 1) * filter.PageSize
	var subscriptions []models.Subscription
	if err := query.Offset(offset).Limit(filter.PageSize).Order("created_at DESC").Find(&subscriptions).Error; err != nil {
		return nil, err
	}

	totalPages := int(total) / filter.PageSize
	if int(total)%filter.PageSize > 0 {
		totalPages++
	}

	return &PaginatedSubscriptions{
		Subscriptions: subscriptions,
		Total:         total,
		Page:          filter.Page,
		PageSize:      filter.PageSize,
		TotalPages:    totalPages,
	}, nil
}

// ManuallyUpgradeSubscription upgrades a user's subscription (admin action)
func (s *AdminService) ManuallyUpgradeSubscription(userID uuid.UUID, planType models.PlanType) error {
	db := database.GetDB()

	var plan models.SubscriptionPlan
	if err := db.Where("type = ?", planType).First(&plan).Error; err != nil {
		return errors.New("plan not found")
	}

	var subscription models.Subscription
	if err := db.Where("user_id = ?", userID).First(&subscription).Error; err != nil {
		return errors.New("subscription not found")
	}

	subscription.PlanID = plan.ID
	subscription.Status = models.StatusActive
	now := time.Now()
	subscription.CurrentPeriodStart = &now
	endDate := now.AddDate(0, 1, 0) // Add 1 month
	subscription.CurrentPeriodEnd = &endDate

	return db.Save(&subscription).Error
}

// ExtendSubscription extends a subscription by days (admin action)
func (s *AdminService) ExtendSubscription(subscriptionID uuid.UUID, days int) error {
	db := database.GetDB()

	var subscription models.Subscription
	if err := db.First(&subscription, subscriptionID).Error; err != nil {
		return err
	}

	if subscription.CurrentPeriodEnd != nil {
		newEnd := subscription.CurrentPeriodEnd.AddDate(0, 0, days)
		subscription.CurrentPeriodEnd = &newEnd
	} else {
		now := time.Now()
		newEnd := now.AddDate(0, 0, days)
		subscription.CurrentPeriodEnd = &newEnd
	}

	return db.Save(&subscription).Error
}

// CancelSubscription cancels a subscription (admin action)
func (s *AdminService) CancelSubscription(subscriptionID uuid.UUID) error {
	db := database.GetDB()

	var subscription models.Subscription
	if err := db.First(&subscription, subscriptionID).Error; err != nil {
		return err
	}

	now := time.Now()
	subscription.Status = models.StatusCanceled
	subscription.CanceledAt = &now

	return db.Save(&subscription).Error
}

// ===== ROOM MANAGEMENT =====

type RoomListFilter struct {
	Status   string `form:"status"`
	Page     int    `form:"page"`
	PageSize int    `form:"page_size"`
}

type PaginatedRooms struct {
	Rooms      []models.Room `json:"rooms"`
	Total      int64         `json:"total"`
	Page       int           `json:"page"`
	PageSize   int           `json:"page_size"`
	TotalPages int           `json:"total_pages"`
}

// GetAllRooms retrieves all rooms
func (s *AdminService) GetAllRooms(filter RoomListFilter) (*PaginatedRooms, error) {
	db := database.GetDB()

	if filter.Page < 1 {
		filter.Page = 1
	}
	if filter.PageSize < 1 || filter.PageSize > 100 {
		filter.PageSize = 20
	}

	query := db.Model(&models.Room{}).Preload("Host").Preload("Participants")

	if filter.Status != "" {
		query = query.Where("status = ?", filter.Status)
	}

	var total int64
	query.Count(&total)

	offset := (filter.Page - 1) * filter.PageSize
	var rooms []models.Room
	if err := query.Offset(offset).Limit(filter.PageSize).Order("created_at DESC").Find(&rooms).Error; err != nil {
		return nil, err
	}

	totalPages := int(total) / filter.PageSize
	if int(total)%filter.PageSize > 0 {
		totalPages++
	}

	return &PaginatedRooms{
		Rooms:      rooms,
		Total:      total,
		Page:       filter.Page,
		PageSize:   filter.PageSize,
		TotalPages: totalPages,
	}, nil
}

// ForceEndRoom ends a room immediately (admin action)
func (s *AdminService) ForceEndRoom(roomID uuid.UUID) error {
	db := database.GetDB()

	var room models.Room
	if err := db.First(&room, roomID).Error; err != nil {
		return err
	}

	room.End()

	// Mark all participants as left
	now := time.Now()
	db.Model(&models.RoomParticipant{}).
		Where("room_id = ? AND left_at IS NULL", roomID).
		Update("left_at", now)

	return db.Save(&room).Error
}

// ===== ANALYTICS =====

type DashboardStats struct {
	TotalUsers           int64   `json:"total_users"`
	ActiveUsers          int64   `json:"active_users"`
	TotalSubscriptions   int64   `json:"total_subscriptions"`
	ActiveSubscriptions  int64   `json:"active_subscriptions"`
	TotalRevenue         float64 `json:"total_revenue"`
	MonthlyRevenue       float64 `json:"monthly_revenue"`
	ActiveMeetings       int64   `json:"active_meetings"`
	TotalMeetings        int64   `json:"total_meetings"`
	EmailVerifiedUsers   int64   `json:"email_verified_users"`
	FreeUsers            int64   `json:"free_users"`
	ProUsers             int64   `json:"pro_users"`
	BusinessUsers        int64   `json:"business_users"`
}

// GetDashboardStats returns dashboard KPIs
func (s *AdminService) GetDashboardStats() (*DashboardStats, error) {
	db := database.GetDB()
	stats := &DashboardStats{}

	// Total users
	db.Model(&models.User{}).Count(&stats.TotalUsers)

	// Active users
	db.Model(&models.User{}).Where("is_active = ?", true).Count(&stats.ActiveUsers)

	// Email verified users
	db.Model(&models.User{}).Where("email_verified = ?", true).Count(&stats.EmailVerifiedUsers)

	// Total subscriptions
	db.Model(&models.Subscription{}).Count(&stats.TotalSubscriptions)

	// Active subscriptions
	db.Model(&models.Subscription{}).Where("status = ?", models.StatusActive).Count(&stats.ActiveSubscriptions)

	// Calculate revenue
	var payments []models.Payment
	db.Where("status = ?", models.PaymentStatusSucceeded).Find(&payments)
	for _, p := range payments {
		stats.TotalRevenue += float64(p.Amount) / 100
	}

	// Monthly revenue (current month)
	startOfMonth := time.Now().AddDate(0, 0, -time.Now().Day()+1)
	var monthlyPayments []models.Payment
	db.Where("status = ? AND created_at >= ?", models.PaymentStatusSucceeded, startOfMonth).Find(&monthlyPayments)
	for _, p := range monthlyPayments {
		stats.MonthlyRevenue += float64(p.Amount) / 100
	}

	// Meetings
	db.Model(&models.Room{}).Count(&stats.TotalMeetings)
	db.Model(&models.Room{}).Where("status = ?", models.RoomStatusActive).Count(&stats.ActiveMeetings)

	// Users by plan
	db.Table("subscriptions").
		Joins("JOIN subscription_plans ON subscriptions.plan_id = subscription_plans.id").
		Where("subscription_plans.type = ?", models.PlanFree).
		Count(&stats.FreeUsers)

	db.Table("subscriptions").
		Joins("JOIN subscription_plans ON subscriptions.plan_id = subscription_plans.id").
		Where("subscription_plans.type = ?", models.PlanPro).
		Count(&stats.ProUsers)

	db.Table("subscriptions").
		Joins("JOIN subscription_plans ON subscriptions.plan_id = subscription_plans.id").
		Where("subscription_plans.type = ?", models.PlanBusiness).
		Count(&stats.BusinessUsers)

	return stats, nil
}

// GetRevenueChart returns revenue data for charts
func (s *AdminService) GetRevenueChart(days int) ([]map[string]interface{}, error) {
	db := database.GetDB()

	if days < 1 || days > 365 {
		days = 30
	}

	startDate := time.Now().AddDate(0, 0, -days)

	type DailyRevenue struct {
		Date   string
		Amount float64
	}

	var results []map[string]interface{}
	rows, err := db.Table("payments").
		Select("DATE(created_at) as date, SUM(amount) as amount").
		Where("status = ? AND created_at >= ?", models.PaymentStatusSucceeded, startDate).
		Group("DATE(created_at)").
		Order("date ASC").
		Rows()

	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var date string
		var amount int64
		rows.Scan(&date, &amount)
		results = append(results, map[string]interface{}{
			"date":   date,
			"amount": float64(amount) / 100,
		})
	}

	return results, nil
}

// GetSignupsChart returns signup data for charts
func (s *AdminService) GetSignupsChart(days int) ([]map[string]interface{}, error) {
	db := database.GetDB()

	if days < 1 || days > 365 {
		days = 30
	}

	startDate := time.Now().AddDate(0, 0, -days)

	var results []map[string]interface{}
	rows, err := db.Table("users").
		Select("DATE(created_at) as date, COUNT(*) as count").
		Where("created_at >= ?", startDate).
		Group("DATE(created_at)").
		Order("date ASC").
		Rows()

	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var date string
		var count int64
		rows.Scan(&date, &count)
		results = append(results, map[string]interface{}{
			"date":  date,
			"count": count,
		})
	}

	return results, nil
}

// ===== PAYMENTS =====

type PaymentListFilter struct {
	UserID   string `form:"user_id"`
	Status   string `form:"status"`
	Page     int    `form:"page"`
	PageSize int    `form:"page_size"`
}

type PaginatedPayments struct {
	Payments   []models.Payment `json:"payments"`
	Total      int64            `json:"total"`
	Page       int              `json:"page"`
	PageSize   int              `json:"page_size"`
	TotalPages int              `json:"total_pages"`
}

// GetAllPayments retrieves all payment transactions
func (s *AdminService) GetAllPayments(filter PaymentListFilter) (*PaginatedPayments, error) {
	db := database.GetDB()

	if filter.Page < 1 {
		filter.Page = 1
	}
	if filter.PageSize < 1 || filter.PageSize > 100 {
		filter.PageSize = 20
	}

	query := db.Model(&models.Payment{}).Preload("User").Preload("Subscription")

	if filter.UserID != "" {
		userID, err := uuid.Parse(filter.UserID)
		if err == nil {
			query = query.Where("user_id = ?", userID)
		}
	}

	if filter.Status != "" {
		query = query.Where("status = ?", filter.Status)
	}

	var total int64
	query.Count(&total)

	offset := (filter.Page - 1) * filter.PageSize
	var payments []models.Payment
	if err := query.Offset(offset).Limit(filter.PageSize).Order("created_at DESC").Find(&payments).Error; err != nil {
		return nil, err
	}

	totalPages := int(total) / filter.PageSize
	if int(total)%filter.PageSize > 0 {
		totalPages++
	}

	return &PaginatedPayments{
		Payments:   payments,
		Total:      total,
		Page:       filter.Page,
		PageSize:   filter.PageSize,
		TotalPages: totalPages,
	}, nil
}

// ===== SYSTEM SETTINGS =====

// GetSystemSettings retrieves all system settings
func (s *AdminService) GetSystemSettings() ([]models.SystemSettings, error) {
	db := database.GetDB()

	var settings []models.SystemSettings
	if err := db.Order("category ASC, key ASC").Find(&settings).Error; err != nil {
		return nil, err
	}

	return settings, nil
}

// UpdateSystemSetting updates a system setting
func (s *AdminService) UpdateSystemSetting(key, value string) error {
	db := database.GetDB()

	var setting models.SystemSettings
	result := db.Where("key = ?", key).First(&setting)

	if result.RowsAffected == 0 {
		return errors.New("setting not found")
	}

	setting.Value = value
	return db.Save(&setting).Error
}

// GetAuditLogs retrieves admin activity logs
func (s *AdminService) GetAuditLogs(page, pageSize int) ([]models.AuditLog, int64, error) {
	db := database.GetDB()

	if page < 1 {
		page = 1
	}
	if pageSize < 1 || pageSize > 100 {
		pageSize = 50
	}

	var total int64
	db.Model(&models.AuditLog{}).Count(&total)

	offset := (page - 1) * pageSize
	var logs []models.AuditLog
	if err := db.Preload("Admin").Offset(offset).Limit(pageSize).Order("created_at DESC").Find(&logs).Error; err != nil {
		return nil, 0, err
	}

	return logs, total, nil
}
