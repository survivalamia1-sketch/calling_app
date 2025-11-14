# Video Calling App - Backend API

Production-ready Go backend for a SaaS video calling platform with subscriptions, built with Go, PostgreSQL, Redis, and Stripe.

## 🚀 Features

### Core Features
- ✅ User Authentication (JWT-based)
- ✅ Email Verification & Password Reset
- ✅ Subscription Management (Free, Pro, Business)
- ✅ Stripe Payment Integration
- ✅ Meeting/Room Management
- ✅ WebRTC Signaling Server
- ✅ Real-time WebSocket Communication
- ✅ Rate Limiting & CORS
- ✅ PostgreSQL Database
- ✅ Redis Caching

### Subscription Plans

| Feature | Free | Pro | Business |
|---------|------|-----|----------|
| Meeting Duration | 40 min | Unlimited | Unlimited |
| Max Participants | 3 | 10 | 50 |
| Recording | ❌ | ✅ | ✅ |
| Screen Sharing | ✅ | ✅ | ✅ |
| Cloud Storage | 0 GB | 10 GB | 100 GB |
| Custom Branding | ❌ | ❌ | ✅ |
| API Access | ❌ | ❌ | ✅ |
| Priority Support | ❌ | ✅ | ✅ |
| **Price** | **Free** | **$15/mo** | **$50/mo** |

## 📋 Prerequisites

- Go 1.21 or higher
- PostgreSQL 15 or higher
- Redis 7 or higher
- Stripe account (for payments)
- SMTP server (for emails)

## 🛠️ Technology Stack

- **Framework**: Gin (Go web framework)
- **Database**: PostgreSQL with GORM ORM
- **Cache**: Redis
- **Authentication**: JWT
- **Payments**: Stripe
- **WebSockets**: Gorilla WebSocket
- **Email**: SMTP with gomail
- **WebRTC**: Pion WebRTC

## 📁 Project Structure

```
backend/
├── cmd/
│   └── api/
│       └── main.go              # Application entry point
├── internal/
│   ├── auth/                    # Authentication logic
│   │   ├── service.go          # Business logic
│   │   └── handler.go          # HTTP handlers
│   ├── subscriptions/           # Subscription management
│   │   ├── service.go
│   │   └── handler.go
│   ├── rooms/                   # Meeting room management
│   │   ├── service.go
│   │   └── handler.go
│   ├── webrtc/                  # WebRTC signaling
│   │   └── signaling.go
│   ├── middleware/              # Middleware (auth, CORS, etc.)
│   ├── models/                  # Database models
│   └── database/                # Database migrations
├── pkg/
│   ├── config/                  # Configuration
│   ├── database/                # Database connection
│   ├── redis/                   # Redis connection
│   └── utils/                   # Utility functions
├── Dockerfile
├── docker-compose.yml
├── Makefile
└── README.md
```

## 🚀 Quick Start

### Option 1: Using Docker (Recommended)

1. **Clone the repository**
```bash
cd backend
```

2. **Create .env file**
```bash
cp .env.example .env
# Edit .env with your configuration
```

3. **Start the services**
```bash
docker-compose up -d
```

The API will be available at `http://localhost:8080`

### Option 2: Manual Setup

1. **Install dependencies**
```bash
go mod download
```

2. **Set up PostgreSQL**
```bash
createdb calling_app
```

3. **Set up Redis**
```bash
# Make sure Redis is running
redis-server
```

4. **Configure environment variables**
```bash
cp .env.example .env
# Edit .env with your settings
```

5. **Run migrations**
```bash
go run cmd/api/main.go
# Migrations run automatically on startup
```

6. **Start the server**
```bash
go run cmd/api/main.go
# Or using make
make run
```

## ⚙️ Configuration

### Environment Variables

Create a `.env` file in the backend directory:

```env
# Server
PORT=8080
ENV=development
API_VERSION=v1

# Database
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=postgres
DB_NAME=calling_app
DB_SSLMODE=disable

# Redis
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_PASSWORD=
REDIS_DB=0

# JWT
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
JWT_EXPIRY_HOURS=24
JWT_REFRESH_EXPIRY_HOURS=720

# Stripe
STRIPE_SECRET_KEY=sk_test_your_stripe_secret_key
STRIPE_WEBHOOK_SECRET=whsec_your_webhook_secret
STRIPE_PRO_PRICE_ID=price_xxxxxxxxxxxxx
STRIPE_BUSINESS_PRICE_ID=price_xxxxxxxxxxxxx

# Email (SMTP)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=your-email@gmail.com
SMTP_PASSWORD=your-app-password
SMTP_FROM=noreply@yourapp.com
SMTP_FROM_NAME=Calling App

# Frontend URL
FRONTEND_URL=http://localhost:3000

# CORS
CORS_ALLOWED_ORIGINS=http://localhost:3000,http://localhost:8080
```

### Stripe Setup

1. **Create Stripe Account** at https://stripe.com

2. **Get API Keys**
   - Go to Developers → API keys
   - Copy your Secret key

3. **Create Products and Prices**
   ```bash
   # Create Pro plan
   stripe products create --name="Pro Plan"
   stripe prices create --product=prod_xxx --currency=usd --unit-amount=1500 --recurring[interval]=month

   # Create Business plan
   stripe products create --name="Business Plan"
   stripe prices create --product=prod_xxx --currency=usd --unit-amount=5000 --recurring[interval]=month
   ```

4. **Set up Webhook**
   - Go to Developers → Webhooks
   - Add endpoint: `https://your-domain.com/api/v1/subscriptions/webhook`
   - Select events:
     - `checkout.session.completed`
     - `customer.subscription.updated`
     - `customer.subscription.deleted`
     - `invoice.payment_failed`

### SMTP Setup (Gmail Example)

1. Enable 2-factor authentication on your Google account
2. Generate an App Password:
   - Go to Google Account → Security → 2-Step Verification → App passwords
   - Generate password for "Mail"
3. Use the generated password as `SMTP_PASSWORD`

## 📚 API Documentation

### Base URL
```
http://localhost:8080/api/v1
```

### Authentication Endpoints

#### Register
```http
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "first_name": "John",
  "last_name": "Doe"
}
```

#### Login
```http
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

Response:
```json
{
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "first_name": "John",
    "last_name": "Doe",
    "subscription_plan": "free"
  },
  "token": "jwt_token",
  "refresh_token": "refresh_token"
}
```

#### Get Profile
```http
GET /auth/profile
Authorization: Bearer {token}
```

#### Verify Email
```http
GET /auth/verify-email?token={verification_token}
```

#### Request Password Reset
```http
POST /auth/forgot-password
Content-Type: application/json

{
  "email": "user@example.com"
}
```

#### Reset Password
```http
POST /auth/reset-password
Content-Type: application/json

{
  "token": "reset_token",
  "new_password": "newpassword123"
}
```

### Subscription Endpoints

#### Get All Plans
```http
GET /subscriptions/plans
```

#### Get Current Subscription
```http
GET /subscriptions/current
Authorization: Bearer {token}
```

#### Create Checkout Session
```http
POST /subscriptions/checkout
Authorization: Bearer {token}
Content-Type: application/json

{
  "plan_type": "pro"
}
```

Response:
```json
{
  "checkout_url": "https://checkout.stripe.com/..."
}
```

#### Cancel Subscription
```http
POST /subscriptions/cancel
Authorization: Bearer {token}
```

### Room Endpoints

#### Create Room
```http
POST /rooms
Authorization: Bearer {token}
Content-Type: application/json

{
  "name": "Team Meeting",
  "description": "Weekly sync",
  "is_password_locked": false,
  "has_waiting_room": false,
  "max_participants": 10
}
```

#### Get User's Rooms
```http
GET /rooms
Authorization: Bearer {token}
```

#### Get Room Details
```http
GET /rooms/{room_id}
```

#### Join Room
```http
POST /rooms/{room_id}/join
Authorization: Bearer {token} (optional for guests)
Content-Type: application/json

{
  "password": "room_password",
  "name": "Guest Name"
}
```

#### Leave Room
```http
POST /rooms/{room_id}/leave
Authorization: Bearer {token}
```

#### End Room (Host Only)
```http
POST /rooms/{room_id}/end
Authorization: Bearer {token}
```

#### Get Room Participants
```http
GET /rooms/{room_id}/participants
```

### WebRTC WebSocket

Connect to WebSocket for signaling:
```
ws://localhost:8080/api/v1/ws?room_id={room_id}&user_id={user_id}
```

## 🧪 Testing

```bash
# Run all tests
make test

# Run specific package tests
go test ./internal/auth/...

# Run with coverage
go test -cover ./...
```

## 🐳 Docker Commands

```bash
# Build Docker image
make docker-build

# Start all services
make docker-up

# View logs
make docker-logs

# Stop all services
make docker-down

# Rebuild and restart
docker-compose up -d --build
```

## 📊 Database Migrations

Migrations run automatically when the application starts. The system will:
1. Create all necessary tables
2. Seed subscription plans (Free, Pro, Business)

Manual migration (if needed):
```bash
go run cmd/api/main.go migrate
```

## 🔒 Security Best Practices

1. **Change JWT Secret**: Use a strong, random secret in production
2. **Use HTTPS**: Always use HTTPS in production
3. **Secure Stripe Keys**: Never commit Stripe keys to version control
4. **Rate Limiting**: Configure rate limits based on your needs
5. **CORS**: Set specific allowed origins in production
6. **Database**: Use strong passwords and limit access
7. **Environment Variables**: Never commit .env files

## 🚀 Deployment

### Deploy to DigitalOcean

1. **Create Droplet**
   - Choose Ubuntu 22.04
   - At least 2GB RAM

2. **Install Docker**
   ```bash
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   ```

3. **Clone and Deploy**
   ```bash
   git clone your-repo
   cd backend
   cp .env.example .env
   # Edit .env with production values
   docker-compose up -d
   ```

4. **Set up Nginx** (optional, for SSL)
   ```bash
   sudo apt install nginx certbot python3-certbot-nginx
   # Configure nginx reverse proxy
   sudo certbot --nginx -d your-domain.com
   ```

### Deploy to AWS

Use AWS ECS, EC2, or App Runner with the provided Dockerfile.

## 🐛 Troubleshooting

### Database Connection Issues
```bash
# Check if PostgreSQL is running
docker-compose ps

# View PostgreSQL logs
docker-compose logs postgres

# Connect to database manually
psql -h localhost -U postgres -d calling_app
```

### Redis Connection Issues
```bash
# Check if Redis is running
docker-compose ps

# Test Redis connection
redis-cli ping
```

### Migration Issues
```bash
# Drop and recreate database
docker-compose down -v
docker-compose up -d
```

## 📝 Development

### Adding New Endpoints

1. Create service in `internal/{feature}/service.go`
2. Create handler in `internal/{feature}/handler.go`
3. Register routes in `cmd/api/main.go`

### Adding New Models

1. Create model in `internal/models/{model}.go`
2. Add to migrations in `internal/database/migrate.go`
3. Run application to auto-migrate

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Write tests
5. Submit a pull request

## 📄 License

MIT License

## 🆘 Support

For issues and questions:
- Create an issue on GitHub
- Email: support@yourapp.com

---

Built with ❤️ using Go, Gin, PostgreSQL, Redis, and Stripe
