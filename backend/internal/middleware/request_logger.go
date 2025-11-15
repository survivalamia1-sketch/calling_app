package middleware

import (
	"bytes"
	"fmt"
	"io"
	"log"

	"github.com/gin-gonic/gin"
)

// RequestLogger logs request bodies for debugging authentication issues
func RequestLogger() gin.HandlerFunc {
	return func(c *gin.Context) {
		// Only log auth endpoints for debugging
		if c.Request.URL.Path == "/api/v1/auth/register" || c.Request.URL.Path == "/api/v1/auth/login" {
			// Read body
			body, err := io.ReadAll(c.Request.Body)
			if err != nil {
				log.Printf("Error reading body: %v", err)
				c.Next()
				return
			}

			// Restore body for handler to read
			c.Request.Body = io.NopCloser(bytes.NewBuffer(body))

			// Log the request
			log.Printf("📥 [%s] %s - Body: %s", c.Request.Method, c.Request.URL.Path, string(body))

			// Create a response writer wrapper to capture response
			writer := &responseWriter{
				ResponseWriter: c.Writer,
				body:           &bytes.Buffer{},
			}
			c.Writer = writer

			// Process request
			c.Next()

			// Log response
			log.Printf("📤 [%s] %s - Status: %d - Response: %s",
				c.Request.Method,
				c.Request.URL.Path,
				c.Writer.Status(),
				writer.body.String(),
			)
		} else {
			c.Next()
		}
	}
}

// responseWriter wraps gin.ResponseWriter to capture response body
type responseWriter struct {
	gin.ResponseWriter
	body *bytes.Buffer
}

func (w *responseWriter) Write(b []byte) (int, error) {
	w.body.Write(b)
	return w.ResponseWriter.Write(b)
}

func (w *responseWriter) WriteString(s string) (int, error) {
	w.body.WriteString(s)
	return w.ResponseWriter.WriteString(s)
}
