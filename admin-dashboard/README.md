# Admin Dashboard - Video Calling Platform

Modern, responsive admin dashboard built with Next.js 14, TypeScript, and TailwindCSS for managing the video calling SaaS platform.

## Features

- **Authentication & Security**
  - Admin login with JWT authentication
  - Role-based access control (Admin & Super Admin)
  - Automatic token management
  - Session handling with auto-redirect on 401

- **Dashboard Overview**
  - Real-time KPI metrics (users, revenue, active meetings, signups)
  - Interactive revenue and signup charts (30-day view)
  - Quick statistics overview

- **User Management**
  - View all platform users with pagination
  - Search by email or name
  - Activate/deactivate user accounts
  - Reset user passwords
  - View user details (plan, status, join date)

- **Subscription Management**
  - View all subscriptions with filters
  - Manually upgrade/downgrade plans
  - Extend subscription periods
  - Cancel subscriptions
  - Filter by status and plan type

- **Payment Tracking**
  - View all payment transactions
  - Search by user or payment ID
  - Filter by payment status
  - View refunded amounts
  - Total revenue calculation

- **Rooms & Meetings**
  - Monitor active meetings in real-time
  - View participant counts
  - Force end meetings
  - Auto-refresh for active rooms
  - Recording status indicator

- **System Settings**
  - Configure system-wide settings
  - Change admin password
  - Security best practices

- **Audit Logs**
  - Complete admin action tracking
  - Filter by action type and resource
  - IP address and user agent logging
  - Immutable security records

## Tech Stack

- **Framework**: Next.js 14 (App Router)
- **Language**: TypeScript
- **Styling**: TailwindCSS
- **HTTP Client**: Axios with interceptors
- **Charts**: Recharts
- **Icons**: Lucide React

## Prerequisites

- Node.js 18+ and npm/yarn
- Go backend API running (see `/backend` directory)
- PostgreSQL database configured

## Installation

1. **Navigate to the admin dashboard directory:**
   ```bash
   cd admin-dashboard
   ```

2. **Install dependencies:**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Configure environment variables:**
   ```bash
   cp .env.example .env.local
   ```

   Edit `.env.local`:
   ```env
   NEXT_PUBLIC_API_URL=http://localhost:8080/api/v1
   ```

4. **Start the development server:**
   ```bash
   npm run dev
   # or
   yarn dev
   ```

   The dashboard will be available at `http://localhost:3001`

## Default Admin Credentials

For initial setup, use these credentials:
- **Email**: `admin@callingapp.com`
- **Password**: `admin123`

**⚠️ Important**: Change the default password immediately after first login!

## Project Structure

```
admin-dashboard/
├── src/
│   ├── app/                    # Next.js app router
│   │   ├── dashboard/          # Dashboard pages
│   │   │   ├── page.tsx        # Main dashboard with KPIs
│   │   │   ├── users/          # User management
│   │   │   ├── subscriptions/  # Subscription management
│   │   │   ├── payments/       # Payment tracking
│   │   │   ├── rooms/          # Meeting management
│   │   │   ├── settings/       # System settings
│   │   │   └── audit-logs/     # Audit log viewer
│   │   ├── login/              # Login page
│   │   ├── layout.tsx          # Root layout
│   │   └── page.tsx            # Root redirect
│   ├── components/             # React components
│   │   ├── Sidebar.tsx         # Navigation sidebar
│   │   └── DashboardLayout.tsx # Dashboard layout wrapper
│   └── lib/                    # Utilities and services
│       ├── api.ts              # API client and endpoints
│       ├── auth.ts             # Authentication utilities
│       └── utils.ts            # Helper functions
├── public/                     # Static assets
├── .env.example                # Environment variables template
├── package.json                # Dependencies
├── tsconfig.json               # TypeScript configuration
└── tailwind.config.ts          # TailwindCSS configuration
```

## API Integration

The dashboard communicates with the Go backend API. All API calls are centralized in `src/lib/api.ts`:

- **Auth API**: Login, profile, password change
- **Users API**: CRUD operations, activate/deactivate
- **Subscriptions API**: View, upgrade, extend, cancel
- **Payments API**: View transactions
- **Rooms API**: View meetings, force end
- **Analytics API**: Dashboard stats, charts
- **Settings API**: System configuration
- **Audit Logs API**: View admin actions

## Authentication Flow

1. User enters credentials on login page
2. API validates and returns JWT token + admin data
3. Token stored in localStorage
4. Axios interceptor adds token to all requests
5. On 401 response, user is redirected to login

## Development

### Running in Development Mode

```bash
npm run dev
```

The app runs on port 3001 by default (configurable in `package.json`).

### Building for Production

```bash
npm run build
npm start
```

### Linting

```bash
npm run lint
```

## Features by Page

### Dashboard (`/dashboard`)
- Total users (active vs inactive)
- Monthly and total revenue
- Active meetings count
- New signups (today and this week)
- Revenue chart (30 days)
- Signups chart (30 days)

### Users (`/dashboard/users`)
- Paginated user list
- Search functionality
- Activate/deactivate accounts
- Reset passwords
- View user details
- Plan type badges
- Verification status

### Subscriptions (`/dashboard/subscriptions`)
- Filter by status and plan
- Manual plan upgrades
- Period extensions
- Subscription cancellation
- Cancel-at-period-end indicator

### Payments (`/dashboard/payments`)
- Transaction history
- Payment status tracking
- Refund information
- Search by user or payment ID
- Total amount summary

### Rooms (`/dashboard/rooms`)
- Active meeting monitoring
- Participant count with progress bar
- Recording status
- Force end capability
- Auto-refresh every 10 seconds

### Settings (`/dashboard/settings`)
- System setting management
- Password change
- Security tips

### Audit Logs (`/dashboard/audit-logs`)
- Complete action history
- Filter by action and resource
- IP and user agent tracking
- Immutable records

## Responsive Design

The dashboard is fully responsive:
- **Mobile**: Stacked layouts, touch-friendly
- **Tablet**: Optimized grid layouts
- **Desktop**: Full multi-column layouts

## Security Features

- JWT-based authentication
- Automatic token refresh
- Role-based access control
- Audit logging for all actions
- Password strength requirements
- Secure password change flow

## Customization

### Changing Colors

Edit `tailwind.config.ts` to customize the primary color palette:

```typescript
colors: {
  primary: {
    // Your custom colors
  }
}
```

### Adding New Pages

1. Create page component in `src/app/dashboard/[page-name]/page.tsx`
2. Add route to sidebar in `src/components/Sidebar.tsx`
3. Add API endpoints in `src/lib/api.ts` if needed

## Troubleshooting

### API Connection Issues

- Ensure the Go backend is running
- Check `NEXT_PUBLIC_API_URL` in `.env.local`
- Verify CORS settings in backend

### Authentication Issues

- Clear localStorage and login again
- Check token expiration
- Verify admin credentials in database

### Build Errors

- Clear `.next` folder: `rm -rf .next`
- Delete `node_modules` and reinstall
- Check TypeScript errors: `npm run type-check`

## Performance

- Server-side rendering with Next.js
- Automatic code splitting
- Lazy loading of components
- Optimized bundle size
- Chart data caching

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Contributing

When adding new features:
1. Follow existing code structure
2. Use TypeScript for type safety
3. Add proper error handling
4. Update this README if needed

## License

This project is part of the video calling SaaS platform.

## Support

For backend API documentation, see `backend/ADMIN_API.md`.
For deployment guides, see `ADMIN_DASHBOARD.md` in the root directory.
