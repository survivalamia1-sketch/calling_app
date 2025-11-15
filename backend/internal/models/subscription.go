package models

import (
	"time"

	"github.com/google/uuid"
)

type PlanType string

const (
	PlanFree     PlanType = "free"
	PlanPro      PlanType = "pro"
	PlanBusiness PlanType = "business"
)

type SubscriptionStatus string

const (
	StatusActive   SubscriptionStatus = "active"
	StatusInactive SubscriptionStatus = "inactive"
	StatusCanceled SubscriptionStatus = "canceled"
	StatusPastDue  SubscriptionStatus = "past_due"
	StatusTrialing SubscriptionStatus = "trialing"
)

// SubscriptionPlan defines the features of each plan
type SubscriptionPlan struct {
	ID                  uuid.UUID `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	Type                PlanType  `gorm:"uniqueIndex;not null" json:"type"`
	Name                string    `gorm:"not null" json:"name"`
	Description         string    `json:"description"`
	Price               int       `json:"price"` // in cents
	Currency            string    `gorm:"default:'usd'" json:"currency"`
	BillingPeriod       string    `gorm:"default:'monthly'" json:"billing_period"` // monthly, yearly, or empty for free
	StripePriceID       string    `json:"stripe_price_id"`
	MaxMeetingDuration  int       `json:"max_meeting_duration"`  // in minutes (0 = unlimited)
	MaxParticipants     int       `json:"max_participants"`
	CanRecord           bool      `gorm:"default:false" json:"can_record"`
	CanScreenShare      bool      `gorm:"default:true" json:"can_screen_share"`
	CloudStorageGB      int       `json:"cloud_storage_gb"`
	CanCustomBrand      bool      `gorm:"default:false" json:"can_custom_brand"`
	HasAPIAccess        bool      `gorm:"default:false" json:"has_api_access"`
	HasPrioritySupport  bool      `gorm:"default:false" json:"has_priority_support"`
	CreatedAt           time.Time `json:"created_at"`
	UpdatedAt           time.Time `json:"updated_at"`
}

// Subscription represents a user's subscription
type Subscription struct {
	ID                   uuid.UUID          `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	UserID               uuid.UUID          `gorm:"type:uuid;not null;uniqueIndex" json:"user_id"`
	PlanID               uuid.UUID          `gorm:"type:uuid;not null" json:"plan_id"`
	Status               SubscriptionStatus `gorm:"not null" json:"status"`
	StripeSubscriptionID string             `json:"stripe_subscription_id,omitempty"`
	CurrentPeriodStart   *time.Time         `json:"current_period_start"`
	CurrentPeriodEnd     *time.Time         `json:"current_period_end"`
	CanceledAt           *time.Time         `json:"canceled_at"`
	CreatedAt            time.Time          `json:"created_at"`
	UpdatedAt            time.Time          `json:"updated_at"`

	// Relationships
	User *User             `gorm:"foreignKey:UserID" json:"user,omitempty"`
	Plan *SubscriptionPlan `gorm:"foreignKey:PlanID" json:"plan,omitempty"`
}

// IsActive checks if subscription is currently active
func (s *Subscription) IsActive() bool {
	if s.Status != StatusActive && s.Status != StatusTrialing {
		return false
	}
	if s.CurrentPeriodEnd != nil && s.CurrentPeriodEnd.Before(time.Now()) {
		return false
	}
	return true
}

// CanAccessFeature checks if user can access a specific feature
func (s *Subscription) CanAccessFeature(feature string) bool {
	if s.Plan == nil {
		return false
	}

	switch feature {
	case "recording":
		return s.Plan.CanRecord
	case "screen_share":
		return s.Plan.CanScreenShare
	case "custom_brand":
		return s.Plan.CanCustomBrand
	case "api_access":
		return s.Plan.HasAPIAccess
	case "priority_support":
		return s.Plan.HasPrioritySupport
	default:
		return false
	}
}

// GetMaxMeetingDuration returns max meeting duration in minutes
func (s *Subscription) GetMaxMeetingDuration() int {
	if s.Plan == nil {
		return 40 // Default for free
	}
	return s.Plan.MaxMeetingDuration
}

// GetMaxParticipants returns max participants allowed
func (s *Subscription) GetMaxParticipants() int {
	if s.Plan == nil {
		return 3 // Default for free
	}
	return s.Plan.MaxParticipants
}
