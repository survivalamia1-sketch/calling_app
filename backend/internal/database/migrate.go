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
			MaxMeetingDuration: 40,  // 40 minutes
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
			Name:               "Pro",
			Description:        "For professionals and small teams",
			Price:              1500, // $15.00
			Currency:           "usd",
			MaxMeetingDuration: 0,  // Unlimited
			MaxParticipants:    10, // 10 participants
			CanRecord:          true,
			CanScreenShare:     true,
			CloudStorageGB:     10,
			CanCustomBrand:     false,
			HasAPIAccess:       false,
			HasPrioritySupport: true,
		},
		{
			Type:               models.PlanBusiness,
			Name:               "Business",
			Description:        "For large teams and enterprises",
			Price:              5000, // $50.00
			Currency:           "usd",
			MaxMeetingDuration: 0,   // Unlimited
			MaxParticipants:    50,  // 50 participants
			CanRecord:          true,
			CanScreenShare:     true,
			CloudStorageGB:     100,
			CanCustomBrand:     true,
			HasAPIAccess:       true,
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
