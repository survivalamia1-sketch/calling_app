# TurboSMTP Quick Setup Guide

## 🚀 Quick Configuration

Copy this to your `.env` file and replace the placeholder values:

```bash
# TurboSMTP Configuration
SMTP_HOST=pro.turbo-smtp.com
SMTP_PORT=587
SMTP_USERNAME=YOUR_CONSUMER_KEY_HERE
SMTP_PASSWORD=YOUR_CONSUMER_SECRET_HERE
SMTP_FROM=noreply@yourdomain.com
SMTP_USE_SSL=false
SMTP_USE_TLS=true
```

---

## 📋 Where to Get Your Credentials

1. **Login**: Go to https://www.serversmtp.com/
2. **Navigate**: Dashboard → SMTP & API
3. **Consumer Key**: Copy this value → Use as `SMTP_USERNAME`
4. **Consumer Secret**: Copy this value → Use as `SMTP_PASSWORD`

---

## 🔌 Port Configurations

### Recommended: Port 587 (STARTTLS)
```bash
SMTP_PORT=587
SMTP_USE_SSL=false
SMTP_USE_TLS=true
```

### Alternative: Port 465 (SSL)
```bash
SMTP_PORT=465
SMTP_USE_SSL=true
SMTP_USE_TLS=false
```

### Other Available Ports
```bash
# Port 25 (STARTTLS)
SMTP_PORT=25
SMTP_USE_SSL=false
SMTP_USE_TLS=true

# Port 2525 (STARTTLS)
SMTP_PORT=2525
SMTP_USE_SSL=false
SMTP_USE_TLS=true

# Port 25025 (SSL)
SMTP_PORT=25025
SMTP_USE_SSL=true
SMTP_USE_TLS=false
```

---

## ✅ Quick Test

1. **Copy and configure**:
   ```bash
   cd backend
   cp .env.example .env
   # Edit .env with your credentials
   ```

2. **Test configuration**:
   ```bash
   cd scripts
   ./test_email.sh
   ```

3. **Start backend**:
   ```bash
   docker-compose up backend
   ```

4. **Send test email**:
   ```bash
   curl -X POST http://localhost:8080/api/v1/auth/register \
     -H "Content-Type: application/json" \
     -d '{
       "email": "test@example.com",
       "password": "Test123!",
       "first_name": "Test",
       "last_name": "User"
     }'
   ```

---

## 🎯 Summary

| Setting | Value |
|---------|-------|
| **Server** | `pro.turbo-smtp.com` |
| **Port** | `587` (recommended) |
| **Auth** | Consumer Key + Secret |
| **SSL** | `false` (for port 587) |
| **TLS** | `true` (for port 587) |

**That's it!** Your email system is ready. 📧
