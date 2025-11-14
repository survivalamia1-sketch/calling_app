# Flutter Video Calling App - Clean Architecture

A cross-platform video calling application built with Flutter, following Clean Architecture principles and feature-first organization.

## 🏗️ Architecture

This project follows **Clean Architecture** with a **Feature-first** organization pattern:

```
lib/
├── core/
│   ├── constants/      # API endpoints, app constants
│   ├── di/             # Dependency injection (GetIt)
│   ├── error/          # Failures and exceptions
│   ├── network/        # Network connectivity checker
│   ├── router/         # Go Router configuration
│   ├── usecases/       # Base UseCase class
│   └── utils/          # Extensions and utilities
│
└── features/
    ├── auth/           # ✅ Authentication (COMPLETE)
    ├── home/           # ✅ Dashboard (COMPLETE)
    ├── meetings/       # ✅ Meetings Management (COMPLETE)
    ├── shell/          # ✅ Navigation Shell (COMPLETE)
    ├── call/           # ⏳ Video Calling (TODO)
    ├── subscriptions/  # ⏳ Subscription Plans (TODO)
    ├── profile/        # ⏳ User Profile (TODO)
    ├── settings/       # ⏳ App Settings (TODO)
    └── support/        # ⏳ Help & Support (TODO)
```

Each feature follows the Clean Architecture layers:
- **Domain**: Entities, Repository Interfaces, Use Cases
- **Data**: Models, Data Sources, Repository Implementations
- **Presentation**: Blocs, Pages, Widgets

## ✅ Implemented Features

### 1. Auth Feature (Complete)
**Domain Layer:**
- `User` entity with business logic
- `AuthRepository` interface
- Use cases: `Login`, `Register`, `Logout`, `GetCurrentUser`

**Data Layer:**
- `UserModel` with JSON serialization
- `AuthRemoteDataSource` - API integration with Dio
- `AuthLocalDataSource` - Secure token/user caching with FlutterSecureStorage
- `AuthRepositoryImpl` - Repository implementation with error handling

**Presentation Layer:**
- `AuthBloc` with Freezed events and states
- Pages:
  - ✅ Onboarding (4-page intro slider)
  - ✅ Sign In (email/password authentication)
  - ✅ Sign Up (registration with validation)
  - ✅ Email Verification (resend verification email)
  - ✅ Forgot Password (password reset flow)
- Custom widgets: `CustomButton`, `CustomTextField`, `SignInForm`, `SignUpForm`

### 2. Home Feature (Complete)
**Presentation Layer:**
- `HomeDashboardPage` with responsive layout
- Statistics cards (Total Meetings, Upcoming, Hours, Participants)
- Quick action cards (Start Meeting, Schedule, Join, Share Screen)
- Upcoming meetings list with mock data
- Adaptive UI for mobile, tablet, and desktop

### 3. Meetings Feature (Complete)
**Domain Layer:**
- `Meeting` entity with status logic (scheduled, ongoing, completed)
- `MeetingsRepository` interface
- Use cases: `GetMeetings`, `CreateMeeting`, `JoinMeeting`

**Data Layer:**
- `MeetingModel` with JSON serialization
- `MeetingsRemoteDataSource` - Complete CRUD operations
- `MeetingsRepositoryImpl` with error handling

**Presentation Layer:**
- `MeetingsBloc` with Freezed events and states
- `MeetingsListPage` with pull-to-refresh
- `MeetingCard` widget with status indicators and responsive design

### 4. Shell Feature (Complete)
**Presentation Layer:**
- `MainShellPage` - Adaptive navigation container
- Bottom navigation bar for mobile (width < 640px)
- Navigation rail for tablet (640px ≤ width < 1024px)
- Extended navigation rail for desktop (width ≥ 1024px)
- Integrated with go_router ShellRoute

## 🛠️ Tech Stack

### State Management & Architecture
- `flutter_bloc` (^8.1.3) - Business Logic Component pattern
- `bloc` (^8.1.2) - Core BLoC library
- `equatable` (^2.0.5) - Value equality

### Functional Programming & Error Handling
- `dartz` (^0.10.1) - Either<Failure, Success> pattern

### Code Generation
- `freezed` (^2.4.5) - Immutable classes and union types
- `freezed_annotation` (^2.4.1)
- `json_serializable` (^6.7.1) - JSON serialization
- `json_annotation` (^4.8.1)
- `build_runner` (^2.4.7)

### Dependency Injection
- `get_it` (^7.6.4) - Service locator
- `injectable` (^2.3.2) - Code generation for DI

### Networking & Storage
- `dio` (^5.4.0) - HTTP client
- `flutter_secure_storage` (^9.0.0) - Secure token storage
- `internet_connection_checker` (^1.0.0+1) - Network connectivity

### Navigation
- `go_router` (^13.0.0) - Declarative routing with deep linking

### UI & Utilities
- `intl` (^0.18.1) - Internationalization and date formatting

### Testing
- `bloc_test` (^9.1.5)
- `mockito` (^5.4.4)
- `mocktail` (^1.0.2)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)

### Installation

1. **Install dependencies:**
```bash
cd flutter_app
flutter pub get
```

2. **Run code generation:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- Freezed files (`.freezed.dart`) for blocs
- JSON serialization files (`.g.dart`) for models

3. **Configure API endpoint:**

Edit `lib/core/constants/api_constants.dart` or set environment variable:
```bash
flutter run --dart-define=API_BASE_URL=http://your-backend-url:8080/api/v1
```

4. **Run the app:**
```bash
# Development
flutter run

# Web
flutter run -d chrome

# Release build
flutter build apk --release
```

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🎨 UI/UX Features

### Responsive Design
- **Mobile** (< 640px): Bottom navigation, vertical layouts
- **Tablet** (640-1024px): Navigation rail, 2-column grids
- **Desktop** (≥ 1024px): Extended navigation rail, multi-column grids

### Theme Support
- Material 3 design system
- Light and dark mode support (follows system preference)
- Consistent color scheme and typography

## 📋 Next Steps

### Priority 1: Core Features

1. **Run Code Generation** (Required before running the app)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

2. **Create Meeting Page**
   - Form to create/schedule meetings
   - Date/time picker
   - Meeting settings (max participants, approval, duration)

3. **Meeting Details Page**
   - View meeting information
   - Edit meeting (if host)
   - Copy meeting link
   - Share meeting code

4. **Join Meeting Flow**
   - Join by code dialog
   - Waiting room (if approval required)
   - Pre-call device check (camera, microphone)

### Priority 2: Video Calling

5. **Call Feature - WebRTC Integration**
   - Domain: `CallRepository`, use cases
   - Data: WebRTC service, signaling service (WebSocket)
   - Presentation: `CallBloc`, `CallPage`
   - UI: Video grid, controls, participant list, chat

6. **Call Controls**
   - Mute/unmute microphone
   - Enable/disable camera
   - Screen sharing
   - End call
   - Participant management (host)

### Priority 3: Monetization & User Management

7. **Subscriptions Feature**
   - View available plans (Free, Pro, Enterprise)
   - Upgrade/downgrade subscription
   - Billing history
   - Payment integration (Stripe/PayPal)

8. **Profile Feature**
   - View/edit user profile
   - Change password
   - Upload profile picture
   - Account settings

9. **Settings Feature**
   - App preferences (theme, language)
   - Media settings (camera, microphone selection)
   - Notifications
   - Privacy settings

### Priority 4: Support & Polish

10. **Support Feature**
    - Help center
    - FAQ
    - Contact support
    - Report issues

11. **Testing**
    - Unit tests for use cases
    - Widget tests for pages
    - Bloc tests for all blocs
    - Integration tests

12. **Performance Optimization**
    - Lazy loading for lists
    - Image caching
    - Code splitting

## 🏛️ Architecture Patterns

### Error Handling
All repository methods return `Either<Failure, SuccessType>`:
```dart
final result = await repository.login(email: email, password: password);
result.fold(
  (failure) => emit(AuthState.error(failure)),
  (user) => emit(AuthState.authenticated(user)),
);
```

### State Management
Using BLoC pattern with Freezed:
```dart
// Events
@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = _SignInRequested;
}

// States
@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.error(Failure failure) = _Error;
}
```

### Dependency Injection
Using GetIt with manual registration:
```dart
// Register
getIt.registerLazySingleton<AuthRepository>(
  () => AuthRepositoryImpl(
    remoteDataSource: getIt(),
    localDataSource: getIt(),
    networkInfo: getIt(),
  ),
);

// Use
final authBloc = getIt<AuthBloc>();
```

## 📚 Documentation

- **[IMPLEMENTATION_GUIDE.md](./IMPLEMENTATION_GUIDE.md)** - Comprehensive guide with code examples for implementing features
- **[CLEAN_ARCHITECTURE.md](./CLEAN_ARCHITECTURE.md)** - Clean Architecture principles and patterns

## 🤝 Contributing

When adding new features, follow the established patterns:

1. Create feature folder structure (domain, data, presentation)
2. Define entities and repository interface in domain layer
3. Implement models, data sources, and repository in data layer
4. Create bloc with Freezed events/states in presentation layer
5. Build UI pages and widgets
6. Register dependencies in `lib/core/di/injection.dart`
7. Add routes in `lib/core/router/app_router.dart`
8. Run code generation
9. Write tests

## 📄 License

[Add your license here]

## 🔗 Backend Integration

This app integrates with the Go backend server. API endpoints are defined in:
- `lib/core/constants/api_constants.dart`

Make sure the backend server is running and accessible at the configured `API_BASE_URL`.

## 🐛 Known Issues

1. Code generation files (.freezed.dart, .g.dart) need to be generated after pulling the code
2. Some pages are placeholders (Subscriptions, Settings, Profile, Support, Call)
3. Mock data is used in Home dashboard (will be replaced with real API calls)

## 📞 Support

For issues and questions, please refer to the IMPLEMENTATION_GUIDE.md or create an issue in the repository.
