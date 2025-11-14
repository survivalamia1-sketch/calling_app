# 🎥 Video Calling SaaS Platform

A complete, production-ready video calling platform with subscription management, built with modern technologies.

## 🌟 Features

### ✅ Complete Authentication System
- User registration with email verification
- Secure login with JWT tokens
- Password reset functionality
- Email verification workflows

### 📞 Video Calling (WebRTC)
- Real-time video and audio communication
- WebSocket signaling server
- Support for multiple participants
- Screen sharing capability
- Meeting rooms with unique codes

### 💼 Subscription Management
- Multiple subscription plans (Free, Pro, Enterprise)
- Stripe payment integration
- Subscription upgrade/downgrade
- Billing history
- Webhook handling for payment events

### 📅 Meeting Management
- Create instant or scheduled meetings
- Join meetings by code
- Meeting history
- Participant management
- Waiting room feature

### 👥 Admin Dashboard
- User management
- Subscription overview
- Meeting analytics
- System monitoring
- Revenue tracking

### 📱 Cross-Platform Support
- **Flutter Mobile App**: Android & iOS
- **Flutter Web App**: Progressive Web App
- **Flutter Desktop**: Windows, macOS, Linux
- **Admin Dashboard**: Next.js web application

## 🏗️ Architecture

```
calling_app/
├── backend/              # Go API server
│   ├── api/             # HTTP handlers
│   ├── internal/        # Business logic
│   ├── models/          # Database models
│   └── migrations/      # SQL migrations
│
├── flutter_app/         # Flutter client (all platforms)
│   ├── lib/
│   │   ├── core/       # Core utilities, DI, router
│   │   └── features/   # Feature modules
│   │       ├── auth/
│   │       ├── home/
│   │       ├── meetings/
│   │       ├── subscriptions/
│   │       ├── profile/
│   │       ├── settings/
│   │       └── support/
│   │
├── admin-dashboard/     # Next.js admin panel
│   ├── src/
│   │   ├── app/
│   │   ├── components/
│   │   └── lib/
│   │
└── docker-compose.yml   # Production deployment
```

## 🛠️ Tech Stack

### Backend (Go)
- **Framework**: Gin
- **Database**: PostgreSQL with GORM
- **Cache**: Redis
- **Auth**: JWT
- **Payments**: Stripe
- **Email**: SMTP
- **WebSocket**: Gorilla WebSocket
- **Real-time**: Custom signaling server

### Frontend (Flutter)
- **Architecture**: Clean Architecture
- **State Management**: flutter_bloc
- **Navigation**: go_router
- **DI**: GetIt
- **API**: Dio
- **WebRTC**: flutter_webrtc
- **Payments**: Stripe SDK
- **Local Storage**: FlutterSecureStorage

### Admin (Next.js)
- **Framework**: Next.js 14
- **UI**: Tailwind CSS + shadcn/ui
- **Charts**: Recharts
- **API**: Fetch API

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- Flutter SDK (for mobile development)
- Node.js 18+ (for admin dashboard development)
- Go 1.21+ (for backend development)

### 1. Clone Repository
```bash
git clone <repository-url>
cd calling_app
```

### 2. Configure Environment
```bash
cp .env.example .env
# Edit .env with your configurations
```

### 3. Start with Docker
```bash
# Start all services
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f
```

### 4. Access Applications
- **Backend API**: http://localhost:8080
- **Admin Dashboard**: http://localhost:3001
- **API Docs**: http://localhost:8080/swagger

## 📱 Flutter App Setup

### Development

```bash
cd flutter_app

# Install dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Run on device
flutter run --dart-define=API_BASE_URL=http://localhost:8080/api/v1
```

### Build for Production

**Android:**
```bash
flutter build apk --release \
  --dart-define=API_BASE_URL=https://api.yourdomain.com/api/v1
```

**iOS:**
```bash
flutter build ios --release \
  --dart-define=API_BASE_URL=https://api.yourdomain.com/api/v1
```

**Web:**
```bash
flutter build web --release \
  --dart-define=API_BASE_URL=https://api.yourdomain.com/api/v1
```

## 🔧 Development

### Backend Development
```bash
cd backend

# Install dependencies
go mod download

# Run migrations
go run cmd/server/main.go migrate

# Start server
go run cmd/server/main.go
```

### Admin Dashboard Development
```bash
cd admin-dashboard

# Install dependencies
npm install

# Start development server
npm run dev
```

## 🐳 Production Deployment

See [DEPLOYMENT.md](DEPLOYMENT.md) for comprehensive deployment instructions.

**Quick Deploy:**
```bash
# Configure production environment
cp .env.example .env
nano .env  # Set production values

# Build and start all services
docker-compose up -d --build

# Check status
docker-compose ps
```

## 📚 API Documentation

### Authentication Endpoints
- `POST /api/v1/auth/register` - Register new user
- `POST /api/v1/auth/login` - Login
- `POST /api/v1/auth/verify` - Verify email
- `POST /api/v1/auth/forgot-password` - Request password reset
- `POST /api/v1/auth/reset-password` - Reset password
- `GET /api/v1/auth/me` - Get current user

### Meetings Endpoints
- `GET /api/v1/rooms` - List meetings
- `POST /api/v1/rooms` - Create meeting
- `GET /api/v1/rooms/:id` - Get meeting details
- `PUT /api/v1/rooms/:id` - Update meeting
- `DELETE /api/v1/rooms/:id` - Delete meeting
- `POST /api/v1/rooms/join` - Join meeting

### Subscriptions Endpoints
- `GET /api/v1/subscriptions/plans` - List plans
- `GET /api/v1/subscriptions/me` - Get current subscription
- `POST /api/v1/subscriptions/checkout` - Create checkout session
- `POST /api/v1/subscriptions/cancel` - Cancel subscription

### WebSocket
- `WS /ws?room_id=<room_id>` - Connect to signaling server

## 🔐 Security Features

- ✅ JWT authentication
- ✅ Password hashing with bcrypt
- ✅ Email verification required
- ✅ Rate limiting
- ✅ CORS protection
- ✅ SQL injection prevention (GORM)
- ✅ XSS protection headers
- ✅ Secure password reset tokens
- ✅ HTTPS/TLS support
- ✅ Webhook signature verification

## 📊 Database Schema

### Users
- id, email, password_hash, first_name, last_name
- is_verified, is_active, email_verified_at
- plan_type, created_at, updated_at

### Rooms (Meetings)
- id, title, description, room_code, host_id
- scheduled_at, duration, max_participants
- is_active, requires_approval
- created_at, started_at, ended_at

### Subscriptions
- id, user_id, plan_id, stripe_customer_id, stripe_subscription_id
- status, billing_cycle
- current_period_start, current_period_end
- cancel_at_period_end, canceled_at

### Subscription Plans
- id, name, description, priority
- monthly_price, yearly_price
- max_participants, max_meeting_duration
- features (JSON), created_at

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

[Your License Here]

## 🔗 Links

- [Backend Documentation](./backend/README.md)
- [Flutter App Documentation](./flutter_app/README.md)
- [Admin Dashboard Documentation](./admin-dashboard/README.md)
- [Deployment Guide](./DEPLOYMENT.md)

## 💡 Roadmap

- [ ] Recording functionality
- [ ] AI transcription
- [ ] Virtual backgrounds
- [ ] Breakout rooms
- [ ] Polls and Q&A
- [ ] Calendar integrations
- [ ] Mobile notifications
- [ ] Analytics dashboard enhancements

## 📞 Support

- 📧 Email: support@yourdomain.com
- 📖 Documentation: `/docs`
- 🐛 Issues: GitHub Issues

---

**Built with ❤️ using modern technologies**
