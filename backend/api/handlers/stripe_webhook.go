package handlers

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/stripe/stripe-go/v76"
	"github.com/stripe/stripe-go/v76/webhook"
	"gorm.io/gorm"
)

type StripeWebhookHandler struct {
	db *gorm.DB
}

func NewStripeWebhookHandler(db *gorm.DB) *StripeWebhookHandler {
	return &StripeWebhookHandler{db: db}
}

func (h *StripeWebhookHandler) HandleWebhook(c *gin.Context) {
	const MaxBodyBytes = int64(65536)
	c.Request.Body = http.MaxBytesReader(c.Writer, c.Request.Body, MaxBodyBytes)

	payload, err := io.ReadAll(c.Request.Body)
	if err != nil {
		c.JSON(http.StatusServiceUnavailable, gin.H{"error": "error reading request body"})
		return
	}

	// Verify webhook signature
	endpointSecret := os.Getenv("STRIPE_WEBHOOK_SECRET")
	signatureHeader := c.GetHeader("Stripe-Signature")

	event, err := webhook.ConstructEvent(payload, signatureHeader, endpointSecret)
	if err != nil {
		log.Printf("Webhook signature verification failed: %v", err)
		c.JSON(http.StatusBadRequest, gin.H{"error": fmt.Sprintf("webhook signature verification failed: %v", err)})
		return
	}

	// Handle the event
	switch event.Type {
	case "checkout.session.completed":
		h.handleCheckoutSessionCompleted(event)

	case "customer.subscription.created":
		h.handleSubscriptionCreated(event)

	case "customer.subscription.updated":
		h.handleSubscriptionUpdated(event)

	case "customer.subscription.deleted":
		h.handleSubscriptionDeleted(event)

	case "invoice.payment_succeeded":
		h.handleInvoicePaymentSucceeded(event)

	case "invoice.payment_failed":
		h.handleInvoicePaymentFailed(event)

	default:
		log.Printf("Unhandled event type: %s", event.Type)
	}

	c.JSON(http.StatusOK, gin.H{"received": true})
}

func (h *StripeWebhookHandler) handleCheckoutSessionCompleted(event stripe.Event) {
	var session stripe.CheckoutSession
	if err := json.Unmarshal(event.Data.Raw, &session); err != nil {
		log.Printf("Error parsing checkout session: %v", err)
		return
	}

	log.Printf("Checkout session completed: %s for customer: %s", session.ID, session.Customer.ID)

	// Update user subscription in database
	// Get user ID from session metadata
	userID, ok := session.Metadata["user_id"]
	if !ok {
		log.Printf("No user_id in session metadata")
		return
	}

	// Update subscription record
	var subscription struct {
		ID                string
		UserID            string
		StripeCustomerID  string
		StripeSubscriptionID string
		Status            string
		PlanID            string
		BillingCycle      string
	}

	result := h.db.Table("subscriptions").Where("user_id = ?", userID).First(&subscription)
	if result.Error != nil {
		// Create new subscription
		newSubscription := map[string]interface{}{
			"user_id":               userID,
			"stripe_customer_id":    session.Customer.ID,
			"stripe_subscription_id": session.Subscription.ID,
			"status":                "active",
			"plan_id":               session.Metadata["plan_id"],
			"billing_cycle":         session.Metadata["billing_cycle"],
		}
		h.db.Table("subscriptions").Create(&newSubscription)
	} else {
		// Update existing subscription
		h.db.Table("subscriptions").Where("user_id = ?", userID).Updates(map[string]interface{}{
			"stripe_customer_id":    session.Customer.ID,
			"stripe_subscription_id": session.Subscription.ID,
			"status":                "active",
		})
	}
}

func (h *StripeWebhookHandler) handleSubscriptionCreated(event stripe.Event) {
	var subscription stripe.Subscription
	if err := json.Unmarshal(event.Data.Raw, &subscription); err != nil {
		log.Printf("Error parsing subscription: %v", err)
		return
	}

	log.Printf("Subscription created: %s for customer: %s", subscription.ID, subscription.Customer.ID)
}

func (h *StripeWebhookHandler) handleSubscriptionUpdated(event stripe.Event) {
	var subscription stripe.Subscription
	if err := json.Unmarshal(event.Data.Raw, &subscription); err != nil {
		log.Printf("Error parsing subscription: %v", err)
		return
	}

	log.Printf("Subscription updated: %s, status: %s", subscription.ID, subscription.Status)

	// Update subscription status in database
	h.db.Table("subscriptions").
		Where("stripe_subscription_id = ?", subscription.ID).
		Update("status", string(subscription.Status))
}

func (h *StripeWebhookHandler) handleSubscriptionDeleted(event stripe.Event) {
	var subscription stripe.Subscription
	if err := json.Unmarshal(event.Data.Raw, &subscription); err != nil {
		log.Printf("Error parsing subscription: %v", err)
		return
	}

	log.Printf("Subscription deleted: %s", subscription.ID)

	// Mark subscription as cancelled
	h.db.Table("subscriptions").
		Where("stripe_subscription_id = ?", subscription.ID).
		Updates(map[string]interface{}{
			"status":       "canceled",
			"canceled_at":  "NOW()",
		})
}

func (h *StripeWebhookHandler) handleInvoicePaymentSucceeded(event stripe.Event) {
	var invoice stripe.Invoice
	if err := json.Unmarshal(event.Data.Raw, &invoice); err != nil {
		log.Printf("Error parsing invoice: %v", err)
		return
	}

	log.Printf("Invoice payment succeeded: %s for customer: %s", invoice.ID, invoice.Customer.ID)
}

func (h *StripeWebhookHandler) handleInvoicePaymentFailed(event stripe.Event) {
	var invoice stripe.Invoice
	if err := json.Unmarshal(event.Data.Raw, &invoice); err != nil {
		log.Printf("Error parsing invoice: %v", err)
		return
	}

	log.Printf("Invoice payment failed: %s for customer: %s", invoice.ID, invoice.Customer.ID)

	// Notify user about payment failure
	// TODO: Send email notification
}
