package middleware

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
	"github.com/yourusername/calling-app-backend/internal/models"
	"github.com/yourusername/calling-app-backend/pkg/config"
	"github.com/yourusername/calling-app-backend/pkg/database"
)

type AdminClaims struct {
	AdminID uuid.UUID         `json:"admin_id"`
	Email   string            `json:"email"`
	Role    models.AdminRole  `json:"role"`
}

// AdminAuthMiddleware validates admin JWT token
func AdminAuthMiddleware(cfg *config.Config) gin.HandlerFunc {
	return func(c *gin.Context) {
		// First validate the JWT token (reuse existing auth middleware logic)
		authHeader := c.GetHeader("Authorization")
		if authHeader == "" {
			c.JSON(http.StatusUnauthorized, gin.H{
				"error": "Authorization header required",
			})
			c.Abort()
			return
		}

		parts := strings.Split(authHeader, " ")
		if len(parts) != 2 || parts[0] != "Bearer" {
			c.JSON(http.StatusUnauthorized, gin.H{
				"error": "Invalid authorization header format",
			})
			c.Abort()
			return
		}

		tokenString := parts[1]

		// Parse token
		token, err := jwt.ParseWithClaims(tokenString, &Claims{}, func(token *jwt.Token) (interface{}, error) {
			return []byte(cfg.JWT.Secret), nil
		})

		if err != nil || !token.Valid {
			c.JSON(http.StatusUnauthorized, gin.H{
				"error": "Invalid or expired token",
			})
			c.Abort()
			return
		}

		claims, ok := token.Claims.(*Claims)
		if !ok {
			c.JSON(http.StatusUnauthorized, gin.H{
				"error": "Invalid token claims",
			})
			c.Abort()
			return
		}

		// Verify this is an admin user
		db := database.GetDB()
		var admin models.Admin
		if err := db.Where("id = ?", claims.UserID).First(&admin).Error; err != nil {
			c.JSON(http.StatusForbidden, gin.H{
				"error": "Admin access required",
			})
			c.Abort()
			return
		}

		if !admin.IsActive {
			c.JSON(http.StatusForbidden, gin.H{
				"error": "Admin account is deactivated",
			})
			c.Abort()
			return
		}

		// Set admin info in context
		c.Set("admin_id", admin.ID)
		c.Set("admin_email", admin.Email)
		c.Set("admin_role", admin.Role)

		c.Next()
	}
}

// RequireSuperAdmin ensures the user is a super admin
func RequireSuperAdmin() gin.HandlerFunc {
	return func(c *gin.Context) {
		role, exists := c.Get("admin_role")
		if !exists {
			c.JSON(http.StatusForbidden, gin.H{
				"error": "Admin authentication required",
			})
			c.Abort()
			return
		}

		adminRole, ok := role.(models.AdminRole)
		if !ok || adminRole != models.AdminRoleSuperAdmin {
			c.JSON(http.StatusForbidden, gin.H{
				"error": "Super admin access required",
			})
			c.Abort()
			return
		}

		c.Next()
	}
}

// GetAdminID retrieves admin ID from context
func GetAdminID(c *gin.Context) (uuid.UUID, bool) {
	adminID, exists := c.Get("admin_id")
	if !exists {
		return uuid.Nil, false
	}
	id, ok := adminID.(uuid.UUID)
	return id, ok
}

// GetAdminRole retrieves admin role from context
func GetAdminRole(c *gin.Context) (models.AdminRole, bool) {
	role, exists := c.Get("admin_role")
	if !exists {
		return "", false
	}
	adminRole, ok := role.(models.AdminRole)
	return adminRole, ok
}

// AuditLogMiddleware logs admin actions
func AuditLogMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		// Process request first
		c.Next()

		// Log only successful state-changing operations
		if c.Request.Method != "GET" && c.Writer.Status() < 400 {
			adminID, exists := GetAdminID(c)
			if !exists {
				return
			}

			db := database.GetDB()
			auditLog := models.AuditLog{
				AdminID:   adminID,
				Action:    c.Request.Method + " " + c.Request.URL.Path,
				IPAddress: c.ClientIP(),
				UserAgent: c.Request.UserAgent(),
			}

			// Don't block request if logging fails
			go func() {
				db.Create(&auditLog)
			}()
		}
	}
}
