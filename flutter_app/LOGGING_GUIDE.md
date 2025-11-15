# Flutter App Logging Guide

## Overview

Comprehensive logging has been added to the entire Flutter application to help debug every function call, API request, BLoC event, and error.

## Features

### 1. **App Logger Utility** (`lib/core/utils/app_logger.dart`)

A powerful logging utility with multiple specialized logging methods:

- **Debug logging**: `AppLogger.d('Debug message')`
- **Info logging**: `AppLogger.i('Info message')`
- **Warning logging**: `AppLogger.w('Warning message')`
- **Error logging**: `AppLogger.e('Error message', error: error, stackTrace: stackTrace)`

### 2. **Specialized Logging Methods**

#### API Logging
```dart
// Automatically logs:
// - Request method, URL, and data
// - Response status code and data
// - Errors with stack traces

AppLogger.apiRequest('POST', '/auth/login', data: {'email': 'user@example.com'});
AppLogger.apiResponse('POST', '/auth/login', 200, data: response);
AppLogger.apiError('POST', '/auth/login', error);
```

#### BLoC Logging
```dart
AppLogger.blocEvent('AuthBloc', LoginEvent());
AppLogger.blocState('AuthBloc', AuthenticatedState());
```

#### Use Case Logging
```dart
AppLogger.useCase('LoginUseCase', params: {'email': 'user@example.com'});
```

#### Repository Logging
```dart
AppLogger.repository('AuthRepository', 'login', params: {'email': 'user@example.com'});
```

#### Data Source Logging
```dart
AppLogger.dataSource('AuthRemoteDataSource', 'login', params: {'email': 'user@example.com'});
```

#### Navigation Logging
```dart
AppLogger.navigation('/login', '/home');
```

### 3. **Automatic Logging**

The following are logged automatically throughout the app:

#### **Dio Interceptors**
- ✅ All HTTP requests (method, URL, body)
- ✅ All HTTP responses (status code, data)
- ✅ All HTTP errors (with stack traces)
- ✅ Auth token injection
- ✅ 401 unauthorized handling

**Location**: `lib/core/di/injection.dart` (lines 95-151)

#### **BLoC Observer**
- ✅ BLoC creation and disposal
- ✅ All events fired
- ✅ All state changes/transitions
- ✅ All errors in BLoCs

**Location**: `lib/core/observers/app_bloc_observer.dart`

#### **App Initialization**
- ✅ BLoC observer setup
- ✅ Hive initialization
- ✅ Dependency injection
- ✅ Initialization errors

**Location**: `lib/main.dart`

### 4. **Security Features**

**Automatic Masking** of sensitive data in logs:
- ✅ Passwords
- ✅ Tokens
- ✅ API keys
- ✅ Authorization headers

Example:
```dart
// Input:
{'email': 'user@example.com', 'password': 'secret123'}

// Logged as:
{'email': 'user@example.com', 'password': '***MASKED***'}
```

### 5. **Log Format**

Logs include emojis for easy visual scanning:

- 🌐 API Request
- ✅/❌ API Response (success/error)
- 🎯 BLoC Event
- 📊 BLoC State
- ⚙️ UseCase
- 💾 Repository
- 🗄️ DataSource
- 🧭 Navigation
- 🔑 Auth token operations
- 🔒 Unauthorized access
- ⚠️ Warnings
- ❌ Errors

## Usage Examples

### In Data Sources

```dart
import '../../../../core/utils/app_logger.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    AppLogger.dataSource('AuthRemoteDataSource', 'login', params: {'email': email});

    try {
      final response = await client.post(/* ... */);
      AppLogger.i('✅ Login successful for: $email');
      return response.data;
    } catch (e) {
      AppLogger.e('❌ Login error', error: e);
      rethrow;
    }
  }
}
```

### In Repositories

```dart
import '../../../core/utils/app_logger.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    AppLogger.repository('AuthRepository', 'login', params: {'email': email});

    try {
      final result = await remoteDataSource.login(/* ... */);
      AppLogger.i('✅ Login successful');
      return Right(user);
    } catch (e) {
      AppLogger.e('❌ Login failed', error: e);
      return Left(ServerFailure(message: e.message));
    }
  }
}
```

### In Use Cases

```dart
import '../../../core/utils/app_logger.dart';

class Login {
  Future<Either<Failure, User>> call(LoginParams params) async {
    AppLogger.useCase('Login', params: {
      'email': params.email,
    });

    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}
```

### Using Extension Methods

```dart
class MyClass {
  void doSomething() {
    logInfo('Doing something');  // [MyClass] Doing something

    try {
      // ... code
    } catch (e, stackTrace) {
      logError('Failed to do something', error: e, stackTrace: stackTrace);
    }
  }
}
```

## Log Output Examples

### Application Startup

```
[I] 🚀 Application Starting...
[I] ✅ BLoC Observer configured
[I] ✅ Hive initialized
[I] ✅ Hive adapters registered
[I] ✅ Dependency injection configured
[I] 🎉 Application initialized successfully
```

### Login Flow

```
[I] 🎯 [AuthBloc] Event: LoginEvent(email: user@example.com, password: ***)
[I] ⚙️ UseCase: Login
   Params: {email: user@example.com}
[I] 💾 Repository: AuthRepository.login
   Params: {email: user@example.com}
[I] 🗄️ DataSource: AuthRemoteDataSource.login
   Params: {email: user@example.com}
[I] 🌐 API Request: POST http://localhost:8080/api/v1/auth/login
[D] 📤 Request Data: {email: user@example.com, password: ***MASKED***}
[D] 🔑 Added auth token to request
[I] ✅ API Response: POST http://localhost:8080/api/v1/auth/login - Status: 200
[D] 📥 Response Data: {user: {...}, token: ...}
[I] ✅ Login successful for: user@example.com
[D] 🔄 [AuthBloc] Change: AuthInitial → Authenticated
[I] 📊 [AuthBloc] State: Authenticated(user: User(...))
```

### Registration Validation Error

```
[I] 🎯 [AuthBloc] Event: RegisterEvent(...)
[I] 🗄️ DataSource: AuthRemoteDataSource.register
[I] 🌐 API Request: POST http://localhost:8080/api/v1/auth/register
[D] 📤 Request Data: {email: test@example.com, password: ***MASKED***, first_name: Test, last_name: User}
[I] ❌ API Response: POST http://localhost:8080/api/v1/auth/register - Status: 400
[D] 📥 Response Data: {error: Validation failed, fields: {Password: Password must be at least 8 characters}}
[W] ⚠️ Registration validation failed: {Password: Password must be at least 8 characters}
[E] ❌ [AuthBloc] Error
   ServerException: Validation failed: {Password: Password must be at least 8 characters}
```

## Configuration

### Adjusting Log Levels

Edit `lib/core/utils/app_logger.dart`:

```dart
static final Logger _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,        // Number of method calls to show
    errorMethodCount: 8,   // Number of method calls for errors
    lineLength: 120,       // Width of output
    colors: true,          // Colorful logs
    printEmojis: true,     // Show emojis
    printTime: true,       // Show timestamps
  ),
);
```

### Production Mode

For production, you can disable verbose logging:

```dart
// In main.dart
void main() async {
  if (kReleaseMode) {
    // Disable debug logs in production
    Logger.level = Level.warning;
  }
  // ...
}
```

## Viewing Logs

### Flutter DevTools
1. Run your app in debug mode
2. Open DevTools
3. Navigate to the "Logging" tab
4. Filter by log level or search for specific messages

### IDE Console
- **VS Code**: View logs in the Debug Console
- **Android Studio**: View logs in the Run tab
- **IntelliJ IDEA**: View logs in the Run tool window

### Command Line
```bash
flutter run -v  # Verbose mode
flutter logs     # View device logs
```

## Troubleshooting

### Not Seeing Logs?

1. **Check log level**: Make sure `Logger.level` is set appropriately
2. **Check console filter**: Ensure IDE isn't filtering out logs
3. **Run in debug mode**: Some logs are suppressed in release mode

### Too Many Logs?

Filter by:
- **Emoji**: Search for specific emojis (🌐, ✅, ❌, etc.)
- **Component**: Search for [AuthBloc], [AuthRepository], etc.
- **Level**: Filter to show only errors or warnings

### Logs Not Formatted?

Some consoles don't support ANSI colors. Use:
```dart
static final Logger _simpleLogger = Logger(
  printer: SimplePrinter(),
);
```

## Best Practices

1. **Log at the right level**:
   - `debug`: Development debugging info
   - `info`: General information (success, state changes)
   - `warning`: Recoverable issues
   - `error`: Errors that need attention

2. **Add context**: Include relevant parameters (but mask sensitive data)

3. **Use emojis**: Makes logs easier to scan visually

4. **Log errors with stack traces**: Always include stack traces for errors

5. **Don't over-log**: Log important events, not every line of code

## What's Logged Automatically

✅ **All HTTP requests and responses** via Dio interceptors
✅ **All BLoC events and state changes** via BlocObserver
✅ **App initialization steps** in main.dart
✅ **Authentication operations** in AuthRemoteDataSource
✅ **Validation errors** from backend
✅ **Auth token operations** (addition, removal)
✅ **Unauthorized access attempts** (401 errors)

## Next Steps

To add logging to other features:

1. Import the logger: `import '../../../core/utils/app_logger.dart';`
2. Add logging to data sources (see AuthRemoteDataSource as example)
3. Add logging to repositories (see AuthRepository as example)
4. Add logging to use cases (see Login as example)
5. BLoCs are already logged automatically via BlocObserver

---

**Happy Debugging! 🐛**
