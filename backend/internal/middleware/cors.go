package middleware

import (
	"log"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/yourusername/calling-app-backend/pkg/config"
)

// CORSMiddleware handles CORS
func CORSMiddleware(cfg *config.Config) gin.HandlerFunc {
	return func(c *gin.Context) {
		origin := c.Request.Header.Get("Origin")

		// Always set CORS headers (browser needs them even for blocked requests)
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With")
		c.Writer.Header().Set("Access-Control-Allow-Methods", "POST, OPTIONS, GET, PUT, DELETE, PATCH")

		// Check if origin is allowed
		allowedOrigins := strings.Split(cfg.CORS.AllowedOrigins, ",")
		allowed := false

		// If "*" is configured, allow all origins
		if strings.TrimSpace(cfg.CORS.AllowedOrigins) == "*" {
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
			if strings.TrimSpace(cfg.CORS.AllowedOrigins) == "*" {
				// For "*", always use the request origin (required when credentials are enabled)
				if origin != "" {
					c.Writer.Header().Set("Access-Control-Allow-Origin", origin)
					c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
					log.Printf("🔵 CORS: Setting Access-Control-Allow-Origin to %s (from config: %s)", origin, cfg.CORS.AllowedOrigins)
				} else {
					// No origin header - this is likely a non-browser client, allow all
					c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
					log.Printf("🔵 CORS: No origin header, setting Access-Control-Allow-Origin to *")
				}
			} else if origin != "" {
				c.Writer.Header().Set("Access-Control-Allow-Origin", origin)
				c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
				log.Printf("🔵 CORS: Setting Access-Control-Allow-Origin to %s (from config: %s)", origin, cfg.CORS.AllowedOrigins)
			}
		} else {
			log.Printf("🔴 CORS: Origin %s not allowed (config: %s)", origin, cfg.CORS.AllowedOrigins)
		}

		if c.Request.Method == "OPTIONS" {
			log.Printf("🔵 CORS: Handling OPTIONS request for %s", c.Request.URL.Path)
			c.AbortWithStatus(204)
			return
		}

		c.Next()
	}
}
