# TurboSMTP Email Configuration Guide

This document explains how to configure the backend to use TurboSMTP for sending emails.

---

## 📧 TurboSMTP Configuration

### Server Details

| Parameter | Value |
|-----------|-------|
| **SMTP Server** | `pro.turbo-smtp.com` |
| **Authentication** | Enabled (Required) |
| **Username** | Your Consumer Key |
| **Password** | Your Consumer Secret |

### Available Ports

#### SSL/TLS Ports (Direct TLS Connection):
- **465** (Recommended for SSL)
- **25025** (Alternative SSL port)

#### Non-SSL Ports (STARTTLS):
- **587** (Recommended for TLS/STARTTLS) ⭐
- **25** (Standard SMTP)
- **2525** (Alternative port)

---

## ⚙️ Environment Variables Configuration

### Required Variables

Add these to your `.env` file:

```bash
# TurboSMTP Configuration
SMTP_HOST=pro.turbo-smtp.com
SMTP_PORT=587
SMTP_USERNAME=your-consumer-key-here
SMTP_PASSWORD=your-consumer-secret-here
SMTP_FROM=noreply@yourdomain.com
```

### Optional Security Settings

```bash
# SSL/TLS Settings
SMTP_USE_SSL=false         # Set to true for ports 465, 25025
SMTP_USE_TLS=true          # Set to true for STARTTLS (ports 587, 25, 2525)
SMTP_SKIP_VERIFY=false     # Only set to true for testing with self-signed certs

# Application URL (for email links)
APP_URL=https://yourdomain.com
```

---

## 🔧 Port Configuration Examples

### Example 1: Using Port 587 (STARTTLS - Recommended)

```bash
SMTP_HOST=pro.turbo-smtp.com
SMTP_PORT=587
SMTP_USERNAME=your-consumer-key
SMTP_PASSWORD=your-consumer-secret
SMTP_FROM=noreply@yourdomain.com
SMTP_USE_SSL=false
SMTP_USE_TLS=true
```

### Example 2: Using Port 465 (Direct SSL)

```bash
SMTP_HOST=pro.turbo-smtp.com
SMTP_PORT=465
SMTP_USERNAME=your-consumer-key
SMTP_PASSWORD=your-consumer-secret
SMTP_FROM=noreply@yourdomain.com
SMTP_USE_SSL=true
SMTP_USE_TLS=false
```

### Example 3: Using Port 25025 (Alternative SSL)

```bash
SMTP_HOST=pro.turbo-smtp.com
SMTP_PORT=25025
SMTP_USERNAME=your-consumer-key
SMTP_PASSWORD=your-consumer-secret
SMTP_FROM=noreply@yourdomain.com
SMTP_USE_SSL=true
SMTP_USE_TLS=false
```

### Example 4: Using Port 2525 (Alternative STARTTLS)

```bash
SMTP_HOST=pro.turbo-smtp.com
SMTP_PORT=2525
SMTP_USERNAME=your-consumer-key
SMTP_PASSWORD=your-consumer-secret
SMTP_FROM=noreply@yourdomain.com
SMTP_USE_SSL=false
SMTP_USE_TLS=true
```

---

## 📝 Getting Your TurboSMTP Credentials

### Step 1: Sign Up / Log In
1. Go to [TurboSMTP](https://www.serversmtp.com/)
2. Sign up for an account or log in
3. Navigate to your dashboard

### Step 2: Get Consumer Key & Secret
1. Go to **SMTP & API** section
2. Look for **Consumer Key** (this is your `SMTP_USERNAME`)
3. Look for **Consumer Secret** (this is your `SMTP_PASSWORD`)
4. Copy both values

### Step 3: Configure Sender Email
1. Set your `SMTP_FROM` to an email address you've verified
2. TurboSMTP requires sender verification
3. Add and verify your domain/email in TurboSMTP dashboard

---

## 🔐 Security Best Practices

### 1. Never Commit Credentials
```bash
# ❌ NEVER do this
SMTP_PASSWORD=actual-password-here

# ✅ Use environment variables
SMTP_PASSWORD=${TURBO_SMTP_SECRET}
```

### 2. Use Strong Secrets
- Keep Consumer Key and Secret secure
- Rotate credentials periodically
- Use different credentials for dev/staging/production

### 3. Enable TLS
- Always use `SMTP_USE_TLS=true` for non-SSL ports
- Use `SMTP_USE_SSL=true` for SSL ports (465, 25025)
- Never set `SMTP_SKIP_VERIFY=true` in production

### 4. Verify Sender Domain
- Configure SPF records
- Set up DKIM signatures
- Configure DMARC policy

---

## 🚀 Docker Deployment Configuration

### Update `docker-compose.yml`

```yaml
version: '3.8'

services:
  backend:
    build: ./backend
    environment:
      # TurboSMTP Configuration
      SMTP_HOST: pro.turbo-smtp.com
      SMTP_PORT: 587
      SMTP_USERNAME: ${TURBO_SMTP_KEY}
      SMTP_PASSWORD: ${TURBO_SMTP_SECRET}
      SMTP_FROM: noreply@yourdomain.com
      SMTP_USE_TLS: "true"
      APP_URL: https://yourdomain.com
    env_file:
      - .env
```

### Create `.env` File (Not Committed)

```bash
# TurboSMTP Credentials
TURBO_SMTP_KEY=your-actual-consumer-key
TURBO_SMTP_SECRET=your-actual-consumer-secret
```

---

## 🧪 Testing Email Configuration

### Method 1: Using cURL

```bash
# Test email endpoint
curl -X POST http://localhost:8080/api/v1/auth/forgot-password \
  -H "Content-Type: application/json" \
  -d '{"email": "your-test-email@example.com"}'
```

### Method 2: Check Backend Logs

```bash
# Watch backend logs for email sending
docker-compose logs -f backend

# Look for:
# - Connection to pro.turbo-smtp.com:587
# - Authentication success
# - Email sent successfully
```

### Method 3: Test Registration Flow

1. Sign up with a new account
2. Check if verification email arrives
3. Verify email template looks correct
4. Test verification link works

---

## 📊 Email Templates

The backend includes these email templates:

### 1. Email Verification
- **Subject**: "Verify Your Email Address"
- **Content**: Welcome message + verification link
- **Expiry**: 24 hours

### 2. Password Reset
- **Subject**: "Reset Your Password"
- **Content**: Reset instructions + reset link
- **Expiry**: 1 hour

### 3. Meeting Invitation
- **Subject**: "Meeting Invitation"
- **Content**: Meeting details + join link
- **Includes**: Meeting code, time, join button

---

## 🛠️ Code Implementation Details

### Email Service Architecture

```
backend/internal/email/service.go
├── NewService()          # Initialize with env vars
├── SendVerificationEmail()
├── SendPasswordResetEmail()
├── SendMeetingInvitation()
├── sendEmail()           # Main send function
├── sendEmailSSL()        # For SSL ports (465, 25025)
└── sendEmailTLS()        # For STARTTLS (587, 25, 2525)
```

### Automatic Port Detection

The service automatically detects the connection method:

```go
// SSL connection for ports 465, 25025
if s.useSSL || s.smtpPort == "465" || s.smtpPort == "25025" {
    return s.sendEmailSSL(addr, to, message)
}

// TLS/STARTTLS for ports 587, 25, 2525
return s.sendEmailTLS(addr, to, message)
```

---

## ⚠️ Common Issues & Solutions

### Issue 1: Authentication Failed

**Error**: `SMTP authentication failed: 535 Authentication failed`

**Solutions**:
1. Verify Consumer Key is correct
2. Verify Consumer Secret is correct
3. Check if account is active in TurboSMTP dashboard
4. Ensure credentials don't have extra spaces

### Issue 2: Connection Timeout

**Error**: `failed to connect to SMTP server: dial tcp: i/o timeout`

**Solutions**:
1. Check firewall allows outbound connections on SMTP ports
2. Try alternative ports (2525 instead of 587)
3. Verify network connectivity
4. Check if ISP blocks SMTP ports

### Issue 3: Sender Not Verified

**Error**: `550 Sender verify failed`

**Solutions**:
1. Verify sender email in TurboSMTP dashboard
2. Add and verify your domain
3. Use verified email as `SMTP_FROM`
4. Check SPF/DKIM settings

### Issue 4: TLS Handshake Failed

**Error**: `STARTTLS failed: tls: handshake failure`

**Solutions**:
1. Update Go to latest version
2. Set `SMTP_SKIP_VERIFY=true` for testing (dev only)
3. Check TLS version compatibility
4. Try SSL port (465) instead

### Issue 5: Rate Limit Exceeded

**Error**: `550 Rate limit exceeded`

**Solutions**:
1. Upgrade TurboSMTP plan
2. Implement email queue in backend
3. Add rate limiting to email sending
4. Monitor daily send limits

---

## 📈 Monitoring & Logging

### Enable Debug Logging

```bash
LOG_LEVEL=debug
```

### Email Logs to Watch

```bash
# Successful send
✓ Email sent to: user@example.com
✓ Subject: Verify Your Email Address

# Authentication
✓ Connected to pro.turbo-smtp.com:587
✓ SMTP authentication successful

# Errors
✗ SMTP authentication failed: invalid credentials
✗ Connection timeout after 30s
```

### TurboSMTP Dashboard

Monitor from dashboard:
- Email send count
- Delivery rate
- Bounce rate
- Open rate (if tracking enabled)
- Failed deliveries

---

## 🔄 Migration from Other SMTP Providers

### From Gmail

```bash
# Old (Gmail)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=your-email@gmail.com
SMTP_PASSWORD=app-specific-password

# New (TurboSMTP)
SMTP_HOST=pro.turbo-smtp.com
SMTP_PORT=587
SMTP_USERNAME=your-consumer-key
SMTP_PASSWORD=your-consumer-secret
```

### From SendGrid

```bash
# Old (SendGrid)
SMTP_HOST=smtp.sendgrid.net
SMTP_PORT=587
SMTP_USERNAME=apikey
SMTP_PASSWORD=your-api-key

# New (TurboSMTP)
SMTP_HOST=pro.turbo-smtp.com
SMTP_PORT=587
SMTP_USERNAME=your-consumer-key
SMTP_PASSWORD=your-consumer-secret
```

---

## ✅ Production Checklist

Before going to production:

- [ ] Consumer Key and Secret configured
- [ ] Sender email verified in TurboSMTP
- [ ] SPF record added to DNS
- [ ] DKIM signature configured
- [ ] DMARC policy set up
- [ ] SSL/TLS enabled (`SMTP_USE_TLS=true`)
- [ ] Email templates tested
- [ ] All email links use production URL
- [ ] Rate limits understood
- [ ] Monitoring set up
- [ ] Backup SMTP provider configured (optional)

---

## 📚 Additional Resources

### Official Documentation
- [TurboSMTP Documentation](https://www.serversmtp.com/en/smtp-server)
- [TurboSMTP API Guide](https://www.serversmtp.com/en/api)
- [SMTP RFC 5321](https://tools.ietf.org/html/rfc5321)

### Related Topics
- [Email Authentication (SPF, DKIM, DMARC)](https://www.cloudflare.com/learning/email-security/)
- [SMTP Security Best Practices](https://www.rfc-editor.org/rfc/rfc8314)
- [Go SMTP Package](https://pkg.go.dev/net/smtp)

---

## 🆘 Support

### If You Need Help:

1. **Check TurboSMTP Status**: [Status Page](https://status.serversmtp.com/)
2. **Review Logs**: Check backend logs for detailed errors
3. **TurboSMTP Support**: Contact their support team
4. **Test Connection**: Use telnet to test SMTP connectivity

### Test SMTP Connection:

```bash
# Test connection
telnet pro.turbo-smtp.com 587

# Should see:
# 220 pro.turbo-smtp.com ESMTP
```

---

## 🎯 Summary

**TurboSMTP is now configured!**

- ✅ SMTP server: `pro.turbo-smtp.com`
- ✅ Default port: `587` (STARTTLS)
- ✅ SSL ports: `465`, `25025`
- ✅ Alternative ports: `25`, `2525`
- ✅ Authentication: Consumer Key + Secret
- ✅ TLS/SSL support: Fully configured
- ✅ Multiple email templates: Ready
- ✅ Error handling: Comprehensive

**Next Steps:**
1. Get your Consumer Key and Secret from TurboSMTP
2. Add them to `.env` file
3. Test email sending
4. Verify emails are delivered
5. Monitor delivery rates in TurboSMTP dashboard

Your email system is production-ready! 🚀
