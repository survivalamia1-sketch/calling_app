package redis

import (
	"context"
	"fmt"
	"log"

	"github.com/redis/go-redis/v9"
	"github.com/yourusername/calling-app-backend/pkg/config"
)

var Client *redis.Client

func Connect(cfg *config.Config) error {
	Client = redis.NewClient(&redis.Options{
		Addr:     cfg.GetRedisAddr(),
		Password: cfg.Redis.Password,
		DB:       cfg.Redis.DB,
	})

	ctx := context.Background()
	_, err := Client.Ping(ctx).Result()
	if err != nil {
		return fmt.Errorf("failed to connect to redis: %w", err)
	}

	log.Println("✅ Redis connected successfully")
	return nil
}

func GetClient() *redis.Client {
	return Client
}
