package subscriptions

import (
	"errors"
	"fmt"
	"time"

	"github.com/google/uuid"
	"github.com/stripe/stripe-go/v76"
	"github.com/stripe/stripe-go/v76/checkout/session"
	"github.com/stripe/stripe-go/v76/customer"
	"github.com/stripe/stripe-go/v76/subscription"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/config"
	"github.com/yourusername/calling-app-backend/pkg/database"
	"gorm.io/gorm"
)

type Service struct {
	config *config.Config
}

func NewService(cfg *config.Config) *Service {
	stripe.Key = cfg.Stripe.SecretKey
	return &Service{
		config: cfg,
	}
}

// CreateCheckoutSession creates a Stripe checkout session
func (s *Service) CreateCheckoutSession(userID uuid.UUID, planType models.PlanType) (string, error) {
	db := database.GetDB()

	// Get user
	var user models.User
	if err := db.First(&user, userID).Error; err != nil {
		return "", fmt.Errorf("user not found: %w", err)
	}

	// Get plan
	var plan models.SubscriptionPlan
	if err := db.Where("type = ?", planType).First(&plan).Error; err != nil {
		return "", fmt.Errorf("plan not found: %w", err)
	}

	// Don't allow checkout for free plan
	if plan.Type == models.PlanFree {
		return "", errors.New("cannot checkout for free plan")
	}

	// Create or get Stripe customer
	customerID := user.StripeCustomerID
	if customerID == "" {
		// Create new Stripe customer
		params := &stripe.CustomerParams{
			Email: stripe.String(user.Email),
			Name:  stripe.String(user.GetFullName()),
		}
		c, err := customer.New(params)
		if err != nil {
			return "", fmt.Errorf("failed to create Stripe customer: %w", err)
		}
		customerID = c.ID

		// Save customer ID
		user.StripeCustomerID = customerID
		db.Save(&user)
	}

	// Create checkout session
	params := &stripe.CheckoutSessionParams{
		Customer: stripe.String(customerID),
		PaymentMethodTypes: stripe.StringSlice([]string{
			"card",
		}),
		LineItems: []*stripe.CheckoutSessionLineItemParams{
			{
				Price:    stripe.String(plan.StripePriceID),
				Quantity: stripe.Int64(1),
			},
		},
		Mode:       stripe.String(string(stripe.CheckoutSessionModeSubscription)),
		SuccessURL: stripe.String(fmt.Sprintf("%s/subscription/success?session_id={CHECKOUT_SESSION_ID}", s.config.SMTP.From)),
		CancelURL:  stripe.String(fmt.Sprintf("%s/subscription/cancel", s.config.SMTP.From)),
		Metadata: map[string]string{
			"user_id":   user.ID.String(),
			"plan_type": string(planType),
		},
	}

	sess, err := session.New(params)
	if err != nil {
		return "", fmt.Errorf("failed to create checkout session: %w", err)
	}

	return sess.URL, nil
}

// GetUserSubscription gets user's subscription details
func (s *Service) GetUserSubscription(userID uuid.UUID) (*models.Subscription, error) {
	db := database.GetDB()

	var sub models.Subscription
	if err := db.Preload("Plan").Where("user_id = ?", userID).First(&sub).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("subscription not found")
		}
		return nil, fmt.Errorf("database error: %w", err)
	}

	return &sub, nil
}

// GetAllPlans returns all available subscription plans
func (s *Service) GetAllPlans() ([]models.SubscriptionPlan, error) {
	db := database.GetDB()

	var plans []models.SubscriptionPlan
	if err := db.Find(&plans).Error; err != nil {
		return nil, fmt.Errorf("failed to fetch plans: %w", err)
	}

	return plans, nil
}

// CancelSubscription cancels a user's subscription
func (s *Service) CancelSubscription(userID uuid.UUID) error {
	db := database.GetDB()

	var sub models.Subscription
	if err := db.Where("user_id = ?", userID).First(&sub).Error; err != nil {
		return fmt.Errorf("subscription not found: %w", err)
	}

	// Cancel in Stripe
	if sub.StripeSubscriptionID != "" {
		params := &stripe.SubscriptionParams{
			CancelAtPeriodEnd: stripe.Bool(true),
		}
		_, err := subscription.Update(sub.StripeSubscriptionID, params)
		if err != nil {
			return fmt.Errorf("failed to cancel Stripe subscription: %w", err)
		}
	}

	// Update in database
	now := time.Now()
	sub.CanceledAt = &now
	sub.Status = models.StatusCanceled

	if err := db.Save(&sub).Error; err != nil {
		return fmt.Errorf("failed to update subscription: %w", err)
	}

	return nil
}

// UpdateSubscriptionFromStripe updates subscription from Stripe webhook
func (s *Service) UpdateSubscriptionFromStripe(stripeSubID string, status string) error {
	db := database.GetDB()

	var sub models.Subscription
	if err := db.Where("stripe_subscription_id = ?", stripeSubID).First(&sub).Error; err != nil {
		return fmt.Errorf("subscription not found: %w", err)
	}

	// Map Stripe status to our status
	var newStatus models.SubscriptionStatus
	switch status {
	case "active":
		newStatus = models.StatusActive
	case "canceled":
		newStatus = models.StatusCanceled
	case "past_due":
		newStatus = models.StatusPastDue
	case "trialing":
		newStatus = models.StatusTrialing
	default:
		newStatus = models.StatusInactive
	}

	sub.Status = newStatus

	if err := db.Save(&sub).Error; err != nil {
		return fmt.Errorf("failed to update subscription: %w", err)
	}

	return nil
}

// CreateSubscriptionFromCheckout creates subscription after successful checkout
func (s *Service) CreateSubscriptionFromCheckout(sessionID string) error {
	db := database.GetDB()

	// Get checkout session from Stripe
	sess, err := session.Get(sessionID, nil)
	if err != nil {
		return fmt.Errorf("failed to get checkout session: %w", err)
	}

	// Get user ID from metadata
	userIDStr := sess.Metadata["user_id"]
	planTypeStr := sess.Metadata["plan_type"]

	userID, err := uuid.Parse(userIDStr)
	if err != nil {
		return fmt.Errorf("invalid user ID: %w", err)
	}

	// Get plan
	var plan models.SubscriptionPlan
	if err := db.Where("type = ?", planTypeStr).First(&plan).Error; err != nil {
		return fmt.Errorf("plan not found: %w", err)
	}

	// Get Stripe subscription
	stripeSub, err := subscription.Get(sess.Subscription.ID, nil)
	if err != nil {
		return fmt.Errorf("failed to get Stripe subscription: %w", err)
	}

	// Update or create subscription
	var sub models.Subscription
	result := db.Where("user_id = ?", userID).First(&sub)

	periodStart := time.Unix(stripeSub.CurrentPeriodStart, 0)
	periodEnd := time.Unix(stripeSub.CurrentPeriodEnd, 0)

	if result.RowsAffected == 0 {
		// Create new subscription
		sub = models.Subscription{
			UserID:               userID,
			PlanID:               plan.ID,
			Status:               models.StatusActive,
			StripeSubscriptionID: stripeSub.ID,
			CurrentPeriodStart:   &periodStart,
			CurrentPeriodEnd:     &periodEnd,
		}
		if err := db.Create(&sub).Error; err != nil {
			return fmt.Errorf("failed to create subscription: %w", err)
		}
	} else {
		// Update existing subscription
		sub.PlanID = plan.ID
		sub.Status = models.StatusActive
		sub.StripeSubscriptionID = stripeSub.ID
		sub.CurrentPeriodStart = &periodStart
		sub.CurrentPeriodEnd = &periodEnd
		if err := db.Save(&sub).Error; err != nil {
			return fmt.Errorf("failed to update subscription: %w", err)
		}
	}

	return nil
}
