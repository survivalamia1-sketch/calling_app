package models

import (
	"time"

	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type User struct {
	ID                uuid.UUID  `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	Email             string     `gorm:"uniqueIndex;not null" json:"email"`
	Password          string     `gorm:"not null" json:"-"`
	FirstName         string     `gorm:"size:100" json:"first_name"`
	LastName          string     `gorm:"size:100" json:"last_name"`
	Avatar            string     `json:"avatar"`
	EmailVerified     bool       `gorm:"default:false" json:"email_verified"`
	EmailVerifiedAt   *time.Time `json:"email_verified_at"`
	VerificationToken string     `json:"-"`
	ResetToken        string     `json:"-"`
	ResetTokenExpiry  *time.Time `json:"-"`
	StripeCustomerID  string     `json:"stripe_customer_id,omitempty"`
	IsActive          bool       `gorm:"default:true" json:"is_active"`
	LastLoginAt       *time.Time `json:"last_login_at"`
	CreatedAt         time.Time  `json:"created_at"`
	UpdatedAt         time.Time  `json:"updated_at"`
	DeletedAt         gorm.DeletedAt `gorm:"index" json:"-"`

	// Relationships
	Subscription *Subscription `gorm:"foreignKey:UserID" json:"subscription,omitempty"`
	Rooms        []Room        `gorm:"foreignKey:HostID" json:"rooms,omitempty"`
}

// BeforeCreate hook to hash password
func (u *User) BeforeCreate(tx *gorm.DB) error {
	if u.ID == uuid.Nil {
		u.ID = uuid.New()
	}
	return nil
}

// HashPassword hashes the user password
func (u *User) HashPassword(password string) error {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return err
	}
	u.Password = string(hashedPassword)
	return nil
}

// CheckPassword compares the given password with the hashed password
func (u *User) CheckPassword(password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(u.Password), []byte(password))
	return err == nil
}

// GetFullName returns the full name of the user
func (u *User) GetFullName() string {
	if u.FirstName == "" && u.LastName == "" {
		return u.Email
	}
	return u.FirstName + " " + u.LastName
}

// PublicUser returns user data without sensitive fields
type PublicUser struct {
	ID              uuid.UUID  `json:"id"`
	Email           string     `json:"email"`
	FirstName       string     `json:"first_name"`
	LastName        string     `json:"last_name"`
	Avatar          string     `json:"avatar"`
	EmailVerified   bool       `json:"email_verified"`
	IsActive        bool       `json:"is_active"`
	LastLoginAt     *time.Time `json:"last_login_at"`
	CreatedAt       time.Time  `json:"created_at"`
	SubscriptionPlan string     `json:"subscription_plan,omitempty"`
}

func (u *User) ToPublic() PublicUser {
	planType := "free"
	if u.Subscription != nil && u.Subscription.Plan != nil {
		planType = string(u.Subscription.Plan.Type)
	}

	return PublicUser{
		ID:               u.ID,
		Email:            u.Email,
		FirstName:        u.FirstName,
		LastName:         u.LastName,
		Avatar:           u.Avatar,
		EmailVerified:    u.EmailVerified,
		IsActive:         u.IsActive,
		LastLoginAt:      u.LastLoginAt,
		CreatedAt:        u.CreatedAt,
		SubscriptionPlan: planType,
	}
}
