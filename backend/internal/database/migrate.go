package database

import (
	"log"

	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/database"
)

// AutoMigrate runs database migrations
func AutoMigrate() error {
	db := database.GetDB()

	err := db.AutoMigrate(
		&models.User{},
		&models.SubscriptionPlan{},
		&models.Subscription{},
		&models.Room{},
		&models.RoomParticipant{},
		&models.Admin{},
		&models.AuditLog{},
		&models.Payment{},
		&models.SystemSettings{},
	)

	if err != nil {
		return err
	}

	log.Println("✅ Database migrations completed")
	return nil
}

// SeedPlans seeds the default subscription plans
func SeedPlans() error {
	db := database.GetDB()

	plans := []models.SubscriptionPlan{
		{
			Type:               models.PlanFree,
			Name:               "Free",
			Description:        "Perfect for trying out the platform",
			Price:              0,
			Currency:           "usd",
			MaxMeetingDuration: 45,  // 45 minutes
			MaxParticipants:    3,   // 3 participants
			CanRecord:          false,
			CanScreenShare:     true,
			CloudStorageGB:     0,
			CanCustomBrand:     false,
			HasAPIAccess:       false,
			HasPrioritySupport: false,
		},
		{
			Type:               models.PlanPro,
			Name:               "Pro Monthly",
			Description:        "For professionals - billed monthly",
			Price:              400, // $4.00
			Currency:           "usd",
			BillingPeriod:      "monthly",
			MaxMeetingDuration: 0,   // Unlimited
			MaxParticipants:    100, // 100 participants (high limit)
			CanRecord:          true,
			CanScreenShare:     true,
			CloudStorageGB:     50,
			CanCustomBrand:     false,
			HasAPIAccess:       false,
			HasPrioritySupport: true,
		},
		{
			Type:               models.PlanBusiness,
			Name:               "Pro Yearly",
			Description:        "For professionals - billed yearly (Save $8/year!)",
			Price:              4000, // $40.00
			Currency:           "usd",
			BillingPeriod:      "yearly",
			MaxMeetingDuration: 0,   // Unlimited
			MaxParticipants:    100, // 100 participants (high limit)
			CanRecord:          true,
			CanScreenShare:     true,
			CloudStorageGB:     50,
			CanCustomBrand:     false,
			HasAPIAccess:       false,
			HasPrioritySupport: true,
		},
	}

	for _, plan := range plans {
		var existingPlan models.SubscriptionPlan
		result := db.Where("type = ?", plan.Type).First(&existingPlan)

		if result.RowsAffected == 0 {
			// Plan doesn't exist, create it
			if err := db.Create(&plan).Error; err != nil {
				return err
			}
			log.Printf("✅ Created subscription plan: %s", plan.Name)
		} else {
			// Plan exists, update it
			if err := db.Model(&existingPlan).Updates(plan).Error; err != nil {
				return err
			}
			log.Printf("✅ Updated subscription plan: %s", plan.Name)
		}
	}

	log.Println("✅ Subscription plans seeded successfully")
	return nil
}

// SeedDefaultAdmin creates a default admin if none exists
func SeedDefaultAdmin() error {
	db := database.GetDB()

	// Check if any admin exists
	var count int64
	db.Model(&models.Admin{}).Count(&count)

	if count > 0 {
		log.Println("✅ Admin already exists, skipping seed")
		return nil
	}

	// Create default admin
	admin := models.Admin{
		Email:     "admin@callingapp.com",
		FirstName: "System",
		LastName:  "Admin",
		Role:      models.AdminRoleSuperAdmin,
		IsActive:  true,
	}

	// Default password: "admin123" - CHANGE THIS IN PRODUCTION
	if err := admin.HashPassword("admin123"); err != nil {
		return err
	}

	if err := db.Create(&admin).Error; err != nil {
		return err
	}

	log.Println("✅ Default admin created")
	log.Println("⚠️  Email: admin@callingapp.com")
	log.Println("⚠️  Password: admin123")
	log.Println("⚠️  PLEASE CHANGE THE PASSWORD IMMEDIATELY!")

	return nil
}
