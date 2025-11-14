# Calling App - Flutter Client

Complete Flutter application for the video calling SaaS platform with subscriptions, meeting management, and WebRTC integration.

## Features

### 🔐 Authentication
- **Sign In / Sign Up**: Secure email and password authentication
- **Email Verification**: Required email verification flow
- **Password Reset**: Forgot password functionality
- **JWT Token Management**: Automatic token refresh and secure storage

### 🏠 Home Dashboard
- **Quick Actions**: Start meeting, schedule, join with code
- **Upcoming Meetings**: View next 5 scheduled meetings
- **Plan Status**: Current subscription plan display
- **User Greeting**: Personalized welcome message

### 📅 Meeting Management
- **Create Meetings**: Instant or scheduled meetings
- **Join with Code**: Simple meeting code entry
- **Meeting List**: Upcoming and past meetings with tabs
- **Meeting Options**:
  - Password protection
  - Max participants control
  - Scheduled date/time selection
- **Meeting Actions**: Join, copy code, delete

### 💎 Subscription & Billing
- **Plans**: Free, Pro, Business tiers
- **Billing Cycles**: Monthly or yearly options
- **Feature Comparison**: Clear feature lists for each plan
- **Stripe Integration**: Secure payment processing
- **Plan Management**: Upgrade, downgrade, cancel

### 📞 Video Calling
- **WebRTC Integration**: Real-time video and audio
- **Local Video**: Camera preview and control
- **Remote Participants**: Grid layout for multiple users
- **Call Controls**:
  - Mute/unmute microphone
  - Enable/disable video
  - Screen sharing
  - End call
- **Call Timer**: Duration tracking

### 👤 Profile & Settings
- **Profile Management**: Update name and avatar
- **Password Change**: Secure password update
- **Account Info**: Plan, status, member since
- **Meeting Preferences**: Auto-mute, camera defaults
- **Notifications**: Email notification settings

### 🆘 Help & Support
- **FAQ**: Common questions and answers
- **Contact Support**: Email support access

## Tech Stack

- **Framework**: Flutter 3.0+
- **State Management**: Provider
- **Navigation**: go_router
- **HTTP Client**: http, dio
- **WebRTC**: flutter_webrtc
- **Payments**: flutter_stripe
- **Local Storage**: flutter_secure_storage, shared_preferences
- **UI Components**: Material Design 3

## Project Structure

```
lib/
├── config/
│   ├── app_config.dart         # App configuration
│   └── theme.dart              # Theme configuration
├── models/
│   ├── user.dart               # User model
│   ├── subscription.dart       # Subscription & plan models
│   └── meeting.dart            # Meeting & participant models
├── providers/
│   ├── auth_provider.dart      # Authentication state
│   ├── subscription_provider.dart  # Subscription state
│   ├── meeting_provider.dart   # Meeting state
│   └── call_provider.dart      # Call state with WebRTC
├── services/
│   ├── api_service.dart        # REST API client
│   └── auth_service.dart       # Token management
├── routes/
│   └── app_router.dart         # Navigation configuration
├── screens/
│   ├── onboarding/
│   │   └── welcome_screen.dart
│   ├── auth/
│   │   ├── sign_in_screen.dart
│   │   ├── sign_up_screen.dart
│   │   ├── email_verification_screen.dart
│   │   └── forgot_password_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── meetings/
│   │   ├── meetings_list_screen.dart
│   │   ├── create_meeting_screen.dart
│   │   └── join_meeting_screen.dart
│   ├── call/
│   │   └── call_screen.dart
│   ├── subscription/
│   │   ├── plans_screen.dart
│   │   └── billing_screen.dart
│   ├── profile/
│   │   ├── profile_screen.dart
│   │   └── settings_screen.dart
│   └── support/
│       └── help_screen.dart
├── widgets/
│   └── loading_button.dart     # Reusable widgets
└── main.dart                   # App entry point
```

## Prerequisites

- Flutter SDK 3.0 or higher
- Dart SDK 3.0 or higher
- Go backend running (see `/backend` directory)
- Stripe account for payments

## Installation

1. **Clone the repository:**
   ```bash
   cd flutter_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure environment:**
   ```bash
   cp .env.example .env
   ```

   Edit `.env`:
   ```env
   API_BASE_URL=http://your-api-url/api/v1
   WS_URL=ws://your-api-url/ws
   STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## Building

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Configuration

### API Configuration
Update `lib/config/app_config.dart` with your backend URL:
```dart
static const String apiBaseUrl = 'https://your-api.com/api/v1';
static const String wsUrl = 'wss://your-api.com/ws';
```

### Stripe Configuration
Set your Stripe publishable key in `lib/main.dart`:
```dart
Stripe.publishableKey = 'your_stripe_publishable_key';
```

### Theme Customization
Modify `lib/config/theme.dart` to customize colors and styles:
```dart
static const Color primaryColor = Color(0xFF0284C7);
```

## Features by Screen

### Welcome Screen (`/welcome`)
- App logo and tagline
- Feature highlights
- Sign In / Create Account buttons

### Sign In Screen (`/auth/sign-in`)
- Email and password fields
- Remember me checkbox
- Forgot password link
- Create account link

### Sign Up Screen (`/auth/sign-up`)
- Name fields (first, last)
- Email and password
- Password confirmation
- Terms acceptance
- Email verification redirect

### Home Screen (`/home`)
- User greeting
- Current plan card
- Quick action buttons
- Upcoming meetings list
- Pull to refresh

### Create Meeting Screen (`/meetings/create`)
- Meeting title input
- Instant or scheduled toggle
- Date/time picker
- Max participants slider
- Password protection
- Meeting code generation
- Share options

### Join Meeting Screen (`/meetings/join`)
- Meeting code input
- Password field (if required)
- QR code scanner option
- Error handling

### Meetings List Screen (`/meetings`)
- Tabs: Upcoming / Past
- Meeting cards with details
- Join, copy code, delete actions
- Empty state with CTA
- Pull to refresh

### Call Screen (`/call/:meetingId`)
- Local video preview
- Remote participant grid
- Call timer
- Control buttons:
  - Mute/Unmute
  - Video On/Off
  - Screen Share
  - End Call
- Participant list (planned)
- Chat panel (planned)

### Plans Screen (`/subscription/plans`)
- Monthly/Yearly toggle
- Plan comparison cards
- Feature lists
- Current plan indicator
- Stripe checkout integration

### Profile Screen (`/profile`)
- Avatar display
- Name editing
- Email (read-only)
- Change password dialog
- Account information
- Logout button

### Settings Screen (`/settings`)
- Meeting preferences
- Notification settings
- App version

### Help Screen (`/help`)
- FAQ accordion
- Contact support

## State Management

The app uses Provider for state management with these providers:

- **AuthProvider**: User authentication and profile
- **SubscriptionProvider**: Plans and billing
- **MeetingProvider**: Meeting CRUD operations
- **CallProvider**: WebRTC state and controls

## API Integration

All API calls are centralized in `lib/services/api_service.dart`:

```dart
final apiService = ApiService();

// Authentication
await apiService.login(email, password);
await apiService.register(email, password, firstName, lastName);

// Meetings
await apiService.createMeeting(name: 'My Meeting');
await apiService.getMyMeetings(status: 'upcoming');

// Subscriptions
await apiService.getPlans();
await apiService.createCheckoutSession('pro', 'monthly');
```

## WebRTC Integration

WebRTC functionality is handled by `CallProvider`:

```dart
final callProvider = Provider.of<CallProvider>(context);

// Initialize
await callProvider.initializeLocalRenderer();
await callProvider.startLocalStream();

// Controls
callProvider.toggleMute();
callProvider.toggleVideo();
callProvider.toggleScreenShare();

// Cleanup
await callProvider.endCall();
```

## Error Handling

Errors are displayed using:
- SnackBar for temporary messages
- AlertDialog for critical errors
- Loading states for async operations
- Empty states for no data

## Testing

```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widget_test.dart

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## Permissions

### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
```

### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSCameraUsageDescription</key>
<string>Camera access required for video calls</string>
<key>NSMicrophoneUsageDescription</key>
<string>Microphone access required for audio calls</string>
```

## Deep Linking

The app supports deep links for joining meetings:

```
callingapp://join/MEETING_CODE
```

## Known Issues

- QR code scanning not yet implemented
- WebSocket signaling needs backend integration
- Recording feature UI placeholder
- Participant list in call screen planned

## Next Steps

1. **Complete WebRTC Integration**:
   - Connect to WebSocket signaling server
   - Handle peer connections
   - Implement room synchronization

2. **Enhanced Features**:
   - QR code generation and scanning
   - In-call chat
   - Participant management
   - Recording start/stop

3. **Performance Optimizations**:
   - Image caching
   - API response caching
   - Offline support

4. **Testing**:
   - Unit tests for providers
   - Widget tests for screens
   - Integration tests for flows

## Contributing

When adding new features:
1. Follow existing code structure
2. Use Provider for state management
3. Add proper error handling
4. Update this README

## Support

For backend API documentation, see `/backend/README.md`.
For admin dashboard, see `/admin-dashboard/README.md`.

## License

This project is part of the video calling SaaS platform.
