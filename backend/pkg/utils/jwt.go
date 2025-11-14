package utils

import (
	"time"

	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/middleware"
	"github.com/yourusername/calling-app-backend/pkg/config"
)

// GenerateToken generates a JWT token for a user
func GenerateToken(userID uuid.UUID, email string, cfg *config.Config) (string, error) {
	expirationTime := time.Now().Add(time.Duration(cfg.JWT.ExpiryHours) * time.Hour)

	claims := &middleware.Claims{
		UserID: userID,
		Email:  email,
		RegisteredClaims: jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(expirationTime),
			IssuedAt:  jwt.NewNumericDate(time.Now()),
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, err := token.SignedString([]byte(cfg.JWT.Secret))

	if err != nil {
		return "", err
	}

	return tokenString, nil
}

// GenerateRefreshToken generates a refresh token
func GenerateRefreshToken(userID uuid.UUID, email string, cfg *config.Config) (string, error) {
	expirationTime := time.Now().Add(time.Duration(cfg.JWT.RefreshExpiryHours) * time.Hour)

	claims := &middleware.Claims{
		UserID: userID,
		Email:  email,
		RegisteredClaims: jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(expirationTime),
			IssuedAt:  jwt.NewNumericDate(time.Now()),
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, err := token.SignedString([]byte(cfg.JWT.Secret))

	if err != nil {
		return "", err
	}

	return tokenString, nil
}

// ValidateToken validates a JWT token
func ValidateToken(tokenString string, cfg *config.Config) (*middleware.Claims, error) {
	token, err := jwt.ParseWithClaims(tokenString, &middleware.Claims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte(cfg.JWT.Secret), nil
	})

	if err != nil {
		return nil, err
	}

	claims, ok := token.Claims.(*middleware.Claims)
	if !ok || !token.Valid {
		return nil, jwt.ErrSignatureInvalid
	}

	return claims, nil
}
