# 🚀 Quick Start Guide - Video Calling Platform

This guide will help you get the complete video calling platform running in minutes.

## 📦 What's Included

This repository contains:
1. **Backend** (Go) - Complete REST API with authentication, subscriptions, and WebRTC signaling
2. **Frontend** (React) - Web client for video calling (in `client/` folder)

## 🎯 Quick Setup (5 Minutes)

### Prerequisites
- Docker & Docker Compose (recommended)
- OR Go 1.21+, PostgreSQL 15+, Redis 7+, Node.js 18+

### Option 1: Docker Setup (Easiest) ⭐

1. **Navigate to backend**
```bash
cd backend
```

2. **Create environment file**
```bash
cp .env.example .env
```

3. **Edit .env file** (minimal required changes):
```env
# Change these:
JWT_SECRET=your-super-secret-change-this
SMTP_USERNAME=your-email@gmail.com
SMTP_PASSWORD=your-app-password
SMTP_FROM=noreply@yourdomain.com

# For Stripe (optional for now, needed for paid plans):
STRIPE_SECRET_KEY=sk_test_your_key
STRIPE_WEBHOOK_SECRET=whsec_your_secret
```

4. **Start the backend**
```bash
docker-compose up -d
```

5. **Verify it's running**
```bash
curl http://localhost:8080/health
# Should return: {"status":"ok","version":"v1"}
```

✅ **Backend is now running on http://localhost:8080**

### Option 2: Manual Setup

#### Backend

```bash
cd backend

# Install dependencies
go mod download

# Start PostgreSQL & Redis (or use Docker)
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=calling_app postgres:15-alpine
docker run -d -p 6379:6379 redis:7-alpine

# Create .env file
cp .env.example .env
# Edit .env with your values

# Run the server
go run cmd/api/main.go
```

#### Frontend (Original React App)

```bash
cd client

# Install dependencies
npm install

# Start development server
npm start
```

The React app will run on http://localhost:3000

## 🧪 Testing the API

### 1. Health Check
```bash
curl http://localhost:8080/health
```

### 2. Register a User
```bash
curl -X POST http://localhost:8080/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "password123",
    "first_name": "John",
    "last_name": "Doe"
  }'
```

You'll get a response with a JWT token:
```json
{
  "user": {
    "id": "uuid",
    "email": "test@example.com",
    "first_name": "John",
    "last_name": "Doe",
    "subscription_plan": "free"
  },
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "refresh_token": "eyJhbGciOiJIUzI1NiIs..."
}
```

### 3. Login
```bash
curl -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "password123"
  }'
```

### 4. Get Your Profile
```bash
# Replace YOUR_TOKEN with the token from login
curl http://localhost:8080/api/v1/auth/profile \
  -H "Authorization: Bearer YOUR_TOKEN"
```

### 5. Get Subscription Plans
```bash
curl http://localhost:8080/api/v1/subscriptions/plans
```

### 6. Create a Meeting Room
```bash
curl -X POST http://localhost:8080/api/v1/rooms \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "My First Meeting",
    "description": "Testing the platform",
    "max_participants": 10
  }'
```

### 7. Get Your Rooms
```bash
curl http://localhost:8080/api/v1/rooms \
  -H "Authorization: Bearer YOUR_TOKEN"
```

## 🎥 Using the Video Calling Feature

### With Original React Frontend

1. Open http://localhost:3000
2. Enter your name
3. Click "Create New Meeting"
4. Share the Room ID with others
5. Others can join by entering the Room ID

### With Your Flutter App (Coming Next)

You'll connect to:
- **API Base URL**: `http://localhost:8080/api/v1`
- **WebSocket URL**: `ws://localhost:8080/api/v1/ws`

## 📋 Common Tasks

### View Backend Logs
```bash
cd backend
docker-compose logs -f api
```

### Stop Backend
```bash
cd backend
docker-compose down
```

### Reset Database
```bash
cd backend
docker-compose down -v  # Remove volumes
docker-compose up -d    # Restart
```

### Check Database
```bash
docker exec -it calling_app_postgres psql -U postgres -d calling_app
# Inside psql:
\dt  # List tables
SELECT * FROM users;
SELECT * FROM subscription_plans;
```

## 🔐 Setting Up Stripe (For Paid Plans)

1. **Create Stripe Account** at https://stripe.com

2. **Get Test API Keys**
   - Dashboard → Developers → API keys
   - Copy "Secret key" (starts with `sk_test_`)

3. **Create Products** (use Stripe CLI or Dashboard)
   ```bash
   # Pro Plan
   stripe products create --name="Pro Plan"
   stripe prices create \
     --product=<PRODUCT_ID> \
     --currency=usd \
     --unit-amount=1500 \
     --recurring[interval]=month

   # Business Plan
   stripe products create --name="Business Plan"
   stripe prices create \
     --product=<PRODUCT_ID> \
     --currency=usd \
     --unit-amount=5000 \
     --recurring[interval]=month
   ```

4. **Update .env**
   ```env
   STRIPE_SECRET_KEY=sk_test_xxxxx
   STRIPE_PRO_PRICE_ID=price_xxxxx
   STRIPE_BUSINESS_PRICE_ID=price_xxxxx
   ```

5. **Test Checkout**
   ```bash
   curl -X POST http://localhost:8080/api/v1/subscriptions/checkout \
     -H "Authorization: Bearer YOUR_TOKEN" \
     -H "Content-Type: application/json" \
     -d '{"plan_type": "pro"}'
   ```

## 📧 Setting Up Email (Gmail Example)

1. **Enable 2FA** on your Google account

2. **Create App Password**
   - Google Account → Security → 2-Step Verification → App passwords
   - Generate password for "Mail"

3. **Update .env**
   ```env
   SMTP_HOST=smtp.gmail.com
   SMTP_PORT=587
   SMTP_USERNAME=your-email@gmail.com
   SMTP_PASSWORD=generated-app-password
   SMTP_FROM=noreply@yourdomain.com
   ```

4. **Test Email** (register a new user and check email)

## 🐛 Troubleshooting

### "Connection refused" Error
- Make sure Docker containers are running: `docker-compose ps`
- Check logs: `docker-compose logs`

### "Database connection failed"
- Wait a few seconds for PostgreSQL to start
- Check if port 5432 is already in use
- View postgres logs: `docker-compose logs postgres`

### "Invalid token"
- Token might be expired (24 hour default)
- Login again to get a new token

### WebSocket Connection Issues
- Make sure backend is running
- Check CORS settings in .env
- Verify WebSocket URL is correct

## 📚 Next Steps

### For Flutter Development

1. **API Endpoints**: See `backend/README.md` for full API documentation
2. **WebSocket**: Connect to `ws://localhost:8080/api/v1/ws?room_id={room_id}&user_id={user_id}`
3. **Authentication**: Use JWT token in `Authorization: Bearer {token}` header
4. **flutter_webrtc**: Use for WebRTC implementation in Flutter

### Development Workflow

1. **Backend Changes**
   - Edit Go files
   - Restart: `docker-compose restart api`
   - Or run locally: `go run cmd/api/main.go`

2. **Add New Endpoints**
   - See `backend/README.md` → Development section

3. **Database Changes**
   - Edit models in `internal/models/`
   - Migrations run automatically on restart

## 🎉 You're Ready!

Your video calling platform backend is now running with:
- ✅ User authentication
- ✅ Free subscription (auto-assigned)
- ✅ Meeting room management
- ✅ WebRTC signaling
- ✅ Ready for Flutter client connection

**API Base URL**: `http://localhost:8080/api/v1`

**Next**: Build your Flutter app to connect to this backend!

## 📞 Need Help?

- Backend docs: `backend/README.md`
- API documentation: Check README for all endpoints
- Create an issue on GitHub

---

Happy coding! 🚀
