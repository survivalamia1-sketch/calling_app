# 📱 Video Calling Platform - Complete SaaS Solution

A production-ready video calling platform (like Zoom) with subscription management, built for Flutter mobile apps.

## 🎯 Project Overview

This is a **complete SaaS video calling platform** with:
- Full-featured Go backend API
- Subscription-based monetization (Free, Pro, Business)
- Stripe payment integration
- WebRTC video calling with signaling server
- Real-time communication via WebSocket
- Ready to connect with your Flutter app

## 📂 Repository Structure

```
calling_app/
├── backend/                    # 🔥 Go Backend (Production-Ready)
│   ├── cmd/api/               # Main application
│   ├── internal/              # Business logic
│   │   ├── auth/             # Authentication system
│   │   ├── subscriptions/    # Stripe integration
│   │   ├── rooms/            # Meeting management
│   │   ├── webrtc/           # WebRTC signaling
│   │   ├── models/           # Database models
│   │   └── middleware/       # JWT, CORS, etc.
│   ├── pkg/                   # Shared packages
│   ├── Dockerfile            # Docker containerization
│   ├── docker-compose.yml    # Full stack deployment
│   └── README.md             # Complete documentation
│
├── client/                    # React Web Client (Demo)
│   ├── src/
│   │   ├── pages/           # Home, Room pages
│   │   ├── components/      # VideoGrid, Chat, Controls
│   │   └── services/        # Socket, WebRTC
│   └── package.json
│
├── QUICKSTART.md             # Get started in 5 minutes
├── PROJECT_OVERVIEW.md       # This file
└── README.md                 # Main documentation
```

## 🚀 Tech Stack

### Backend (Go)
| Technology | Purpose |
|------------|---------|
| **Go 1.21** | Programming language |
| **Gin** | Web framework |
| **PostgreSQL** | Primary database |
| **GORM** | ORM for database operations |
| **Redis** | Caching & sessions |
| **JWT** | Authentication tokens |
| **Stripe** | Payment processing |
| **WebSocket** | Real-time signaling |
| **Pion WebRTC** | WebRTC framework (ready to use) |
| **Docker** | Containerization |

### Frontend Options
1. **React** (included) - Web-based demo client
2. **Flutter** (your choice) - Mobile app with `flutter_webrtc`

## ✨ Features Implemented

### ✅ Core Backend Features

#### 1. Authentication & User Management
- User registration with email/password
- JWT-based authentication
- Email verification system
- Password reset functionality
- Refresh token support
- User profile management

#### 2. Subscription Management
- Three-tier subscription system:
  - **Free**: 40min meetings, 3 participants
  - **Pro**: Unlimited meetings, 10 participants, $15/mo
  - **Business**: Unlimited meetings, 50 participants, $50/mo
- Stripe checkout integration
- Automatic subscription creation
- Webhook handling for payment events
- Subscription status tracking
- Upgrade/downgrade support
- Cancellation handling

#### 3. Meeting/Room Management
- Create scheduled or instant meetings
- Password-protected rooms
- Waiting room support
- Join as authenticated user or guest
- Host controls (end meeting, manage participants)
- Participant tracking
- Room duration limits based on subscription
- Max participants enforcement

#### 4. WebRTC Signaling
- WebSocket-based signaling server
- Real-time peer-to-peer negotiation
- Room-based connection management
- Support for multiple participants
- Automatic cleanup of disconnected clients

#### 5. Security & Middleware
- JWT authentication middleware
- CORS configuration
- Error handling & recovery
- Input validation
- SQL injection protection (via GORM)

### 📱 Frontend (React Demo)

The included React app demonstrates:
- Video calling interface
- Screen sharing
- Text chat
- Participant grid view
- Mute/unmute controls
- Room creation and joining

**Note**: This is a demo. You'll build a production Flutter app.

## 💰 Business Model

### Subscription Plans

| Feature | Free | Pro ($15/mo) | Business ($50/mo) |
|---------|------|--------------|-------------------|
| Meeting Duration | 40 min | ∞ | ∞ |
| Max Participants | 3 | 10 | 50 |
| Screen Sharing | ✅ | ✅ | ✅ |
| Recording | ❌ | ✅ | ✅ |
| Cloud Storage | 0 GB | 10 GB | 100 GB |
| Custom Branding | ❌ | ❌ | ✅ |
| API Access | ❌ | ❌ | ✅ |
| Priority Support | ❌ | ✅ | ✅ |

### Revenue Model
- **Freemium**: Free tier drives user acquisition
- **Conversion**: Upsell to Pro/Business for advanced features
- **Recurring**: Monthly subscription revenue
- **Scale**: Low marginal cost per user

## 🔌 API Endpoints

### Base URL
```
http://localhost:8080/api/v1
```

### Authentication
- `POST /auth/register` - Register new user
- `POST /auth/login` - Login user
- `GET /auth/profile` - Get user profile
- `GET /auth/verify-email` - Verify email
- `POST /auth/forgot-password` - Request password reset
- `POST /auth/reset-password` - Reset password
- `POST /auth/refresh` - Refresh access token

### Subscriptions
- `GET /subscriptions/plans` - Get all plans
- `GET /subscriptions/current` - Get user's subscription
- `POST /subscriptions/checkout` - Create Stripe checkout
- `POST /subscriptions/cancel` - Cancel subscription
- `POST /subscriptions/webhook` - Stripe webhook handler

### Rooms (Meetings)
- `POST /rooms` - Create new room
- `GET /rooms` - Get user's rooms
- `GET /rooms/:id` - Get room details
- `POST /rooms/:id/join` - Join a room
- `POST /rooms/:id/leave` - Leave room
- `POST /rooms/:id/end` - End room (host only)
- `DELETE /rooms/:id` - Delete room
- `GET /rooms/:id/participants` - Get participants

### WebRTC
- `ws://localhost:8080/api/v1/ws` - WebSocket signaling

Full API documentation: See `backend/README.md`

## 🎯 For Flutter Developers

### What You Need to Build

Your Flutter app should implement:

1. **Authentication Screens**
   - Login/Register
   - Email verification
   - Password reset

2. **Subscription Management**
   - Display plans
   - Stripe checkout (use `flutter_stripe`)
   - Show current plan
   - Manage subscription

3. **Meeting Interface**
   - Create meeting
   - Join meeting
   - Video calling (use `flutter_webrtc`)
   - Chat
   - Controls (mute/unmute, screen share)

4. **Profile & Settings**
   - User profile
   - Subscription status
   - Meeting history

### Flutter Packages Needed

```yaml
dependencies:
  flutter_webrtc: ^0.9.48      # WebRTC
  socket_io_client: ^2.0.3     # WebSocket
  dio: ^5.4.0                   # HTTP client
  flutter_stripe: ^10.0.0      # Payments
  provider: ^6.1.1              # State management
```

### Connection Setup

```dart
// API Base URL
const String apiBaseUrl = "http://localhost:8080/api/v1";

// WebSocket URL
const String wsUrl = "ws://localhost:8080/api/v1/ws";

// Example: Login
final response = await dio.post(
  '$apiBaseUrl/auth/login',
  data: {
    'email': email,
    'password': password,
  },
);

// Store token
final token = response.data['token'];

// Use in headers
dio.options.headers['Authorization'] = 'Bearer $token';
```

## 🚀 Getting Started

### Quick Start (5 Minutes)

1. **Start Backend**
```bash
cd backend
cp .env.example .env
# Edit .env with your settings
docker-compose up -d
```

2. **Verify**
```bash
curl http://localhost:8080/health
```

3. **Test API**
```bash
# Register user
curl -X POST http://localhost:8080/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123","first_name":"John","last_name":"Doe"}'
```

**Full Guide**: See `QUICKSTART.md`

## 📚 Documentation

- **Quick Start**: [`QUICKSTART.md`](QUICKSTART.md) - Get running in 5 minutes
- **Backend Docs**: [`backend/README.md`](backend/README.md) - Complete API documentation
- **Project Overview**: [`PROJECT_OVERVIEW.md`](PROJECT_OVERVIEW.md) - This file

## 🏗️ Architecture

```
┌─────────────────────────────────────┐
│      Flutter Mobile App             │
│  (You will build this)              │
└──────────────┬──────────────────────┘
               │
               │ HTTP/WebSocket
               │
┌──────────────▼──────────────────────┐
│      Go Backend API                 │
│  ├─ Authentication                  │
│  ├─ Subscription Management         │
│  ├─ Room Management                 │
│  └─ WebRTC Signaling                │
└──────────────┬──────────────────────┘
               │
      ┌────────┴────────┐
      │                 │
┌─────▼─────┐    ┌──────▼──────┐
│ PostgreSQL│    │   Stripe    │
│ Database  │    │   Payment   │
└───────────┘    └─────────────┘
```

## 💡 Key Design Decisions

### Why Go?
- High performance & low latency
- Excellent concurrency for real-time apps
- Strong WebRTC support with Pion
- Easy deployment

### Why PostgreSQL?
- ACID compliance for payments
- JSON support for flexible data
- Proven reliability

### Why Stripe?
- Industry standard
- Comprehensive API
- Strong subscription support
- Automatic billing

### Why JWT?
- Stateless authentication
- Mobile-friendly
- Easy to implement

## 🔐 Security Features

- ✅ Password hashing with bcrypt
- ✅ JWT token authentication
- ✅ Email verification
- ✅ Password reset with expiring tokens
- ✅ CORS protection
- ✅ SQL injection protection (GORM)
- ✅ Rate limiting ready
- ✅ Secure Stripe webhooks

## 📊 Database Schema

### Users
- ID, Email, Password (hashed)
- Name, Avatar
- Email verified status
- Stripe customer ID
- Timestamps

### Subscriptions
- User ID
- Plan ID
- Status (active/canceled/past_due)
- Stripe subscription ID
- Period start/end
- Timestamps

### Subscription Plans
- Type (free/pro/business)
- Features (duration, participants, etc.)
- Price, Stripe price ID

### Rooms
- ID, Host ID
- Name, Description
- Status (waiting/active/ended)
- Password protection
- Max participants
- Timestamps

### Room Participants
- Room ID, User ID
- Join/leave timestamps
- Status (muted, video off)

## 🎯 Next Steps

### Phase 1: Setup ✅ (Done)
- [x] Backend implementation
- [x] Docker setup
- [x] Documentation

### Phase 2: Flutter App (Your Turn)
- [ ] Authentication UI
- [ ] Subscription UI
- [ ] Video calling UI
- [ ] WebRTC integration
- [ ] Stripe integration

### Phase 3: Enhancements
- [ ] Recording functionality
- [ ] Virtual backgrounds
- [ ] Screen sharing improvements
- [ ] Admin dashboard
- [ ] Analytics

### Phase 4: Production
- [ ] Deploy backend (DigitalOcean/AWS)
- [ ] SSL certificates
- [ ] CDN setup
- [ ] Monitoring & logging
- [ ] Publish Flutter app

## 💻 Development Workflow

### Backend Development
```bash
cd backend

# Local development
go run cmd/api/main.go

# Or with Docker
docker-compose up --build

# Run tests
go test ./...

# View logs
docker-compose logs -f
```

### Adding New Features
1. Create models in `internal/models/`
2. Create service in `internal/{feature}/service.go`
3. Create handler in `internal/{feature}/handler.go`
4. Register routes in `cmd/api/main.go`
5. Update documentation

## 🐛 Common Issues

### Database Connection Failed
```bash
docker-compose ps  # Check if PostgreSQL is running
docker-compose logs postgres  # View logs
```

### Port Already in Use
```bash
# Change ports in docker-compose.yml
ports:
  - "8081:8080"  # Use 8081 instead
```

### Stripe Integration Not Working
- Check API keys in `.env`
- Verify webhook secret
- Test with Stripe CLI: `stripe listen --forward-to localhost:8080/api/v1/subscriptions/webhook`

## 📞 Support

- **Issues**: Create GitHub issue
- **Questions**: Check documentation
- **Backend Docs**: `backend/README.md`
- **Quick Start**: `QUICKSTART.md`

## 📄 License

MIT License - Free to use for personal and commercial projects

## 🎉 Summary

You now have:
- ✅ Complete production-ready backend
- ✅ Full authentication system
- ✅ Stripe subscription integration
- ✅ Meeting/room management
- ✅ WebRTC signaling server
- ✅ Docker deployment setup
- ✅ Comprehensive documentation
- ✅ Ready for Flutter app development

**Start building your Flutter app and connect it to this backend!**

---

Built with ❤️ for Flutter developers
