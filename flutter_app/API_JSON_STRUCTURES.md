# API JSON Structures - Backend Expected Formats

هذا الملف يحتوي على جميع هياكل JSON التي يتوقعها الـ Backend من تطبيق Flutter.

---

## 🔐 Authentication Endpoints

### 1. Register (POST /api/v1/auth/register)

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123",
  "first_name": "John",
  "last_name": "Doe"
}
```

**Response:**
```json
{
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "first_name": "John",
    "last_name": "Doe",
    "avatar": "",
    "email_verified": false,
    "is_active": true,
    "subscription_plan": "free",
    "created_at": "2025-11-15T12:00:00Z"
  },
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "refresh_token": "eyJhbGciOiJIUzI1NiIs..."
}
```

**Validation:**
- `email`: required, must be valid email format
- `password`: required, minimum 8 characters
- `first_name`: required
- `last_name`: required

---

### 2. Login (POST /api/v1/auth/login)

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "first_name": "John",
    "last_name": "Doe",
    "subscription_plan": "free"
  },
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "refresh_token": "eyJhbGciOiJIUzI1NiIs..."
}
```

---

### 3. Refresh Token (POST /api/v1/auth/refresh)

**Request Body:**
```json
{
  "refresh_token": "eyJhbGciOiJIUzI1NiIs..."
}
```

**Response:**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIs..."
}
```

---

### 4. Forgot Password (POST /api/v1/auth/forgot-password)

**Request Body:**
```json
{
  "email": "user@example.com"
}
```

**Response:**
```json
{
  "message": "If the email exists, a reset link has been sent"
}
```

---

### 5. Reset Password (POST /api/v1/auth/reset-password)

**Request Body:**
```json
{
  "token": "reset_token_from_email",
  "new_password": "newpassword123"
}
```

**Response:**
```json
{
  "message": "Password reset successfully"
}
```

**Validation:**
- `token`: required
- `new_password`: required, minimum 8 characters

---

### 6. Update Profile (PUT /api/v1/auth/profile)
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
  "first_name": "John",
  "last_name": "Doe"
}
```

**Response:**
```json
{
  "id": "uuid",
  "email": "user@example.com",
  "first_name": "John",
  "last_name": "Doe",
  "subscription_plan": "free"
}
```

---

### 7. Change Password (POST /api/v1/auth/change-password)
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
  "old_password": "oldpassword123",
  "new_password": "newpassword123"
}
```

**Response:**
```json
{
  "message": "Password changed successfully"
}
```

---

### 8. Get Profile (GET /api/v1/auth/profile)
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
{
  "id": "uuid",
  "email": "user@example.com",
  "first_name": "John",
  "last_name": "Doe",
  "avatar": "",
  "email_verified": true,
  "is_active": true,
  "subscription_plan": "free",
  "last_login_at": "2025-11-15T12:00:00Z",
  "created_at": "2025-11-15T12:00:00Z"
}
```

---

## 📦 Subscription Endpoints

### 1. Get All Plans (GET /api/v1/subscriptions/plans)

**Response:**
```json
{
  "value": [
    {
      "id": "uuid",
      "type": "free",
      "name": "Free",
      "description": "Perfect for trying out the platform",
      "price": 0,
      "currency": "usd",
      "max_meeting_duration": 40,
      "max_participants": 3,
      "can_record": false,
      "can_screen_share": true,
      "cloud_storage_gb": 0,
      "can_custom_brand": false,
      "has_api_access": false,
      "has_priority_support": false
    },
    {
      "id": "uuid",
      "type": "pro",
      "name": "Pro",
      "description": "For professionals and small teams",
      "price": 1500,
      "currency": "usd",
      "max_meeting_duration": 0,
      "max_participants": 10,
      "can_record": true,
      "can_screen_share": true,
      "cloud_storage_gb": 10,
      "has_priority_support": true
    },
    {
      "id": "uuid",
      "type": "business",
      "name": "Business",
      "description": "For large teams and enterprises",
      "price": 5000,
      "currency": "usd",
      "max_meeting_duration": 0,
      "max_participants": 50,
      "can_record": true,
      "can_screen_share": true,
      "cloud_storage_gb": 100,
      "can_custom_brand": true,
      "has_api_access": true,
      "has_priority_support": true
    }
  ]
}
```

---

### 2. Create Checkout Session (POST /api/v1/subscriptions/checkout)
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
  "plan_type": "pro"
}
```

**Valid plan types:** `"pro"` or `"business"`

**Response:**
```json
{
  "checkout_url": "https://checkout.stripe.com/pay/cs_test_..."
}
```

---

### 3. Get Current Subscription (GET /api/v1/subscriptions/current)
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
{
  "subscription": {
    "id": "uuid",
    "user_id": "uuid",
    "plan_id": "uuid",
    "status": "active",
    "stripe_subscription_id": "sub_...",
    "current_period_start": "2025-11-15T12:00:00Z",
    "current_period_end": "2025-12-15T12:00:00Z",
    "plan": {
      "id": "uuid",
      "type": "pro",
      "name": "Pro",
      "price": 1500
    }
  }
}
```

---

### 4. Cancel Subscription (POST /api/v1/subscriptions/cancel)
**Headers:** `Authorization: Bearer {token}`

**Request Body:** (empty)

**Response:**
```json
{
  "message": "Subscription canceled successfully"
}
```

---

## 🏠 Room/Meeting Endpoints

### 1. Create Room (POST /api/v1/rooms)
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
  "name": "Team Meeting",
  "description": "Weekly sync meeting",
  "password": "",
  "is_password_locked": false,
  "has_waiting_room": false,
  "max_participants": 10,
  "scheduled_at": "2025-11-20T14:00:00Z"
}
```

**All fields are optional except:**
- If `is_password_locked` is `true`, then `password` is required
- `scheduled_at` can be `null` for immediate meetings

**Response:**
```json
{
  "id": "uuid",
  "host_id": "uuid",
  "name": "Team Meeting",
  "description": "Weekly sync meeting",
  "status": "waiting",
  "is_password_locked": false,
  "has_waiting_room": false,
  "max_participants": 10,
  "is_recording": false,
  "scheduled_at": "2025-11-20T14:00:00Z",
  "created_at": "2025-11-15T12:00:00Z"
}
```

---

### 2. Join Room (POST /api/v1/rooms/{id}/join)
**Headers:** `Authorization: Bearer {token}` (optional - can be guest)

**Request Body:**
```json
{
  "password": "room_password_if_locked",
  "name": "Guest Name"
}
```

**Note:** 
- `password` is required only if room is password locked
- `name` is required for guest users (when not authenticated)

**Response:**
```json
{
  "id": "uuid",
  "room_id": "uuid",
  "user_id": "uuid",
  "name": "John Doe",
  "is_guest": false,
  "is_host": false,
  "joined_at": "2025-11-15T12:00:00Z"
}
```

---

### 3. Get Room (GET /api/v1/rooms/{id})

**Response:**
```json
{
  "id": "uuid",
  "host_id": "uuid",
  "name": "Team Meeting",
  "description": "Weekly sync",
  "status": "active",
  "is_password_locked": false,
  "has_waiting_room": false,
  "max_participants": 10,
  "is_recording": false,
  "started_at": "2025-11-15T12:00:00Z",
  "created_at": "2025-11-15T12:00:00Z"
}
```

---

### 4. Get Room Participants (GET /api/v1/rooms/{id}/participants)

**Response:**
```json
{
  "participants": [
    {
      "id": "uuid",
      "room_id": "uuid",
      "user_id": "uuid",
      "name": "John Doe",
      "is_guest": false,
      "is_host": true,
      "is_muted": false,
      "is_video_off": false,
      "joined_at": "2025-11-15T12:00:00Z"
    }
  ]
}
```

---

### 5. Get User Rooms (GET /api/v1/rooms)
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
[
  {
    "id": "uuid",
    "name": "Team Meeting",
    "status": "active",
    "created_at": "2025-11-15T12:00:00Z"
  }
]
```

---

### 6. Leave Room (POST /api/v1/rooms/{id}/leave)
**Headers:** `Authorization: Bearer {token}`

**Request Body:** (empty)

**Response:**
```json
{
  "message": "Left room successfully"
}
```

---

### 7. End Room (POST /api/v1/rooms/{id}/end)
**Headers:** `Authorization: Bearer {token}` (host only)

**Request Body:** (empty)

**Response:**
```json
{
  "message": "Room ended successfully"
}
```

---

### 8. Delete Room (DELETE /api/v1/rooms/{id})
**Headers:** `Authorization: Bearer {token}` (host only)

**Response:**
```json
{
  "message": "Room deleted successfully"
}
```

---

## 👨‍💼 Admin Endpoints

### 1. Admin Login (POST /api/v1/admin/auth/login)

**Request Body:**
```json
{
  "email": "admin@callingapp.com",
  "password": "admin123"
}
```

**Response:**
```json
{
  "admin": {
    "id": "uuid",
    "email": "admin@callingapp.com",
    "first_name": "System",
    "last_name": "Admin",
    "role": "super_admin",
    "is_active": true,
    "last_login_at": "2025-11-15T12:00:00Z"
  },
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "refresh_token": "eyJhbGciOiJIUzI1NiIs..."
}
```

---

### 2. Change Admin Password (POST /api/v1/admin/auth/change-password)
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
  "old_password": "admin123",
  "new_password": "newSecurePassword123"
}
```

**Response:**
```json
{
  "message": "Password changed successfully"
}
```

---

## 📝 Notes

### Common Headers
All protected endpoints require:
```
Authorization: Bearer {your_jwt_token}
Content-Type: application/json
```

### Error Response Format
```json
{
  "error": "Error message here",
  "details": "Additional error details (optional)"
}
```

### Date Format
All dates are in ISO 8601 format: `"2025-11-15T12:00:00Z"`

### UUID Format
All IDs are UUIDs in string format: `"15ca8da7-aea2-4887-8403-aeee4e08866c"`

---

## 🔗 WebSocket Connection

**URL:** `ws://localhost:8080/api/v1/ws?room_id={room_id}&user_id={user_id}`

**Query Parameters:**
- `room_id`: UUID of the room
- `user_id`: UUID of the user (optional for guests)

**Message Format:**
The WebSocket uses JSON messages for signaling. Check the WebRTC signaling implementation for message formats.

