package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"github.com/yourusername/calling-app-backend/internal/auth"
	dbmigrate "github.com/yourusername/calling-app-backend/internal/database"
	"github.com/yourusername/calling-app-backend/internal/middleware"
	"github.com/yourusername/calling-app-backend/internal/rooms"
	"github.com/yourusername/calling-app-backend/internal/subscriptions"
	"github.com/yourusername/calling-app-backend/internal/webrtc"
	"github.com/yourusername/calling-app-backend/pkg/config"
	"github.com/yourusername/calling-app-backend/pkg/database"
	"github.com/yourusername/calling-app-backend/pkg/redis"
)

func main() {
	// Load configuration
	cfg, err := config.Load()
	if err != nil {
		log.Fatalf("Failed to load configuration: %v", err)
	}

	// Connect to database
	if err := database.Connect(cfg); err != nil {
		log.Fatalf("Failed to connect to database: %v", err)
	}

	// Connect to Redis
	if err := redis.Connect(cfg); err != nil {
		log.Fatalf("Failed to connect to Redis: %v", err)
	}

	// Run migrations
	if err := dbmigrate.AutoMigrate(); err != nil {
		log.Fatalf("Failed to run migrations: %v", err)
	}

	// Seed subscription plans
	if err := dbmigrate.SeedPlans(); err != nil {
		log.Fatalf("Failed to seed plans: %v", err)
	}

	// Initialize WebRTC hub
	webrtcHub := webrtc.NewHub()
	go webrtcHub.Run()

	// Setup Gin
	if cfg.Server.Env == "production" {
		gin.SetMode(gin.ReleaseMode)
	}

	router := gin.Default()

	// Middleware
	router.Use(middleware.CORSMiddleware(cfg))
	router.Use(middleware.RecoveryMiddleware())
	router.Use(middleware.ErrorHandler())

	// Health check
	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status":  "ok",
			"version": cfg.Server.APIVersion,
		})
	})

	// Initialize handlers
	authHandler := auth.NewHandler(cfg)
	subsHandler := subscriptions.NewHandler(cfg)
	roomsHandler := rooms.NewHandler()

	// API routes
	v1 := router.Group("/api/" + cfg.Server.APIVersion)
	{
		// Auth routes (public)
		authRoutes := v1.Group("/auth")
		{
			authRoutes.POST("/register", authHandler.Register)
			authRoutes.POST("/login", authHandler.Login)
			authRoutes.GET("/verify-email", authHandler.VerifyEmail)
			authRoutes.POST("/forgot-password", authHandler.RequestPasswordReset)
			authRoutes.POST("/reset-password", authHandler.ResetPassword)
			authRoutes.POST("/refresh", authHandler.RefreshToken)

			// Protected auth routes
			authProtected := authRoutes.Group("")
			authProtected.Use(middleware.AuthMiddleware(cfg))
			{
				authProtected.GET("/profile", authHandler.GetProfile)
			}
		}

		// Subscription routes
		subRoutes := v1.Group("/subscriptions")
		{
			// Public routes
			subRoutes.GET("/plans", subsHandler.GetAllPlans)
			subRoutes.POST("/webhook", subsHandler.HandleWebhook)

			// Protected routes
			subProtected := subRoutes.Group("")
			subProtected.Use(middleware.AuthMiddleware(cfg))
			{
				subProtected.GET("/current", subsHandler.GetSubscription)
				subProtected.POST("/checkout", subsHandler.CreateCheckoutSession)
				subProtected.POST("/cancel", subsHandler.CancelSubscription)
			}
		}

		// Room routes
		roomRoutes := v1.Group("/rooms")
		{
			// Public/semi-public routes
			roomRoutes.GET("/:id", roomsHandler.GetRoom)
			roomRoutes.GET("/:id/participants", roomsHandler.GetRoomParticipants)
			roomRoutes.GET("/:id/info", webrtc.GetRoomInfoHandler(webrtcHub))

			// Join room (can be authenticated or guest)
			roomRoutes.POST("/:id/join", middleware.OptionalAuthMiddleware(cfg), roomsHandler.JoinRoom)

			// Protected routes
			roomProtected := roomRoutes.Group("")
			roomProtected.Use(middleware.AuthMiddleware(cfg))
			{
				roomProtected.GET("", roomsHandler.GetUserRooms)
				roomProtected.POST("", roomsHandler.CreateRoom)
				roomProtected.POST("/:id/leave", roomsHandler.LeaveRoom)
				roomProtected.POST("/:id/end", roomsHandler.EndRoom)
				roomProtected.DELETE("/:id", roomsHandler.DeleteRoom)
			}
		}

		// WebRTC signaling WebSocket
		v1.GET("/ws", webrtc.HandleWebSocket(webrtcHub))
	}

	// Start server
	addr := ":" + cfg.Server.Port
	log.Printf("🚀 Server starting on %s (env: %s)", addr, cfg.Server.Env)
	log.Printf("📚 API Version: %s", cfg.Server.APIVersion)

	if err := router.Run(addr); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
