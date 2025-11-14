package config

import (
	"fmt"
	"os"
	"strconv"

	"github.com/joho/godotenv"
)

type Config struct {
	Server   ServerConfig
	Database DatabaseConfig
	Redis    RedisConfig
	JWT      JWTConfig
	Stripe   StripeConfig
	SMTP     SMTPConfig
	WebRTC   WebRTCConfig
	CORS     CORSConfig
}

type ServerConfig struct {
	Port       string
	Env        string
	APIVersion string
}

type DatabaseConfig struct {
	Host     string
	Port     string
	User     string
	Password string
	DBName   string
	SSLMode  string
}

type RedisConfig struct {
	Host     string
	Port     string
	Password string
	DB       int
}

type JWTConfig struct {
	Secret             string
	ExpiryHours        int
	RefreshExpiryHours int
}

type StripeConfig struct {
	SecretKey       string
	WebhookSecret   string
	FreePriceID     string
	ProPriceID      string
	BusinessPriceID string
}

type SMTPConfig struct {
	Host     string
	Port     int
	Username string
	Password string
	From     string
	FromName string
}

type WebRTCConfig struct {
	STUNServer   string
	TURNServer   string
	TURNUsername string
	TURNPassword string
}

type CORSConfig struct {
	AllowedOrigins string
}

func Load() (*Config, error) {
	// Load .env file if exists (for local development)
	_ = godotenv.Load()

	redisDB, _ := strconv.Atoi(getEnv("REDIS_DB", "0"))
	jwtExpiry, _ := strconv.Atoi(getEnv("JWT_EXPIRY_HOURS", "24"))
	jwtRefreshExpiry, _ := strconv.Atoi(getEnv("JWT_REFRESH_EXPIRY_HOURS", "720"))
	smtpPort, _ := strconv.Atoi(getEnv("SMTP_PORT", "587"))

	config := &Config{
		Server: ServerConfig{
			Port:       getEnv("PORT", "8080"),
			Env:        getEnv("ENV", "development"),
			APIVersion: getEnv("API_VERSION", "v1"),
		},
		Database: DatabaseConfig{
			Host:     getEnv("DB_HOST", "localhost"),
			Port:     getEnv("DB_PORT", "5432"),
			User:     getEnv("DB_USER", "postgres"),
			Password: getEnv("DB_PASSWORD", "postgres"),
			DBName:   getEnv("DB_NAME", "calling_app"),
			SSLMode:  getEnv("DB_SSLMODE", "disable"),
		},
		Redis: RedisConfig{
			Host:     getEnv("REDIS_HOST", "localhost"),
			Port:     getEnv("REDIS_PORT", "6379"),
			Password: getEnv("REDIS_PASSWORD", ""),
			DB:       redisDB,
		},
		JWT: JWTConfig{
			Secret:             getEnv("JWT_SECRET", "change-this-secret-key"),
			ExpiryHours:        jwtExpiry,
			RefreshExpiryHours: jwtRefreshExpiry,
		},
		Stripe: StripeConfig{
			SecretKey:       getEnv("STRIPE_SECRET_KEY", ""),
			WebhookSecret:   getEnv("STRIPE_WEBHOOK_SECRET", ""),
			FreePriceID:     getEnv("STRIPE_FREE_PRICE_ID", ""),
			ProPriceID:      getEnv("STRIPE_PRO_PRICE_ID", ""),
			BusinessPriceID: getEnv("STRIPE_BUSINESS_PRICE_ID", ""),
		},
		SMTP: SMTPConfig{
			Host:     getEnv("SMTP_HOST", "smtp.gmail.com"),
			Port:     smtpPort,
			Username: getEnv("SMTP_USERNAME", ""),
			Password: getEnv("SMTP_PASSWORD", ""),
			From:     getEnv("SMTP_FROM", "noreply@example.com"),
			FromName: getEnv("SMTP_FROM_NAME", "Calling App"),
		},
		WebRTC: WebRTCConfig{
			STUNServer:   getEnv("STUN_SERVER", "stun:stun.l.google.com:19302"),
			TURNServer:   getEnv("TURN_SERVER", ""),
			TURNUsername: getEnv("TURN_USERNAME", ""),
			TURNPassword: getEnv("TURN_PASSWORD", ""),
		},
		CORS: CORSConfig{
			AllowedOrigins: getEnv("CORS_ALLOWED_ORIGINS", "*"),
		},
	}

	return config, nil
}

func (c *Config) GetDSN() string {
	return fmt.Sprintf(
		"host=%s port=%s user=%s password=%s dbname=%s sslmode=%s",
		c.Database.Host,
		c.Database.Port,
		c.Database.User,
		c.Database.Password,
		c.Database.DBName,
		c.Database.SSLMode,
	)
}

func (c *Config) GetRedisAddr() string {
	return fmt.Sprintf("%s:%s", c.Redis.Host, c.Redis.Port)
}

func getEnv(key, defaultValue string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return defaultValue
}
