# 🎛️ Admin Dashboard - Complete Guide

A comprehensive admin dashboard backend for managing your video calling SaaS platform.

## 🎉 What's Been Built

You now have a **complete, production-ready admin dashboard backend** with full control over:

- ✅ **User Management** - View, activate/deactivate, reset passwords
- ✅ **Subscription Management** - Upgrade, extend, cancel subscriptions
- ✅ **Meeting/Room Management** - Monitor and control active meetings
- ✅ **Analytics & KPIs** - Dashboard stats, revenue charts, signup trends
- ✅ **Payment Tracking** - View all transactions and payment history
- ✅ **System Settings** - Configure platform-wide settings
- ✅ **Audit Logging** - Track all admin actions for security
- ✅ **Role-Based Access** - Admin and Super Admin roles

---

## 🚀 Quick Start

### 1. Start the Backend

```bash
cd backend
docker-compose up -d
```

The system will automatically:
- Run database migrations
- Create admin tables
- Seed a default admin account

### 2. Default Admin Login

After startup, use these credentials:

```
Email: admin@callingapp.com
Password: admin123
```

**⚠️ CRITICAL**: Change this password immediately after first login!

### 3. Login to Get Token

```bash
curl -X POST http://localhost:8080/api/v1/admin/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@callingapp.com",
    "password": "admin123"
  }'
```

You'll receive:
```json
{
  "admin": {
    "id": "uuid",
    "email": "admin@callingapp.com",
    "role": "super_admin"
  },
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "refresh_token": "..."
}
```

### 4. Use the Token

All subsequent requests need the token:
```bash
curl http://localhost:8080/api/v1/admin/analytics/dashboard \
  -H "Authorization: Bearer YOUR_TOKEN"
```

---

## 📊 Dashboard Features

### 1. Main Dashboard (KPIs)

**Endpoint**: `GET /api/v1/admin/analytics/dashboard`

Get real-time statistics:
- Total users & active users
- Total revenue & monthly revenue
- Active meetings count
- Email verification rate
- Users by plan (Free/Pro/Business)

**Example Response**:
```json
{
  "total_users": 1500,
  "active_users": 1200,
  "total_revenue": 75000.00,
  "monthly_revenue": 7500.00,
  "active_meetings": 5,
  "free_users": 1000,
  "pro_users": 400,
  "business_users": 100
}
```

### 2. User Management

**List All Users**: `GET /api/v1/admin/users`

Features:
- Pagination (page, page_size)
- Search by email/name
- Filter by plan type
- Filter by active status

**View User Details**: `GET /api/v1/admin/users/:id`

Get complete user info:
- Profile details
- Subscription status
- Recent meetings
- Payment history

**Admin Actions**:
- Activate user: `POST /api/v1/admin/users/:id/activate`
- Deactivate user: `POST /api/v1/admin/users/:id/deactivate`
- Reset password: `POST /api/v1/admin/users/:id/reset-password`

### 3. Subscription Management

**List Subscriptions**: `GET /api/v1/admin/subscriptions`

Filter by:
- Status (active, canceled, past_due)
- Plan type (free, pro, business)
- Pagination

**Admin Actions**:
- **Upgrade Plan**: `POST /api/v1/admin/subscriptions/upgrade/:user_id`
  ```json
  {
    "plan_type": "business"
  }
  ```

- **Extend Period**: `POST /api/v1/admin/subscriptions/:id/extend`
  ```json
  {
    "days": 30
  }
  ```

- **Cancel**: `POST /api/v1/admin/subscriptions/:id/cancel`

### 4. Meeting/Room Management

**List All Rooms**: `GET /api/v1/admin/rooms`

Filter by:
- Status (active, ended, waiting)
- Pagination

View:
- Host information
- Participant count
- Meeting duration
- Start/end times

**Force End Room**: `POST /api/v1/admin/rooms/:id/end`

Emergency action to terminate any meeting.

### 5. Analytics & Charts

**Revenue Chart**: `GET /api/v1/admin/analytics/revenue?days=30`

Returns daily revenue for the specified period.

**Signup Chart**: `GET /api/v1/admin/analytics/signups?days=30`

Returns daily new user signups.

Perfect for creating charts in your frontend dashboard.

### 6. Payment Tracking

**List Payments**: `GET /api/v1/admin/payments`

Features:
- Filter by user ID
- Filter by status (succeeded, failed, refunded)
- View Stripe payment IDs
- See invoice details
- Track refunds

### 7. System Settings

**Get Settings**: `GET /api/v1/admin/settings`

**Update Setting**: `PUT /api/v1/admin/settings`
```json
{
  "key": "maintenance_mode",
  "value": "true"
}
```

Manage platform-wide configuration.

### 8. Audit Logs

**View Logs**: `GET /api/v1/admin/audit-logs`

Track all admin actions:
- Who performed the action
- What endpoint was called
- IP address
- User agent
- Timestamp

Essential for security and compliance.

---

## 🔐 Security Features

### Role-Based Access Control (RBAC)

**Two Roles**:

1. **Admin** (`admin`)
   - Access to all management features
   - Cannot create new admins

2. **Super Admin** (`super_admin`)
   - Full access
   - Can create new admins

### Admin Middleware

All admin routes are protected by:
- JWT authentication
- Role verification
- Active status check

### Audit Logging

Every admin action is automatically logged with:
- Admin ID
- Action performed
- IP address
- Timestamp
- User agent

### Password Security

- Bcrypt password hashing
- Minimum 8 character requirement
- Change password functionality

---

## 🎨 Building a Frontend Dashboard

### Recommended Stack

**React/Next.js Dashboard**:
```bash
npx create-next-app admin-dashboard
cd admin-dashboard
npm install axios recharts
```

### Example: Login Component

```jsx
// components/Login.jsx
import { useState } from 'react';
import axios from 'axios';

const AdminLogin = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post(
        'http://localhost:8080/api/v1/admin/auth/login',
        { email, password }
      );

      // Store token
      localStorage.setItem('admin_token', response.data.token);
      localStorage.setItem('admin_data', JSON.stringify(response.data.admin));

      // Redirect to dashboard
      window.location.href = '/dashboard';
    } catch (error) {
      alert('Login failed: ' + error.response?.data?.error);
    }
  };

  return (
    <form onSubmit={handleLogin}>
      <input
        type="email"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        placeholder="Admin Email"
      />
      <input
        type="password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        placeholder="Password"
      />
      <button type="submit">Login</button>
    </form>
  );
};
```

### Example: Dashboard Stats

```jsx
// pages/dashboard.jsx
import { useEffect, useState } from 'react';
import axios from 'axios';

const Dashboard = () => {
  const [stats, setStats] = useState(null);
  const token = localStorage.getItem('admin_token');

  useEffect(() => {
    axios.get('http://localhost:8080/api/v1/admin/analytics/dashboard', {
      headers: { 'Authorization': `Bearer ${token}` }
    })
    .then(res => setStats(res.data))
    .catch(err => console.error(err));
  }, []);

  if (!stats) return <div>Loading...</div>;

  return (
    <div className="dashboard">
      <h1>Admin Dashboard</h1>

      <div className="stats-grid">
        <StatCard title="Total Users" value={stats.total_users} />
        <StatCard title="Active Users" value={stats.active_users} />
        <StatCard title="Total Revenue" value={`$${stats.total_revenue.toFixed(2)}`} />
        <StatCard title="Monthly Revenue" value={`$${stats.monthly_revenue.toFixed(2)}`} />
        <StatCard title="Active Meetings" value={stats.active_meetings} />
        <StatCard title="Free Users" value={stats.free_users} />
        <StatCard title="Pro Users" value={stats.pro_users} />
        <StatCard title="Business Users" value={stats.business_users} />
      </div>
    </div>
  );
};

const StatCard = ({ title, value }) => (
  <div className="stat-card">
    <h3>{title}</h3>
    <p className="stat-value">{value}</p>
  </div>
);
```

### Example: User Management Table

```jsx
// components/UserTable.jsx
import { useEffect, useState } from 'react';
import axios from 'axios';

const UserTable = () => {
  const [users, setUsers] = useState([]);
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const token = localStorage.getItem('admin_token');

  const fetchUsers = async () => {
    try {
      const res = await axios.get(
        `http://localhost:8080/api/v1/admin/users?page=${page}&page_size=20`,
        { headers: { 'Authorization': `Bearer ${token}` }}
      );
      setUsers(res.data.users);
      setTotalPages(res.data.total_pages);
    } catch (error) {
      console.error('Failed to fetch users:', error);
    }
  };

  useEffect(() => {
    fetchUsers();
  }, [page]);

  const handleDeactivate = async (userId) => {
    if (!confirm('Deactivate this user?')) return;

    try {
      await axios.post(
        `http://localhost:8080/api/v1/admin/users/${userId}/deactivate`,
        {},
        { headers: { 'Authorization': `Bearer ${token}` }}
      );
      fetchUsers(); // Refresh list
    } catch (error) {
      alert('Failed to deactivate user');
    }
  };

  return (
    <div>
      <h2>Users</h2>
      <table>
        <thead>
          <tr>
            <th>Email</th>
            <th>Name</th>
            <th>Plan</th>
            <th>Status</th>
            <th>Created</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {users.map(user => (
            <tr key={user.id}>
              <td>{user.email}</td>
              <td>{user.first_name} {user.last_name}</td>
              <td>{user.subscription?.plan?.name || 'Free'}</td>
              <td>{user.is_active ? 'Active' : 'Inactive'}</td>
              <td>{new Date(user.created_at).toLocaleDateString()}</td>
              <td>
                {user.is_active ? (
                  <button onClick={() => handleDeactivate(user.id)}>
                    Deactivate
                  </button>
                ) : (
                  <button onClick={() => handleActivate(user.id)}>
                    Activate
                  </button>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      <div className="pagination">
        <button
          disabled={page === 1}
          onClick={() => setPage(p => p - 1)}
        >
          Previous
        </button>
        <span>Page {page} of {totalPages}</span>
        <button
          disabled={page === totalPages}
          onClick={() => setPage(p => p + 1)}
        >
          Next
        </button>
      </div>
    </div>
  );
};
```

### Example: Revenue Chart

```jsx
// components/RevenueChart.jsx
import { useEffect, useState } from 'react';
import axios from 'axios';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from 'recharts';

const RevenueChart = () => {
  const [data, setData] = useState([]);
  const token = localStorage.getItem('admin_token');

  useEffect(() => {
    axios.get(
      'http://localhost:8080/api/v1/admin/analytics/revenue?days=30',
      { headers: { 'Authorization': `Bearer ${token}` }}
    )
    .then(res => setData(res.data))
    .catch(err => console.error(err));
  }, []);

  return (
    <div>
      <h3>Revenue (Last 30 Days)</h3>
      <LineChart width={600} height={300} data={data}>
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis dataKey="date" />
        <YAxis />
        <Tooltip />
        <Legend />
        <Line type="monotone" dataKey="amount" stroke="#8884d8" />
      </LineChart>
    </div>
  );
};
```

---

## 🔧 Common Admin Tasks

### Change Default Password

```bash
curl -X POST http://localhost:8080/api/v1/admin/auth/change-password \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "old_password": "admin123",
    "new_password": "NewSecurePassword123!"
  }'
```

### Create a New Admin

```bash
curl -X POST http://localhost:8080/api/v1/admin/admins \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "newadmin@example.com",
    "password": "SecurePassword123",
    "first_name": "Jane",
    "last_name": "Smith",
    "role": "admin"
  }'
```

### Manually Upgrade a User

```bash
curl -X POST http://localhost:8080/api/v1/admin/subscriptions/upgrade/USER_ID \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "plan_type": "pro"
  }'
```

### Force End a Meeting

```bash
curl -X POST http://localhost:8080/api/v1/admin/rooms/ROOM_ID/end \
  -H "Authorization: Bearer YOUR_TOKEN"
```

---

## 📚 Complete API Documentation

See [`backend/ADMIN_API.md`](backend/ADMIN_API.md) for:
- Complete endpoint reference
- Request/response examples
- Authentication details
- Error codes
- Code examples

---

## 🎯 Recommended Dashboard Pages

### Essential Pages to Build:

1. **Dashboard** (`/dashboard`)
   - KPI cards
   - Revenue chart
   - Signup chart
   - Recent activity

2. **Users** (`/users`)
   - User table with pagination
   - Search and filters
   - Quick actions (activate/deactivate)

3. **Subscriptions** (`/subscriptions`)
   - Subscription list
   - Filter by plan/status
   - Upgrade/extend actions

4. **Meetings** (`/meetings`)
   - Active meetings list
   - Meeting history
   - Force end capability

5. **Payments** (`/payments`)
   - Transaction list
   - Revenue tracking
   - Refund management

6. **Settings** (`/settings`)
   - System configuration
   - Admin profile
   - Security settings

7. **Audit Logs** (`/audit`)
   - Activity log
   - Filter by admin/action
   - Export capability

---

## 🔒 Security Best Practices

### For Production:

1. **Change Default Password Immediately**
2. **Use HTTPS Only** (never HTTP in production)
3. **Enable CORS Properly** (whitelist specific domains)
4. **Regular Security Audits** (review audit logs)
5. **Strong Password Policy** (enforce complexity)
6. **Session Timeout** (JWT expiry)
7. **Rate Limiting** (prevent brute force)
8. **Regular Backups** (database and audit logs)

### Environment Variables:

```env
# Production settings
ENV=production
JWT_SECRET=very-strong-random-secret-key-min-32-chars
CORS_ALLOWED_ORIGINS=https://admin.yourdomain.com
```

---

## 🚀 Deployment Checklist

- [ ] Change default admin password
- [ ] Update JWT secret to strong value
- [ ] Configure CORS for production domain
- [ ] Enable HTTPS/SSL
- [ ] Set up database backups
- [ ] Configure monitoring/alerting
- [ ] Review and test all endpoints
- [ ] Set up rate limiting
- [ ] Configure firewall rules
- [ ] Document admin procedures

---

## 📊 Sample Dashboard Screenshots (What to Build)

Your frontend should include:

1. **Login Page**: Clean, professional admin login
2. **Dashboard**: KPIs, charts, recent activity
3. **User Management**: Searchable table, filters, actions
4. **Subscription Management**: Plan overview, upgrade flows
5. **Analytics**: Revenue charts, user growth, engagement
6. **Audit Trail**: Searchable logs, export capability

---

## 🎉 You're All Set!

You now have a **complete admin dashboard backend** ready for production use.

### Next Steps:

1. ✅ Change the default admin password
2. ✅ Build your admin dashboard frontend (React/Next.js recommended)
3. ✅ Configure production environment variables
4. ✅ Deploy to your server
5. ✅ Start managing your platform!

---

**Need Help?**
- API Docs: [`backend/ADMIN_API.md`](backend/ADMIN_API.md)
- Backend Docs: [`backend/README.md`](backend/README.md)
- Quick Start: [`QUICKSTART.md`](QUICKSTART.md)

**Happy managing! 🎛️**
