package admin

import (
	"errors"
	"fmt"
	"time"

	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/config"
	"github.com/yourusername/calling-app-backend/pkg/database"
	"github.com/yourusername/calling-app-backend/pkg/utils"
	"gorm.io/gorm"
)

type AuthService struct {
	config *config.Config
}

func NewAuthService(cfg *config.Config) *AuthService {
	return &AuthService{
		config: cfg,
	}
}

type AdminLoginInput struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required"`
}

type AdminAuthResponse struct {
	Admin        models.PublicAdmin `json:"admin"`
	Token        string             `json:"token"`
	RefreshToken string             `json:"refresh_token"`
}

// Login authenticates an admin
func (s *AuthService) Login(input AdminLoginInput) (*AdminAuthResponse, error) {
	db := database.GetDB()

	// Find admin
	var admin models.Admin
	if err := db.Where("email = ?", input.Email).First(&admin).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("invalid credentials")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	// Check if admin is active
	if !admin.IsActive {
		return nil, errors.New("account is deactivated")
	}

	// Check password
	if !admin.CheckPassword(input.Password) {
		return nil, errors.New("invalid credentials")
	}

	// Update last login
	now := time.Now()
	admin.LastLoginAt = &now
	db.Save(&admin)

	// Generate JWT tokens
	jwtToken, err := utils.GenerateToken(admin.ID, admin.Email, s.config)
	if err != nil {
		return nil, fmt.Errorf("failed to generate token: %w", err)
	}

	refreshToken, err := utils.GenerateRefreshToken(admin.ID, admin.Email, s.config)
	if err != nil {
		return nil, fmt.Errorf("failed to generate refresh token: %w", err)
	}

	return &AdminAuthResponse{
		Admin:        admin.ToPublic(),
		Token:        jwtToken,
		RefreshToken: refreshToken,
	}, nil
}

// GetAdminByID retrieves an admin by ID
func (s *AuthService) GetAdminByID(adminID uuid.UUID) (*models.Admin, error) {
	db := database.GetDB()

	var admin models.Admin
	if err := db.First(&admin, adminID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("admin not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	return &admin, nil
}

// ChangePassword changes admin password
func (s *AuthService) ChangePassword(adminID uuid.UUID, oldPassword, newPassword string) error {
	db := database.GetDB()

	var admin models.Admin
	if err := db.First(&admin, adminID).Error; err != nil {
		return errors.New("admin not found")
	}

	// Verify old password
	if !admin.CheckPassword(oldPassword) {
		return errors.New("invalid current password")
	}

	// Hash new password
	if err := admin.HashPassword(newPassword); err != nil {
		return fmt.Errorf("failed to hash password: %w", err)
	}

	if err := db.Save(&admin).Error; err != nil {
		return fmt.Errorf("failed to update password: %w", err)
	}

	return nil
}

// CreateAdmin creates a new admin (super admin only)
func (s *AuthService) CreateAdmin(email, password, firstName, lastName string, role models.AdminRole) (*models.Admin, error) {
	db := database.GetDB()

	// Check if admin exists
	var existingAdmin models.Admin
	if err := db.Where("email = ?", email).First(&existingAdmin).Error; err == nil {
		return nil, errors.New("admin with this email already exists")
	}

	// Create admin
	admin := models.Admin{
		Email:     email,
		FirstName: firstName,
		LastName:  lastName,
		Role:      role,
		IsActive:  true,
	}

	// Hash password
	if err := admin.HashPassword(password); err != nil {
		return nil, fmt.Errorf("failed to hash password: %w", err)
	}

	if err := db.Create(&admin).Error; err != nil {
		return nil, fmt.Errorf("failed to create admin: %w", err)
	}

	return &admin, nil
}

// DeactivateAdmin deactivates an admin
func (s *AuthService) DeactivateAdmin(adminID uuid.UUID) error {
	db := database.GetDB()

	var admin models.Admin
	if err := db.First(&admin, adminID).Error; err != nil {
		return errors.New("admin not found")
	}

	admin.IsActive = false
	if err := db.Save(&admin).Error; err != nil {
		return fmt.Errorf("failed to deactivate admin: %w", err)
	}

	return nil
}

// ActivateAdmin activates an admin
func (s *AuthService) ActivateAdmin(adminID uuid.UUID) error {
	db := database.GetDB()

	var admin models.Admin
	if err := db.First(&admin, adminID).Error; err != nil {
		return errors.New("admin not found")
	}

	admin.IsActive = true
	if err := db.Save(&admin).Error; err != nil {
		return fmt.Errorf("failed to activate admin: %w", err)
	}

	return nil
}
