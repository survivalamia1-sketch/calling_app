package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"github.com/yourusername/calling-app-backend/internal/admin"
	"github.com/yourusername/calling-app-backend/internal/auth"
	"github.com/yourusername/calling-app-backend/internal/chat"
	"github.com/yourusername/calling-app-backend/internal/dashboard"
	dbmigrate "github.com/yourusername/calling-app-backend/internal/database"
	"github.com/yourusername/calling-app-backend/internal/middleware"
	"github.com/yourusername/calling-app-backend/internal/notifications"
	"github.com/yourusername/calling-app-backend/internal/rooms"
	"github.com/yourusername/calling-app-backend/internal/scheduled_meetings"
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

	// Seed default admin
	if err := dbmigrate.SeedDefaultAdmin(); err != nil {
		log.Fatalf("Failed to seed default admin: %v", err)
	}

	// Initialize WebRTC hub
	webrtcHub := webrtc.NewHub()
	go webrtcHub.Run()

	// Connect duration manager to signaling hub
	rooms.GetDurationManager().SetSignalingHub(webrtcHub)

	// Setup Gin
	if cfg.Server.Env == "production" {
		gin.SetMode(gin.ReleaseMode)
	}

	router := gin.Default()

	// Middleware
	router.Use(middleware.RequestLogger()) // Log auth requests/responses for debugging
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
	adminHandler := admin.NewHandler(cfg)
	dashboardHandler := dashboard.NewHandler()
	scheduledMeetingsHandler := scheduled_meetings.NewHandler()
	chatHandler := chat.NewHandler()
	notificationsHandler := notifications.NewHandler()

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
				authProtected.PUT("/profile", authHandler.UpdateProfile)
				authProtected.POST("/change-password", authHandler.ChangePassword)
				authProtected.POST("/avatar", authHandler.UploadAvatar)
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
			// More specific routes must come first in Gin
			roomRoutes.GET("/by-code/:code", roomsHandler.GetRoomByCode)
			roomRoutes.GET("/:id/participants", roomsHandler.GetRoomParticipants)
			roomRoutes.GET("/:id/status", roomsHandler.GetRoomStatus)
			roomRoutes.GET("/:id/info", webrtc.GetRoomInfoHandler(webrtcHub))
			roomRoutes.GET("/:id/messages", chatHandler.GetRoomMessages)
			roomRoutes.GET("/:id", roomsHandler.GetRoom)

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
				roomProtected.DELETE("/:room_id/messages/:message_id", chatHandler.DeleteMessage)
			}
		}

		// WebRTC signaling WebSocket
		v1.GET("/ws", webrtc.HandleWebSocket(webrtcHub))

		// Dashboard routes
		dashboardRoutes := v1.Group("/dashboard")
		dashboardRoutes.Use(middleware.AuthMiddleware(cfg))
		{
			dashboardRoutes.GET("/stats", dashboardHandler.GetDashboardStats)
			dashboardRoutes.GET("/upcoming-meetings", dashboardHandler.GetUpcomingMeetings)
		}

		// Scheduled meetings routes
		scheduledMeetingsRoutes := v1.Group("/scheduled-meetings")
		scheduledMeetingsRoutes.Use(middleware.AuthMiddleware(cfg))
		{
			scheduledMeetingsRoutes.GET("/upcoming", scheduledMeetingsHandler.GetUpcomingMeetings)
			scheduledMeetingsRoutes.GET("", scheduledMeetingsHandler.GetScheduledMeetings)
			scheduledMeetingsRoutes.POST("", scheduledMeetingsHandler.CreateScheduledMeeting)
			scheduledMeetingsRoutes.GET("/:id", scheduledMeetingsHandler.GetScheduledMeeting)
			scheduledMeetingsRoutes.PUT("/:id", scheduledMeetingsHandler.UpdateScheduledMeeting)
			scheduledMeetingsRoutes.DELETE("/:id", scheduledMeetingsHandler.DeleteScheduledMeeting)
			scheduledMeetingsRoutes.POST("/:id/start", scheduledMeetingsHandler.StartScheduledMeeting)
		}

		// Notifications routes
		notificationsRoutes := v1.Group("/notifications")
		notificationsRoutes.Use(middleware.AuthMiddleware(cfg))
		{
			notificationsRoutes.GET("", notificationsHandler.GetNotifications)
			notificationsRoutes.GET("/unread-count", notificationsHandler.GetUnreadCount)
			notificationsRoutes.POST("/:id/read", notificationsHandler.MarkAsRead)
			notificationsRoutes.POST("/read-all", notificationsHandler.MarkAllAsRead)
		}

		// ===== ADMIN ROUTES =====
		adminRoutes := v1.Group("/admin")
		{
			// Admin auth (public)
			adminRoutes.POST("/auth/login", adminHandler.Login)

			// Protected admin routes (requires admin authentication)
			adminProtected := adminRoutes.Group("")
			adminProtected.Use(middleware.AdminAuthMiddleware(cfg))
			adminProtected.Use(middleware.AuditLogMiddleware())
			{
				// Admin auth endpoints
				adminProtected.GET("/auth/profile", adminHandler.GetProfile)
				adminProtected.POST("/auth/change-password", adminHandler.ChangePassword)

				// User management
				adminProtected.GET("/users", adminHandler.GetAllUsers)
				adminProtected.GET("/users/:id", adminHandler.GetUserDetails)
				adminProtected.POST("/users/:id/activate", adminHandler.ActivateUser)
				adminProtected.POST("/users/:id/deactivate", adminHandler.DeactivateUser)
				adminProtected.POST("/users/:id/reset-password", adminHandler.ResetUserPassword)

				// Subscription management
				adminProtected.GET("/subscriptions", adminHandler.GetAllSubscriptions)
				adminProtected.POST("/subscriptions/upgrade/:user_id", adminHandler.ManuallyUpgradeSubscription)
				adminProtected.POST("/subscriptions/:id/extend", adminHandler.ExtendSubscription)
				adminProtected.POST("/subscriptions/:id/cancel", adminHandler.CancelSubscription)

				// Room/meeting management
				adminProtected.GET("/rooms", adminHandler.GetAllRooms)
				adminProtected.POST("/rooms/:id/end", adminHandler.ForceEndRoom)

				// Analytics
				adminProtected.GET("/analytics/dashboard", adminHandler.GetDashboardStats)
				adminProtected.GET("/analytics/revenue", adminHandler.GetRevenueChart)
				adminProtected.GET("/analytics/signups", adminHandler.GetSignupsChart)

				// Payments
				adminProtected.GET("/payments", adminHandler.GetAllPayments)

				// System settings
				adminProtected.GET("/settings", adminHandler.GetSystemSettings)
				adminProtected.PUT("/settings", adminHandler.UpdateSystemSetting)

				// Audit logs
				adminProtected.GET("/audit-logs", adminHandler.GetAuditLogs)

				// Super admin only routes
				superAdminRoutes := adminProtected.Group("")
				superAdminRoutes.Use(middleware.RequireSuperAdmin())
				{
					superAdminRoutes.POST("/admins", adminHandler.CreateAdmin)
				}
			}
		}
	}

	// Start server
	addr := ":" + cfg.Server.Port
	log.Printf("🚀 Server starting on %s (env: %s)", addr, cfg.Server.Env)
	log.Printf("📚 API Version: %s", cfg.Server.APIVersion)

	if err := router.Run(addr); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
