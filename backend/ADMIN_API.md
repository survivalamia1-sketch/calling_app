# Admin Dashboard API Documentation

Complete API reference for the Admin Dashboard to manage the video calling SaaS platform.

## 🔐 Authentication

### Default Admin Credentials
After initial setup, a default admin account is created:
- **Email**: `admin@callingapp.com`
- **Password**: `admin123`

**⚠️ IMPORTANT**: Change the password immediately after first login!

### Admin Login

**Endpoint**: `POST /api/v1/admin/auth/login`

**Request Body**:
```json
{
  "email": "admin@callingapp.com",
  "password": "admin123"
}
```

**Response**:
```json
{
  "admin": {
    "id": "uuid",
    "email": "admin@callingapp.com",
    "first_name": "System",
    "last_name": "Admin",
    "role": "super_admin",
    "is_active": true,
    "created_at": "2024-01-01T00:00:00Z"
  },
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "refresh_token": "eyJhbGciOiJIUzI1NiIs..."
}
```

### Get Admin Profile

**Endpoint**: `GET /api/v1/admin/auth/profile`
**Auth**: Required (Bearer token)

**Response**:
```json
{
  "id": "uuid",
  "email": "admin@callingapp.com",
  "first_name": "System",
  "last_name": "Admin",
  "role": "super_admin",
  "is_active": true,
  "last_login_at": "2024-01-01T00:00:00Z",
  "created_at": "2024-01-01T00:00:00Z"
}
```

### Change Admin Password

**Endpoint**: `POST /api/v1/admin/auth/change-password`
**Auth**: Required

**Request Body**:
```json
{
  "old_password": "admin123",
  "new_password": "newSecurePassword123"
}
```

**Response**:
```json
{
  "message": "Password changed successfully"
}
```

---

## 👥 User Management

### Get All Users

**Endpoint**: `GET /api/v1/admin/users`
**Auth**: Required

**Query Parameters**:
- `search` (string, optional): Search by email, first name, or last name
- `plan` (string, optional): Filter by subscription plan (free, pro, business)
- `is_active` (boolean, optional): Filter by active status
- `page` (int, optional, default: 1): Page number
- `page_size` (int, optional, default: 20): Results per page (max: 100)

**Example**:
```
GET /api/v1/admin/users?search=john&page=1&page_size=20
```

**Response**:
```json
{
  "users": [
    {
      "id": "uuid",
      "email": "user@example.com",
      "first_name": "John",
      "last_name": "Doe",
      "email_verified": true,
      "is_active": true,
      "last_login_at": "2024-01-01T00:00:00Z",
      "created_at": "2024-01-01T00:00:00Z",
      "subscription": {
        "plan": {
          "type": "pro",
          "name": "Pro"
        },
        "status": "active"
      }
    }
  ],
  "total": 150,
  "page": 1,
  "page_size": 20,
  "total_pages": 8
}
```

### Get User Details

**Endpoint**: `GET /api/v1/admin/users/:id`
**Auth**: Required

**Response**:
```json
{
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "first_name": "John",
    "last_name": "Doe",
    "subscription": {
      "plan": {
        "type": "pro",
        "name": "Pro"
      },
      "status": "active",
      "current_period_end": "2024-02-01T00:00:00Z"
    }
  },
  "rooms": [
    {
      "id": "uuid",
      "name": "Team Meeting",
      "status": "ended",
      "started_at": "2024-01-01T10:00:00Z",
      "ended_at": "2024-01-01T11:00:00Z"
    }
  ],
  "payments": [
    {
      "id": "uuid",
      "amount": 1500,
      "currency": "usd",
      "status": "succeeded",
      "created_at": "2024-01-01T00:00:00Z"
    }
  ]
}
```

### Activate User

**Endpoint**: `POST /api/v1/admin/users/:id/activate`
**Auth**: Required

**Response**:
```json
{
  "message": "User activated successfully"
}
```

### Deactivate User

**Endpoint**: `POST /api/v1/admin/users/:id/deactivate`
**Auth**: Required

**Response**:
```json
{
  "message": "User deactivated successfully"
}
```

### Reset User Password

**Endpoint**: `POST /api/v1/admin/users/:id/reset-password`
**Auth**: Required

**Request Body**:
```json
{
  "new_password": "temporaryPassword123"
}
```

**Response**:
```json
{
  "message": "Password reset successfully"
}
```

---

## 💳 Subscription Management

### Get All Subscriptions

**Endpoint**: `GET /api/v1/admin/subscriptions`
**Auth**: Required

**Query Parameters**:
- `status` (string, optional): Filter by status (active, canceled, past_due, trialing)
- `plan_type` (string, optional): Filter by plan type (free, pro, business)
- `page` (int, optional, default: 1)
- `page_size` (int, optional, default: 20)

**Response**:
```json
{
  "subscriptions": [
    {
      "id": "uuid",
      "user_id": "uuid",
      "status": "active",
      "plan": {
        "type": "pro",
        "name": "Pro",
        "price": 1500
      },
      "stripe_subscription_id": "sub_xxxxx",
      "current_period_start": "2024-01-01T00:00:00Z",
      "current_period_end": "2024-02-01T00:00:00Z",
      "user": {
        "email": "user@example.com",
        "first_name": "John"
      }
    }
  ],
  "total": 75,
  "page": 1,
  "page_size": 20,
  "total_pages": 4
}
```

### Manually Upgrade Subscription

**Endpoint**: `POST /api/v1/admin/subscriptions/upgrade/:user_id`
**Auth**: Required

**Request Body**:
```json
{
  "plan_type": "business"
}
```

**Response**:
```json
{
  "message": "Subscription upgraded successfully"
}
```

### Extend Subscription

**Endpoint**: `POST /api/v1/admin/subscriptions/:id/extend`
**Auth**: Required

**Request Body**:
```json
{
  "days": 30
}
```

**Response**:
```json
{
  "message": "Subscription extended successfully"
}
```

### Cancel Subscription

**Endpoint**: `POST /api/v1/admin/subscriptions/:id/cancel`
**Auth**: Required

**Response**:
```json
{
  "message": "Subscription canceled successfully"
}
```

---

## 🎥 Room/Meeting Management

### Get All Rooms

**Endpoint**: `GET /api/v1/admin/rooms`
**Auth**: Required

**Query Parameters**:
- `status` (string, optional): Filter by status (active, ended, waiting, scheduled)
- `page` (int, optional, default: 1)
- `page_size` (int, optional, default: 20)

**Response**:
```json
{
  "rooms": [
    {
      "id": "uuid",
      "name": "Team Meeting",
      "status": "active",
      "host": {
        "email": "user@example.com",
        "first_name": "John"
      },
      "max_participants": 10,
      "started_at": "2024-01-01T10:00:00Z",
      "participants": [
        {
          "name": "John Doe",
          "joined_at": "2024-01-01T10:00:00Z"
        }
      ]
    }
  ],
  "total": 250,
  "page": 1,
  "page_size": 20,
  "total_pages": 13
}
```

### Force End Room

**Endpoint**: `POST /api/v1/admin/rooms/:id/end`
**Auth**: Required

**Response**:
```json
{
  "message": "Room ended successfully"
}
```

---

## 📊 Analytics & Dashboard

### Get Dashboard Statistics

**Endpoint**: `GET /api/v1/admin/analytics/dashboard`
**Auth**: Required

**Response**:
```json
{
  "total_users": 1500,
  "active_users": 1200,
  "total_subscriptions": 1500,
  "active_subscriptions": 500,
  "total_revenue": 75000.00,
  "monthly_revenue": 7500.00,
  "active_meetings": 5,
  "total_meetings": 2500,
  "email_verified_users": 1400,
  "free_users": 1000,
  "pro_users": 400,
  "business_users": 100
}
```

### Get Revenue Chart

**Endpoint**: `GET /api/v1/admin/analytics/revenue`
**Auth**: Required

**Query Parameters**:
- `days` (int, optional, default: 30): Number of days to show (max: 365)

**Example**:
```
GET /api/v1/admin/analytics/revenue?days=30
```

**Response**:
```json
[
  {
    "date": "2024-01-01",
    "amount": 1500.00
  },
  {
    "date": "2024-01-02",
    "amount": 3000.00
  }
]
```

### Get Signups Chart

**Endpoint**: `GET /api/v1/admin/analytics/signups`
**Auth**: Required

**Query Parameters**:
- `days` (int, optional, default: 30)

**Response**:
```json
[
  {
    "date": "2024-01-01",
    "count": 25
  },
  {
    "date": "2024-01-02",
    "count": 30
  }
]
```

---

## 💰 Payment Management

### Get All Payments

**Endpoint**: `GET /api/v1/admin/payments`
**Auth**: Required

**Query Parameters**:
- `user_id` (string, optional): Filter by user ID
- `status` (string, optional): Filter by status (succeeded, failed, refunded, pending)
- `page` (int, optional, default: 1)
- `page_size` (int, optional, default: 20)

**Response**:
```json
{
  "payments": [
    {
      "id": "uuid",
      "user_id": "uuid",
      "stripe_payment_id": "pi_xxxxx",
      "stripe_invoice_id": "in_xxxxx",
      "amount": 1500,
      "currency": "usd",
      "status": "succeeded",
      "description": "Pro Plan - Monthly",
      "paid_at": "2024-01-01T00:00:00Z",
      "user": {
        "email": "user@example.com"
      }
    }
  ],
  "total": 500,
  "page": 1,
  "page_size": 20,
  "total_pages": 25
}
```

---

## ⚙️ System Settings

### Get System Settings

**Endpoint**: `GET /api/v1/admin/settings`
**Auth**: Required

**Response**:
```json
[
  {
    "key": "maintenance_mode",
    "value": "false",
    "description": "Enable/disable maintenance mode",
    "category": "system",
    "is_public": false
  },
  {
    "key": "max_meeting_duration",
    "value": "240",
    "description": "Maximum meeting duration in minutes",
    "category": "meetings",
    "is_public": true
  }
]
```

### Update System Setting

**Endpoint**: `PUT /api/v1/admin/settings`
**Auth**: Required

**Request Body**:
```json
{
  "key": "maintenance_mode",
  "value": "true"
}
```

**Response**:
```json
{
  "message": "Setting updated successfully"
}
```

---

## 📝 Audit Logs

### Get Audit Logs

**Endpoint**: `GET /api/v1/admin/audit-logs`
**Auth**: Required

**Query Parameters**:
- `page` (int, optional, default: 1)
- `page_size` (int, optional, default: 50, max: 100)

**Response**:
```json
{
  "logs": [
    {
      "id": "uuid",
      "admin_id": "uuid",
      "action": "POST /api/v1/admin/users/uuid/deactivate",
      "entity_type": "user",
      "entity_id": "uuid",
      "ip_address": "192.168.1.1",
      "user_agent": "Mozilla/5.0...",
      "created_at": "2024-01-01T10:00:00Z",
      "admin": {
        "email": "admin@callingapp.com",
        "first_name": "System"
      }
    }
  ],
  "total": 150,
  "page": 1,
  "page_size": 50
}
```

---

## 👤 Admin Management (Super Admin Only)

### Create New Admin

**Endpoint**: `POST /api/v1/admin/admins`
**Auth**: Required (Super Admin only)

**Request Body**:
```json
{
  "email": "newadmin@example.com",
  "password": "securePassword123",
  "first_name": "Jane",
  "last_name": "Smith",
  "role": "admin"
}
```

**Response**:
```json
{
  "id": "uuid",
  "email": "newadmin@example.com",
  "first_name": "Jane",
  "last_name": "Smith",
  "role": "admin",
  "is_active": true,
  "created_at": "2024-01-01T00:00:00Z"
}
```

---

## 🔑 Authorization

All admin endpoints (except login) require a valid JWT token in the Authorization header:

```
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...
```

### Admin Roles

1. **Admin** (`admin`): Can access all endpoints except admin creation
2. **Super Admin** (`super_admin`): Full access including creating new admins

---

## 📊 Common Response Codes

| Code | Meaning |
|------|---------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request (invalid input) |
| 401 | Unauthorized (invalid/missing token) |
| 403 | Forbidden (insufficient permissions) |
| 404 | Not Found |
| 500 | Internal Server Error |

---

## 🔒 Security Features

1. **Audit Logging**: All admin actions are logged with IP address and user agent
2. **Role-Based Access Control**: Different permission levels for admins
3. **JWT Authentication**: Secure token-based authentication
4. **Password Hashing**: bcrypt password encryption

---

## 🚀 Example: Building a Dashboard

### Step 1: Admin Login
```bash
curl -X POST http://localhost:8080/api/v1/admin/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@callingapp.com",
    "password": "admin123"
  }'
```

### Step 2: Get Dashboard Stats
```bash
curl http://localhost:8080/api/v1/admin/analytics/dashboard \
  -H "Authorization: Bearer YOUR_TOKEN"
```

### Step 3: Get All Users
```bash
curl "http://localhost:8080/api/v1/admin/users?page=1&page_size=20" \
  -H "Authorization: Bearer YOUR_TOKEN"
```

### Step 4: Deactivate a User
```bash
curl -X POST http://localhost:8080/api/v1/admin/users/USER_ID/deactivate \
  -H "Authorization: Bearer YOUR_TOKEN"
```

---

## 📈 Frontend Integration Example

```javascript
// React/Next.js example
const AdminDashboard = () => {
  const [stats, setStats] = useState(null);
  const token = localStorage.getItem('admin_token');

  useEffect(() => {
    fetch('http://localhost:8080/api/v1/admin/analytics/dashboard', {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    })
    .then(res => res.json())
    .then(data => setStats(data));
  }, []);

  return (
    <div>
      <h1>Dashboard</h1>
      <div className="stats">
        <StatCard title="Total Users" value={stats?.total_users} />
        <StatCard title="Revenue" value={`$${stats?.total_revenue}`} />
        <StatCard title="Active Meetings" value={stats?.active_meetings} />
      </div>
    </div>
  );
};
```

---

## 🎯 Next Steps

1. **Change Default Password**: Immediately after first login
2. **Create Additional Admins**: If needed for team management
3. **Monitor Audit Logs**: Regularly review admin actions
4. **Configure System Settings**: Adjust platform settings as needed
5. **Build Frontend Dashboard**: Use these APIs to build your admin UI

---

**Need Help?** Check the main API documentation in `backend/README.md`

**Security Note**: Never expose these admin endpoints publicly without proper security measures!
