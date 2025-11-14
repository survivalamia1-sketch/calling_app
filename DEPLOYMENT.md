# Video Calling App - Production Deployment Guide

Complete guide to deploy the video calling platform to production.

## 📋 Prerequisites

- Docker & Docker Compose installed
- Domain name configured (optional but recommended)
- SSL certificates (for HTTPS)
- Stripe account for payments
- SMTP server credentials for emails
- Minimum 2GB RAM, 2 CPU cores

## 🚀 Quick Start (Development)

1. **Clone the repository:**
```bash
git clone <repository-url>
cd calling_app
```

2. **Set up environment variables:**
```bash
cp .env.example .env
# Edit .env with your configurations
```

3. **Start all services:**
```bash
docker-compose up -d
```

4. **Access the applications:**
- Backend API: http://localhost:8080
- Admin Dashboard: http://localhost:3001
- PostgreSQL: localhost:5432
- Redis: localhost:6379

## 🏭 Production Deployment

### 1. Server Setup

**Recommended Specifications:**
- Ubuntu 22.04 LTS or similar
- 4GB RAM minimum
- 20GB disk space
- 2 CPU cores

**Install Docker:**
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add user to docker group
sudo usermod -aG docker $USER
```

### 2. Configure Environment

```bash
# Create .env file
cp .env.example .env

# Edit with production values
nano .env
```

**Critical Environment Variables:**
``env
# Database - Use strong passwords!
DB_PASSWORD=<generate-strong-password>

# JWT Secret - Must be secure!
JWT_SECRET=<generate-random-64-char-string>

# SMTP Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_FROM=noreply@yourdomain.com
SMTP_PASSWORD=<your-app-password>

# Stripe Keys (Live mode for production)
STRIPE_SECRET_KEY=sk_live_...
STRIPE_PUBLISHABLE_KEY=pk_live_...
STRIPE_WEBHOOK_SECRET=whsec_...

# Application URLs
APP_URL=https://yourdomain.com
API_URL=https://api.yourdomain.com
ADMIN_URL=https://admin.yourdomain.com

# CORS
CORS_ORIGINS=https://yourdomain.com,https://admin.yourdomain.com
```

### 3. SSL Certificates

**Using Let's Encrypt (Recommended):**
```bash
# Install certbot
sudo apt install certbot

# Get certificates
sudo certbot certonly --standalone -d api.yourdomain.com
sudo certbot certonly --standalone -d admin.yourdomain.com

# Copy to project
mkdir -p ssl
sudo cp /etc/letsencrypt/live/api.yourdomain.com/fullchain.pem ssl/cert.pem
sudo cp /etc/letsencrypt/live/api.yourdomain.com/privkey.pem ssl/key.pem
sudo chmod 644 ssl/*.pem
```

**Update nginx.conf:**
- Uncomment SSL server blocks
- Update `server_name` with your domains
- Ensure SSL paths are correct

### 4. Database Migration

```bash
# Run migrations
docker-compose exec backend ./main migrate
```

### 5. Start Production Services

```bash
# Build and start all services
docker-compose up -d --build

# Check logs
docker-compose logs -f

# Check service status
docker-compose ps
```

### 6. Configure Firewall

```bash
# Allow HTTP/HTTPS
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Allow SSH
sudo ufw allow 22/tcp

# Enable firewall
sudo ufw enable
```

## 📱 Flutter App Deployment

### Android

1. **Configure environment:**
```bash
cd flutter_app
```

2. **Build APK:**
```bash
flutter build apk --release \
  --dart-define=API_BASE_URL=https://api.yourdomain.com/api/v1 \
  --dart-define=WS_URL=wss://api.yourdomain.com/ws
```

3. **Build App Bundle (for Play Store):**
```bash
flutter build appbundle --release \
  --dart-define=API_BASE_URL=https://api.yourdomain.com/api/v1 \
  --dart-define=WS_URL=wss://api.yourdomain.com/ws
```

### iOS

1. **Configure Xcode project**
2. **Build for release:**
```bash
flutter build ios --release \
  --dart-define=API_BASE_URL=https://api.yourdomain.com/api/v1 \
  --dart-define=WS_URL=wss://api.yourdomain.com/ws
```

### Web

```bash
flutter build web --release \
  --dart-define=API_BASE_URL=https://api.yourdomain.com/api/v1 \
  --dart-define=WS_URL=wss://api.yourdomain.com/ws

# Deploy to hosting (Netlify, Vercel, etc.)
```

## 🔐 Security Checklist

- [ ] Strong database passwords
- [ ] Secure JWT secret (64+ random characters)
- [ ] SSL certificates configured
- [ ] CORS origins restricted to your domains
- [ ] Rate limiting enabled (nginx)
- [ ] Firewall configured
- [ ] Regular backups configured
- [ ] Security headers enabled
- [ ] SMTP credentials secured
- [ ] Stripe webhooksecret configured

## 🔄 Stripe Webhook Setup

1. **Go to Stripe Dashboard** → Developers → Webhooks
2. **Add endpoint:**
   - URL: `https://api.yourdomain.com/api/v1/webhooks/stripe`
   - Events to send: `customer.subscription.*`, `checkout.session.completed`
3. **Copy webhook secret** to `.env` as `STRIPE_WEBHOOK_SECRET`
4. **Test webhook:**
```bash
stripe listen --forward-to localhost:8080/api/v1/webhooks/stripe
```

## 📊 Monitoring & Logs

**View logs:**
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f backend
docker-compose logs -f postgres
```

**Check service health:**
```bash
docker-compose ps
docker stats
```

**Database backup:**
```bash
# Backup
docker-compose exec postgres pg_dump -U videocall videocall > backup_$(date +%Y%m%d).sql

# Restore
docker-compose exec -T postgres psql -U videocall videocall < backup_20240101.sql
```

## 🔧 Maintenance

**Update application:**
```bash
git pull
docker-compose down
docker-compose up -d --build
```

**Scale services:**
```bash
# Scale backend instances
docker-compose up -d --scale backend=3
```

**Clean up:**
```bash
# Remove unused images
docker system prune -a

# Remove unused volumes
docker volume prune
```

## 🐛 Troubleshooting

**Backend won't start:**
```bash
# Check logs
docker-compose logs backend

# Check database connection
docker-compose exec backend ping postgres

# Restart service
docker-compose restart backend
```

**Database connection issues:**
```bash
# Check if postgres is running
docker-compose ps postgres

# Check postgres logs
docker-compose logs postgres

# Test connection
docker-compose exec postgres psql -U videocall -d videocall
```

**WebSocket connection fails:**
- Check nginx WebSocket configuration
- Verify CORS settings
- Check firewall allows WebSocket connections
- Ensure SSL is configured for WSS

## 📈 Performance Optimization

1. **Enable Redis caching**
2. **Configure CDN** for static assets
3. **Optimize images** and media files
4. **Enable Gzip** compression in nginx
5. **Set up database** connection pooling
6. **Monitor and scale** based on traffic

## 🔗 Useful Commands

```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# Rebuild specific service
docker-compose up -d --build backend

# View running containers
docker ps

# Execute command in container
docker-compose exec backend sh

# Follow logs in real-time
docker-compose logs -f --tail=100
```

## 📞 Support

- Documentation: `/docs`
- Issues: GitHub Issues
- Email: support@yourdomain.com

## 📄 License

[Your License]
