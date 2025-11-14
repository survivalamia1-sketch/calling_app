package subscriptions

import (
	"io"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/stripe/stripe-go/v76"
	"github.com/stripe/stripe-go/v76/webhook"
	"github.com/yourusername/calling-app-backend/internal/middleware"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/config"
)

type Handler struct {
	service *Service
	config  *config.Config
}

func NewHandler(cfg *config.Config) *Handler {
	return &Handler{
		service: NewService(cfg),
		config:  cfg,
	}
}

// CreateCheckoutSession godoc
// @Summary Create checkout session
// @Description Create a Stripe checkout session for subscription
// @Tags subscriptions
// @Accept json
// @Produce json
// @Security BearerAuth
// @Param input body map[string]string true "Plan type"
// @Success 200 {object} map[string]interface{}
// @Failure 400 {object} map[string]interface{}
// @Router /subscriptions/checkout [post]
func (h *Handler) CreateCheckoutSession(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	var input struct {
		PlanType string `json:"plan_type" binding:"required"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Plan type is required",
		})
		return
	}

	// Validate plan type
	planType := models.PlanType(input.PlanType)
	if planType != models.PlanPro && planType != models.PlanBusiness {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid plan type",
		})
		return
	}

	url, err := h.service.CreateCheckoutSession(userID, planType)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"checkout_url": url,
	})
}

// GetSubscription godoc
// @Summary Get user subscription
// @Description Get current user's subscription details
// @Tags subscriptions
// @Produce json
// @Security BearerAuth
// @Success 200 {object} models.Subscription
// @Failure 404 {object} map[string]interface{}
// @Router /subscriptions/current [get]
func (h *Handler) GetSubscription(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	sub, err := h.service.GetUserSubscription(userID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, sub)
}

// GetAllPlans godoc
// @Summary Get all plans
// @Description Get all available subscription plans
// @Tags subscriptions
// @Produce json
// @Success 200 {array} models.SubscriptionPlan
// @Router /subscriptions/plans [get]
func (h *Handler) GetAllPlans(c *gin.Context) {
	plans, err := h.service.GetAllPlans()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, plans)
}

// CancelSubscription godoc
// @Summary Cancel subscription
// @Description Cancel user's current subscription
// @Tags subscriptions
// @Produce json
// @Security BearerAuth
// @Success 200 {object} map[string]interface{}
// @Failure 400 {object} map[string]interface{}
// @Router /subscriptions/cancel [post]
func (h *Handler) CancelSubscription(c *gin.Context) {
	userID, exists := middleware.GetUserID(c)
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		return
	}

	if err := h.service.CancelSubscription(userID); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Subscription canceled successfully",
	})
}

// HandleWebhook godoc
// @Summary Stripe webhook
// @Description Handle Stripe webhook events
// @Tags subscriptions
// @Accept json
// @Produce json
// @Success 200 {object} map[string]interface{}
// @Router /subscriptions/webhook [post]
func (h *Handler) HandleWebhook(c *gin.Context) {
	const MaxBodyBytes = int64(65536)
	c.Request.Body = http.MaxBytesReader(c.Writer, c.Request.Body, MaxBodyBytes)

	payload, err := io.ReadAll(c.Request.Body)
	if err != nil {
		log.Printf("Error reading request body: %v\n", err)
		c.JSON(http.StatusServiceUnavailable, gin.H{"error": err.Error()})
		return
	}

	// Verify webhook signature
	event, err := webhook.ConstructEvent(payload, c.GetHeader("Stripe-Signature"), h.config.Stripe.WebhookSecret)
	if err != nil {
		log.Printf("Error verifying webhook signature: %v\n", err)
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Handle the event
	switch event.Type {
	case "checkout.session.completed":
		var session stripe.CheckoutSession
		err := stripe.UnmarshalJSON(event.Data.Raw, &session)
		if err != nil {
			log.Printf("Error parsing webhook JSON: %v\n", err)
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		// Create subscription from checkout
		if err := h.service.CreateSubscriptionFromCheckout(session.ID); err != nil {
			log.Printf("Error creating subscription from checkout: %v\n", err)
		}

	case "customer.subscription.updated":
		var sub stripe.Subscription
		err := stripe.UnmarshalJSON(event.Data.Raw, &sub)
		if err != nil {
			log.Printf("Error parsing webhook JSON: %v\n", err)
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		// Update subscription status
		if err := h.service.UpdateSubscriptionFromStripe(sub.ID, string(sub.Status)); err != nil {
			log.Printf("Error updating subscription: %v\n", err)
		}

	case "customer.subscription.deleted":
		var sub stripe.Subscription
		err := stripe.UnmarshalJSON(event.Data.Raw, &sub)
		if err != nil {
			log.Printf("Error parsing webhook JSON: %v\n", err)
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		// Update subscription status to canceled
		if err := h.service.UpdateSubscriptionFromStripe(sub.ID, "canceled"); err != nil {
			log.Printf("Error updating subscription: %v\n", err)
		}

	case "invoice.payment_failed":
		log.Println("Payment failed webhook received")
		// Handle payment failure

	default:
		log.Printf("Unhandled event type: %s\n", event.Type)
	}

	c.JSON(http.StatusOK, gin.H{"received": true})
}
