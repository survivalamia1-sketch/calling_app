#!/bin/bash

# Email Testing Script for TurboSMTP
# This script helps test your email configuration

echo "================================================"
echo "  TurboSMTP Email Configuration Test"
echo "================================================"
echo ""

# Check if .env file exists
if [ ! -f "../.env" ]; then
    echo "❌ Error: .env file not found in backend directory"
    echo "Please copy .env.example to .env and configure it first"
    exit 1
fi

# Source the .env file
source ../.env

# Display current configuration (masked passwords)
echo "Current SMTP Configuration:"
echo "----------------------------------------"
echo "SMTP Host:     $SMTP_HOST"
echo "SMTP Port:     $SMTP_PORT"
echo "SMTP Username: $SMTP_USERNAME"
echo "SMTP Password: ${SMTP_PASSWORD:0:4}****"
echo "SMTP From:     $SMTP_FROM"
echo "Use SSL:       ${SMTP_USE_SSL:-false}"
echo "Use TLS:       ${SMTP_USE_TLS:-true}"
echo ""

# Validate configuration
echo "Validating configuration..."
ERRORS=0

if [ -z "$SMTP_HOST" ]; then
    echo "❌ SMTP_HOST is not set"
    ERRORS=$((ERRORS + 1))
fi

if [ -z "$SMTP_PORT" ]; then
    echo "❌ SMTP_PORT is not set"
    ERRORS=$((ERRORS + 1))
fi

if [ -z "$SMTP_USERNAME" ]; then
    echo "❌ SMTP_USERNAME is not set (Consumer Key)"
    ERRORS=$((ERRORS + 1))
fi

if [ -z "$SMTP_PASSWORD" ]; then
    echo "❌ SMTP_PASSWORD is not set (Consumer Secret)"
    ERRORS=$((ERRORS + 1))
fi

if [ -z "$SMTP_FROM" ]; then
    echo "❌ SMTP_FROM is not set"
    ERRORS=$((ERRORS + 1))
fi

if [ $ERRORS -gt 0 ]; then
    echo ""
    echo "❌ Configuration has $ERRORS error(s)"
    echo "Please fix the above errors in your .env file"
    exit 1
fi

echo "✅ Configuration looks good!"
echo ""

# Test SMTP connectivity
echo "Testing SMTP server connectivity..."
if command -v nc &> /dev/null; then
    if nc -zv -w 5 $SMTP_HOST $SMTP_PORT 2>&1 | grep -q "succeeded"; then
        echo "✅ Successfully connected to $SMTP_HOST:$SMTP_PORT"
    else
        echo "❌ Failed to connect to $SMTP_HOST:$SMTP_PORT"
        echo "Please check:"
        echo "  1. Your internet connection"
        echo "  2. Firewall settings"
        echo "  3. SMTP host and port are correct"
        exit 1
    fi
else
    echo "⚠️  'nc' command not found, skipping connectivity test"
    echo "Install netcat to enable connectivity testing"
fi

echo ""
echo "================================================"
echo "  Configuration Test Complete!"
echo "================================================"
echo ""
echo "Next steps:"
echo "1. Start your backend server"
echo "2. Try registering a new user"
echo "3. Check if verification email is received"
echo "4. Monitor logs for any errors"
echo ""
echo "To view logs:"
echo "  docker-compose logs -f backend"
echo ""
echo "Or if running locally:"
echo "  go run cmd/server/main.go"
echo ""
