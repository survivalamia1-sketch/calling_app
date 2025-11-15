# Authentication Troubleshooting Guide

## Problem: Registration/Login Returns 400 Error

### Common Causes and Solutions

#### 1. **Password Too Short**
**Error**: `Password must be at least 8 characters`

**Solution**: Ensure passwords are at least 8 characters long
```dart
// Good
password: "Test1234"

// Bad
password: "test"  // Too short
```

---

#### 2. **Invalid Email Format**
**Error**: `Invalid email format`

**Solution**: Use a valid email address
```dart
// Good
email: "user@example.com"

// Bad
email: "notanemail"  // Missing @ and domain
```

---

#### 3. **Missing Required Fields**
**Error**: `FirstName is required` or `LastName is required`

**Solution**: Ensure all required fields are provided
```json
{
  "email": "user@example.com",
  "password": "Test1234",
  "first_name": "John",     // Required
  "last_name": "Doe"        // Required
}
```

---

#### 4. **Database Not Seeded**
**Error**: `failed to get free plan`

**Solution**: Check if backend properly seeded subscription plans

**Check Logs**:
```bash
docker logs calling_app_api | grep -i "subscription plan\|seed"
```

**Expected Output**:
```
✅ Created subscription plan: Free
✅ Created subscription plan: Pro
✅ Created subscription plan: Business
✅ Subscription plans seeded successfully
```

**If not seeded**, restart the backend:
```bash
docker-compose restart backend
```

---

#### 5. **Wrong API Endpoint**
**Error**: `404 Not Found`

**Cause**: API endpoint mismatch between Flutter app and backend

**Fixed**: Flutter app now uses correct endpoints:
- ✅ `/auth/profile` (was `/auth/me`)
- ✅ `/auth/register`
- ✅ `/auth/login`

---

## Testing the Backend Directly

### 1. Test Registration

```bash
cd backend
chmod +x test_registration.sh
./test_registration.sh
```

### 2. Manual cURL Test

**Registration**:
```bash
curl -X POST http://localhost:8080/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "Test123456",
    "first_name": "Test",
    "last_name": "User"
  }'
```

**Expected Success Response**:
```json
{
  "user": {
    "id": "uuid-here",
    "email": "test@example.com",
    "first_name": "Test",
    "last_name": "User",
    ...
  },
  "token": "jwt-token-here",
  "refresh_token": "refresh-token-here"
}
```

**Expected Error Response** (if validation fails):
```json
{
  "error": "Validation failed",
  "fields": {
    "Password": "Password must be at least 8 characters",
    "Email": "Invalid email format"
  }
}
```

**Login**:
```bash
curl -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "Test123456"
  }'
```

---

## Checking Backend Logs

### View Live Logs
```bash
docker logs -f calling_app_api
```

### Check for Errors
```bash
docker logs calling_app_api 2>&1 | grep -i "error\|fail"
```

### Check Startup Sequence
```bash
docker logs calling_app_api | head -50
```

**Expected startup logs**:
```
✅ Database migrations completed
✅ Created subscription plan: Free
✅ Created subscription plan: Pro
✅ Created subscription plan: Business
✅ Subscription plans seeded successfully
✅ Default admin created
🚀 Server starting on :8080 (env: development)
📚 API Version: v1
[GIN-debug] Listening and serving HTTP on :8080
```

---

## Flutter App Debugging

### 1. Check API Base URL

**File**: `flutter_app/lib/core/constants/api_constants.dart`

```dart
static const String apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://localhost:8080/api/v1',
);
```

**For Android Emulator**, use:
```dart
defaultValue: 'http://10.0.2.2:8080/api/v1',
```

**For iOS Simulator**, use:
```dart
defaultValue: 'http://localhost:8080/api/v1',
```

**For Physical Device** (same network), use:
```dart
defaultValue: 'http://YOUR_COMPUTER_IP:8080/api/v1',
```

### 2. Enable Dio Logging

**File**: `flutter_app/lib/core/network/dio_client.dart`

Add logging interceptor to see requests:
```dart
import 'package:dio/dio.dart';

final dio = Dio()
  ..interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
    error: true,
  ));
```

### 3. Check Flutter Console

Look for error messages in your IDE's debug console when registration/login fails.

---

## Common Issues

### Issue: "Connection Refused"
**Cause**: Flutter app can't reach the backend

**Solutions**:
1. Ensure backend is running: `docker ps | grep calling_app_api`
2. Check correct IP for your platform (see above)
3. Check firewall settings

### Issue: "record not found" on Login
**Cause**: User doesn't exist (registration failed)

**Solution**:
1. Fix registration first
2. Check backend logs for registration errors
3. Verify subscription plans are seeded

### Issue: CORS Error
**Cause**: Browser blocking cross-origin requests

**Solution**: Backend already configured CORS, but check:
```bash
# Check .env file
CORS_ALLOWED_ORIGINS=http://localhost:3000,http://localhost:8080
```

---

## Quick Diagnostic Checklist

- [ ] Backend is running (`docker ps`)
- [ ] Database is connected (check backend logs)
- [ ] Subscription plans are seeded (check backend logs)
- [ ] Flutter app using correct API URL
- [ ] Password is at least 8 characters
- [ ] Email format is valid
- [ ] first_name and last_name are provided
- [ ] Network connectivity (ping backend IP)

---

## Need More Help?

1. **Run the test script**: `./backend/test_registration.sh`
2. **Check full logs**: `docker logs calling_app_api`
3. **Test with cURL**: See manual test commands above
4. **Check database**: Connect to postgres and verify `subscription_plans` table has data

### Connect to Database
```bash
docker exec -it calling_app_db psql -U postgres -d calling_app

# Check subscription plans
SELECT * FROM subscription_plans;

# Check if any users exist
SELECT id, email, first_name, last_name FROM users;
```
