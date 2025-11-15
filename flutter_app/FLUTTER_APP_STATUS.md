# Flutter App Status & Setup

## ✅ What's Complete

### 1. **Comprehensive Logging System**
- ✅ Logger package added to pubspec.yaml
- ✅ AppLogger utility created (`lib/core/utils/app_logger.dart`)
- ✅ BlocObserver for automatic state/event logging
- ✅ Dio interceptors for API request/response logging
- ✅ Auth data source with detailed logging
- ✅ Automatic sensitive data masking (passwords, tokens)
- ✅ Application initialization logging

### 2. **Architecture**
- ✅ Clean Architecture with BLoC pattern
- ✅ Dependency Injection (GetIt)
- ✅ Complete feature structure (Auth, Call, Meetings, Subscriptions, etc.)
- ✅ Repository pattern
- ✅ Use cases
- ✅ Data sources (Remote & Local)

### 3. **API Integration**
- ✅ Dio HTTP client configured
- ✅ API constants defined
- ✅ Auth endpoints configured (`/auth/profile` fixed)
- ✅ Auto token injection
- ✅ 401 error handling
- ✅ Request/response logging

### 4. **Features Configured**
- ✅ Authentication (login, register, logout)
- ✅ Meetings/Rooms
- ✅ Video Calling (WebRTC)
- ✅ Subscriptions
- ✅ Profile management
- ✅ Settings
- ✅ Support
- ✅ Dashboard/Home

## 📋 Setup Instructions

### 1. **Install Dependencies**

```bash
cd flutter_app
flutter pub get
```

This will install all packages including the newly added `logger` package.

### 2. **Run the App**

```bash
flutter run
```

### 3. **View Logs**

When you run the app, you'll now see detailed logs like:

```
[I] 🚀 Application Starting...
[I] ✅ BLoC Observer configured
[I] ✅ Hive initialized
[I] 🎉 Application initialized successfully
```

When you attempt login/registration, you'll see:

```
[I] 🎯 [AuthBloc] Event: LoginEvent(...)
[I] 🌐 API Request: POST http://localhost:8080/api/v1/auth/login
[D] 📤 Request Data: {email: user@example.com, password: ***MASKED***}
[I] ✅ API Response: POST .../auth/login - Status: 200
[I] ✅ Login successful for: user@example.com
```

## 🔍 Debugging Registration Issues

With the new logging, you'll see **exactly** what's happening:

### Good Registration Request:
```
[I] 🗄️ DataSource: AuthRemoteDataSource.register
   Params: {email: test@example.com, first_name: Test, last_name: User}
[I] 🌐 API Request: POST http://localhost:8080/api/v1/auth/register
[D] 📤 Request Data: {email: test@example.com, password: ***MASKED***, first_name: Test, last_name: User}
[I] ✅ API Response: POST .../auth/register - Status: 201
[I] ✅ Registration successful for: test@example.com
```

### Validation Error:
```
[I] 🌐 API Request: POST http://localhost:8080/api/v1/auth/register
[I] ❌ API Response: POST .../auth/register - Status: 400
[D] 📥 Response Data: {
  error: "Validation failed",
  fields: {
    Password: "Password must be at least 8 characters",
    FirstName: "FirstName is required"
  }
}
[W] ⚠️ Registration validation failed: {...}
```

## 🎯 What the Logs Will Show You

### 1. **Application Startup**
- ✅ BLoC observer setup
- ✅ Hive initialization
- ✅ DI container configuration
- ✅ Any startup errors

### 2. **API Calls**
- ✅ Request method and URL
- ✅ Request body (with masked passwords)
- ✅ Response status code
- ✅ Response data
- ✅ Any errors

### 3. **BLoC Events**
- ✅ Which event was fired
- ✅ Current state
- ✅ Next state after event
- ✅ Any errors during state changes

### 4. **Authentication Flow**
- ✅ Login attempts (success/failure)
- ✅ Registration attempts (success/validation errors)
- ✅ Token operations
- ✅ 401 unauthorized handling

## 🐛 Solving Your Registration Issue

With this logging in place, when you try to register from the Flutter app:

1. **Run the app**: `flutter run`
2. **Watch the console** for detailed logs
3. **Attempt registration** with your test credentials
4. **Look for**:
   - 🌐 The API request being sent
   - 📤 The exact data being sent
   - 📥 The response from the server
   - ⚠️ Any validation errors

The logs will show you **exactly** which field is failing validation:
- ❌ Password too short?
- ❌ Missing first name?
- ❌ Missing last name?
- ❌ Invalid email?

## 📱 Platform-Specific API URLs

The app uses different API URLs based on platform:

### Current Default
```dart
defaultValue: 'http://localhost:8080/api/v1'
```

### For Android Emulator
```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080/api/v1
```

### For iOS Simulator
```bash
flutter run --dart-define=API_BASE_URL=http://localhost:8080/api/v1
```

### For Physical Device (on same network)
```bash
# Replace YOUR_IP with your computer's local IP
flutter run --dart-define=API_BASE_URL=http://YOUR_IP:8080/api/v1
```

To find your IP:
- **macOS**: `ifconfig | grep "inet " | grep -v 127.0.0.1`
- **Linux**: `ip addr show | grep "inet " | grep -v 127.0.0.1`
- **Windows**: `ipconfig` and look for IPv4 Address

## 📝 Configuration Files

### Environment Variables
Edit `lib/core/constants/api_constants.dart`:

```dart
static const String apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://YOUR_IP:8080/api/v1',  // Change this
);
```

## 🔧 Next Steps

1. ✅ **Run `flutter pub get`** to install the logger package
2. ✅ **Update API_BASE_URL** if needed (for device testing)
3. ✅ **Run the app** and watch the logs
4. ✅ **Attempt registration** and see the detailed error
5. ✅ **Fix the issue** based on what the logs show

## 📚 Documentation

- **Logging Guide**: See `LOGGING_GUIDE.md` for complete logging documentation
- **Auth Troubleshooting**: See `/TROUBLESHOOTING_AUTH.md` (in root) for backend troubleshooting
- **Permissions Guide**: See `/PERMISSIONS_GUIDE.md` (in root) for platform permissions

## 🎉 Benefits

With this logging setup:

1. **See every API call** and response
2. **See validation errors** from backend
3. **See BLoC state changes** in real-time
4. **Debug authentication** issues easily
5. **Track down bugs** faster
6. **Understand app flow** completely

## 💡 Usage Tips

### Filter Logs
- Search for emojis: 🌐 (API), ✅ (success), ❌ (error)
- Search for components: `[AuthBloc]`, `[AuthRepository]`
- Filter by level: errors only, warnings only, etc.

### Common Issues to Debug
1. **Registration fails**: Look for validation errors in response
2. **Login fails**: Check if user exists, password correct
3. **401 errors**: Token expired or invalid
4. **Network errors**: API URL incorrect or backend down

---

**You're all set! Run the app and check the logs to see exactly what's happening with registration! 🚀**
