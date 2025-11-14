package models

import (
	"time"

	"github.com/google/uuid"
)

type PaymentStatus string

const (
	PaymentStatusSucceeded PaymentStatus = "succeeded"
	PaymentStatusFailed    PaymentStatus = "failed"
	PaymentStatusRefunded  PaymentStatus = "refunded"
	PaymentStatusPending   PaymentStatus = "pending"
)

// Payment represents a payment transaction
type Payment struct {
	ID                   uuid.UUID     `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	UserID               uuid.UUID     `gorm:"type:uuid;not null;index" json:"user_id"`
	SubscriptionID       uuid.UUID     `gorm:"type:uuid;index" json:"subscription_id"`
	StripePaymentID      string        `gorm:"index" json:"stripe_payment_id"`
	StripeInvoiceID      string        `json:"stripe_invoice_id"`
	Amount               int           `json:"amount"` // in cents
	Currency             string        `gorm:"default:'usd'" json:"currency"`
	Status               PaymentStatus `json:"status"`
	Description          string        `json:"description"`
	PaymentMethod        string        `json:"payment_method"`
	RefundedAmount       int           `json:"refunded_amount"`
	PaidAt               *time.Time    `json:"paid_at"`
	RefundedAt           *time.Time    `json:"refunded_at"`
	CreatedAt            time.Time     `json:"created_at"`
	UpdatedAt            time.Time     `json:"updated_at"`

	// Relationships
	User         *User         `gorm:"foreignKey:UserID" json:"user,omitempty"`
	Subscription *Subscription `gorm:"foreignKey:SubscriptionID" json:"subscription,omitempty"`
}

// SystemSettings stores system-wide configuration
type SystemSettings struct {
	ID               uuid.UUID `gorm:"type:uuid;primary_key;default:gen_random_uuid()" json:"id"`
	Key              string    `gorm:"uniqueIndex;not null" json:"key"`
	Value            string    `gorm:"type:text" json:"value"`
	Description      string    `json:"description"`
	Category         string    `gorm:"size:50" json:"category"`
	IsPublic         bool      `gorm:"default:false" json:"is_public"`
	UpdatedAt        time.Time `json:"updated_at"`
}
