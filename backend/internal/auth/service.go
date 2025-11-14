package auth

import (
	"crypto/rand"
	"encoding/hex"
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

type Service struct {
	config       *config.Config
	emailService *utils.EmailService
}

func NewService(cfg *config.Config) *Service {
	return &Service{
		config:       cfg,
		emailService: utils.NewEmailService(cfg),
	}
}

type RegisterInput struct {
	Email     string `json:"email" binding:"required,email"`
	Password  string `json:"password" binding:"required,min=8"`
	FirstName string `json:"first_name" binding:"required"`
	LastName  string `json:"last_name" binding:"required"`
}

type LoginInput struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required"`
}

type AuthResponse struct {
	User         models.PublicUser `json:"user"`
	Token        string            `json:"token"`
	RefreshToken string            `json:"refresh_token"`
}

// Register creates a new user
func (s *Service) Register(input RegisterInput) (*AuthResponse, error) {
	db := database.GetDB()

	// Check if user exists
	var existingUser models.User
	if err := db.Where("email = ?", input.Email).First(&existingUser).Error; err == nil {
		return nil, errors.New("email already registered")
	}

	// Create user
	user := models.User{
		Email:     input.Email,
		FirstName: input.FirstName,
		LastName:  input.LastName,
		IsActive:  true,
	}

	// Hash password
	if err := user.HashPassword(input.Password); err != nil {
		return nil, fmt.Errorf("failed to hash password: %w", err)
	}

	// Generate verification token
	token, err := generateRandomToken(32)
	if err != nil {
		return nil, fmt.Errorf("failed to generate verification token: %w", err)
	}
	user.VerificationToken = token

	// Start transaction
	tx := db.Begin()
	defer func() {
		if r := recover(); r != nil {
			tx.Rollback()
		}
	}()

	// Create user
	if err := tx.Create(&user).Error; err != nil {
		tx.Rollback()
		return nil, fmt.Errorf("failed to create user: %w", err)
	}

	// Get free plan
	var freePlan models.SubscriptionPlan
	if err := tx.Where("type = ?", models.PlanFree).First(&freePlan).Error; err != nil {
		tx.Rollback()
		return nil, fmt.Errorf("failed to get free plan: %w", err)
	}

	// Create free subscription for new user
	subscription := models.Subscription{
		UserID: user.ID,
		PlanID: freePlan.ID,
		Status: models.StatusActive,
	}

	if err := tx.Create(&subscription).Error; err != nil {
		tx.Rollback()
		return nil, fmt.Errorf("failed to create subscription: %w", err)
	}

	// Commit transaction
	if err := tx.Commit().Error; err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}

	// Load subscription with plan
	db.Preload("Plan").First(&subscription, subscription.ID)
	user.Subscription = &subscription

	// Send verification email (async, don't block registration)
	go func() {
		if err := s.emailService.SendVerificationEmail(user.Email, token); err != nil {
			// Log error but don't fail registration
			fmt.Printf("Failed to send verification email: %v\n", err)
		}
	}()

	// Generate JWT tokens
	jwtToken, err := utils.GenerateToken(user.ID, user.Email, s.config)
	if err != nil {
		return nil, fmt.Errorf("failed to generate token: %w", err)
	}

	refreshToken, err := utils.GenerateRefreshToken(user.ID, user.Email, s.config)
	if err != nil {
		return nil, fmt.Errorf("failed to generate refresh token: %w", err)
	}

	return &AuthResponse{
		User:         user.ToPublic(),
		Token:        jwtToken,
		RefreshToken: refreshToken,
	}, nil
}

// Login authenticates a user
func (s *Service) Login(input LoginInput) (*AuthResponse, error) {
	db := database.GetDB()

	// Find user
	var user models.User
	if err := db.Preload("Subscription.Plan").Where("email = ?", input.Email).First(&user).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("invalid credentials")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	// Check if user is active
	if !user.IsActive {
		return nil, errors.New("account is deactivated")
	}

	// Check password
	if !user.CheckPassword(input.Password) {
		return nil, errors.New("invalid credentials")
	}

	// Update last login
	now := time.Now()
	user.LastLoginAt = &now
	db.Save(&user)

	// Generate JWT tokens
	jwtToken, err := utils.GenerateToken(user.ID, user.Email, s.config)
	if err != nil {
		return nil, fmt.Errorf("failed to generate token: %w", err)
	}

	refreshToken, err := utils.GenerateRefreshToken(user.ID, user.Email, s.config)
	if err != nil {
		return nil, fmt.Errorf("failed to generate refresh token: %w", err)
	}

	return &AuthResponse{
		User:         user.ToPublic(),
		Token:        jwtToken,
		RefreshToken: refreshToken,
	}, nil
}

// VerifyEmail verifies a user's email
func (s *Service) VerifyEmail(token string) error {
	db := database.GetDB()

	var user models.User
	if err := db.Where("verification_token = ?", token).First(&user).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return errors.New("invalid verification token")
		}
		return fmt.Errorf("database error: %w", err)
	}

	if user.EmailVerified {
		return errors.New("email already verified")
	}

	// Update user
	now := time.Now()
	user.EmailVerified = true
	user.EmailVerifiedAt = &now
	user.VerificationToken = "" // Clear token

	if err := db.Save(&user).Error; err != nil {
		return fmt.Errorf("failed to verify email: %w", err)
	}

	return nil
}

// RequestPasswordReset initiates password reset
func (s *Service) RequestPasswordReset(email string) error {
	db := database.GetDB()

	var user models.User
	if err := db.Where("email = ?", email).First(&user).Error; err != nil {
		// Don't reveal if email exists
		return nil
	}

	// Generate reset token
	token, err := generateRandomToken(32)
	if err != nil {
		return fmt.Errorf("failed to generate reset token: %w", err)
	}

	// Set expiry to 1 hour from now
	expiry := time.Now().Add(1 * time.Hour)
	user.ResetToken = token
	user.ResetTokenExpiry = &expiry

	if err := db.Save(&user).Error; err != nil {
		return fmt.Errorf("failed to save reset token: %w", err)
	}

	// Send reset email (async)
	go func() {
		if err := s.emailService.SendPasswordResetEmail(user.Email, token); err != nil {
			fmt.Printf("Failed to send password reset email: %v\n", err)
		}
	}()

	return nil
}

// ResetPassword resets user password
func (s *Service) ResetPassword(token, newPassword string) error {
	db := database.GetDB()

	var user models.User
	if err := db.Where("reset_token = ?", token).First(&user).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return errors.New("invalid reset token")
		}
		return fmt.Errorf("database error: %w", err)
	}

	// Check if token expired
	if user.ResetTokenExpiry == nil || user.ResetTokenExpiry.Before(time.Now()) {
		return errors.New("reset token expired")
	}

	// Hash new password
	if err := user.HashPassword(newPassword); err != nil {
		return fmt.Errorf("failed to hash password: %w", err)
	}

	// Clear reset token
	user.ResetToken = ""
	user.ResetTokenExpiry = nil

	if err := db.Save(&user).Error; err != nil {
		return fmt.Errorf("failed to reset password: %w", err)
	}

	return nil
}

// GetUserByID retrieves a user by ID
func (s *Service) GetUserByID(userID uuid.UUID) (*models.User, error) {
	db := database.GetDB()

	var user models.User
	if err := db.Preload("Subscription.Plan").First(&user, userID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("user not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	return &user, nil
}

// UpdateProfile updates user's profile information
func (s *Service) UpdateProfile(userID uuid.UUID, firstName, lastName string) (*models.User, error) {
	db := database.GetDB()

	var user models.User
	if err := db.First(&user, userID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("user not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	// Update fields
	if firstName != "" {
		user.FirstName = firstName
	}
	if lastName != "" {
		user.LastName = lastName
	}

	if err := db.Save(&user).Error; err != nil {
		return nil, fmt.Errorf("failed to update profile: %w", err)
	}

	// Reload with subscription
	db.Preload("Subscription.Plan").First(&user, userID)

	return &user, nil
}

// ChangePassword changes user's password (requires old password)
func (s *Service) ChangePassword(userID uuid.UUID, oldPassword, newPassword string) error {
	db := database.GetDB()

	var user models.User
	if err := db.First(&user, userID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return errors.New("user not found")
		}
		return fmt.Errorf("database error: %w", err)
	}

	// Verify old password
	if !user.CheckPassword(oldPassword) {
		return errors.New("current password is incorrect")
	}

	// Hash new password
	if err := user.HashPassword(newPassword); err != nil {
		return fmt.Errorf("failed to hash password: %w", err)
	}

	if err := db.Save(&user).Error; err != nil {
		return fmt.Errorf("failed to change password: %w", err)
	}

	return nil
}

// generateRandomToken generates a random token
func generateRandomToken(length int) (string, error) {
	bytes := make([]byte, length)
	if _, err := rand.Read(bytes); err != nil {
		return "", err
	}
	return hex.EncodeToString(bytes), nil
}
