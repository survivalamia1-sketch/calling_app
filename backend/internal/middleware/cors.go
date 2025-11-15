package middleware

import (
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/yourusername/calling-app-backend/pkg/config"
)

// CORSMiddleware handles CORS
func CORSMiddleware(cfg *config.Config) gin.HandlerFunc {
	return func(c *gin.Context) {
		origin := c.Request.Header.Get("Origin")

		// Check if origin is allowed
		allowedOrigins := strings.Split(cfg.CORS.AllowedOrigins, ",")
		allowed := false

		// If "*" is configured, allow all origins
		if cfg.CORS.AllowedOrigins == "*" {
			allowed = true
		} else {
			for _, allowedOrigin := range allowedOrigins {
				allowedOrigin = strings.TrimSpace(allowedOrigin)
				if allowedOrigin == origin {
					allowed = true
					break
				}
			}
		}

		if allowed {
			if cfg.CORS.AllowedOrigins == "*" {
				// For "*", always use the request origin (required when credentials are enabled)
				// If no origin header, allow all (for non-browser clients)
				if origin != "" {
					c.Writer.Header().Set("Access-Control-Allow-Origin", origin)
					c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
				} else {
					// No origin header - this is likely a non-browser client, allow all
					c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
					// Can't use credentials with "*"
				}
			} else if origin != "" {
				c.Writer.Header().Set("Access-Control-Allow-Origin", origin)
				c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
			}
		}
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With")
		c.Writer.Header().Set("Access-Control-Allow-Methods", "POST, OPTIONS, GET, PUT, DELETE, PATCH")

		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(204)
			return
		}

		c.Next()
	}
}
