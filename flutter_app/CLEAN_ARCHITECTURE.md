# Clean Architecture Implementation Guide

This Flutter app follows Clean Architecture principles with Feature-first organization and flutter_bloc for state management.

## Architecture Overview

### Layers

```
lib/
├── core/                          # Shared/common code across features
│   ├── error/                     # Error handling, Failures, Exceptions
│   ├── network/                   # Network utilities, interceptors
│   ├── usecases/                  # Base UseCase class
│   ├── constants/                 # App constants, API endpoints
│   ├── utils/                     # Utility functions and extensions
│   └── widgets/                   # Reusable widgets
├── features/                      # All app features
│   ├── auth/                      # Authentication feature
│   │   ├── data/                  # Data layer
│   │   │   ├── datasources/       # Remote and local data sources
│   │   │   │   ├── auth_remote_data_source.dart
│   │   │   │   └── auth_local_data_source.dart
│   │   │   ├── models/            # DTOs and data models
│   │   │   │   └── user_model.dart
│   │   │   └── repositories/      # Repository implementations
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain/                # Domain layer
│   │   │   ├── entities/          # Business objects
│   │   │   │   └── user.dart
│   │   │   ├── repositories/      # Repository interfaces
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecases/          # Business logic use cases
│   │   │       ├── login.dart
│   │   │       ├── register.dart
│   │   │       ├── logout.dart
│   │   │       └── get_current_user.dart
│   │   └── presentation/          # Presentation layer
│   │       ├── bloc/              # Bloc/Cubit state management
│   │       │   ├── auth_bloc.dart
│   │       │   ├── auth_event.dart
│   │       │   └── auth_state.dart
│   │       ├── pages/             # Screen widgets
│   │       │   ├── sign_in_page.dart
│   │       │   ├── sign_up_page.dart
│   │       │   └── email_verification_page.dart
│   │       └── widgets/           # Feature-specific widgets
│   │           └── auth_form_field.dart
│   ├── meetings/                  # Meetings feature (same structure)
│   ├── subscription/              # Subscription feature (same structure)
│   └── profile/                   # Profile feature (same structure)
├── injection.dart                 # Dependency injection setup (GetIt)
└── main.dart                      # Entry point
```

## Dependencies

### Core Dependencies
- **flutter_bloc**: State management
- **bloc**: Core bloc library
- **freezed**: Immutable state classes
- **dartz**: Functional programming (Either for error handling)
- **equatable**: Value equality
- **get_it**: Dependency injection
- **injectable**: Code generation for DI

### Network & Storage
- **dio**: HTTP client
- **flutter_secure_storage**: Secure token storage
- **shared_preferences**: Local preferences
- **internet_connection_checker**: Network connectivity

### Code Generation
- **build_runner**: Code generation runner
- **freezed**: Generate immutable classes
- **json_serializable**: JSON serialization

## Implementation Pattern

### 1. Domain Layer (Business Logic)

#### Entity
```dart
class User extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [id, email, firstName, lastName];
}
```

#### Repository Interface
```dart
abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}
```

#### UseCase
```dart
class Login implements UseCase<User, LoginParams> {
  final AuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
```

### 2. Data Layer (Data Sources & Models)

#### Model (with JSON serialization)
```dart
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toDomain() {
    return User(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }
}
```

#### Data Source
```dart
abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.post(
        ApiConstants.authLogin,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw ServerException(response.data['message']);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
```

#### Repository Implementation
```dart
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.login(
          email: email,
          password: password,
        );
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toDomain());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on UnauthorizedException catch (e) {
        return Left(UnauthorizedFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
```

### 3. Presentation Layer (Bloc & UI)

#### State (using Freezed)
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';
import '../../../../core/error/failures.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(Failure failure) = _Error;
}
```

#### Event
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = _LoginRequested;

  const factory AuthEvent.registerRequested({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) = _RegisterRequested;

  const factory AuthEvent.logoutRequested() = _LogoutRequested;

  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
}
```

#### Bloc
```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login loginUseCase;
  final Register registerUseCase;
  final Logout logoutUseCase;
  final GetCurrentUser getCurrentUserUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
  }) : super(const AuthState.initial()) {
    on<_LoginRequested>(_onLoginRequested);
    on<_RegisterRequested>(_onRegisterRequested);
    on<_LogoutRequested>(_onLogoutRequested);
    on<_CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onLoginRequested(
    _LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await loginUseCase(LoginParams(
      email: event.email,
      password: event.password,
    ));

    result.fold(
      (failure) => emit(AuthState.error(failure)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }
}
```

#### UI Page
```dart
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign In')),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              authenticated: (user) {
                context.go('/home');
              },
              error: (failure) {
                context.showErrorSnackBar(failure.message);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => const SignInForm(),
            );
          },
        ),
      ),
    );
  }
}
```

## Dependency Injection with GetIt

### Setup
```dart
// injection.dart
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

// Manual registration example
void initDependencies() {
  // Core
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt()),
  );

  // Auth Feature
  _initAuth();
}

void _initAuth() {
  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(storage: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => Login(getIt()));
  getIt.registerLazySingleton(() => Register(getIt()));
  getIt.registerLazySingleton(() => Logout(getIt()));
  getIt.registerLazySingleton(() => GetCurrentUser(getIt()));

  // Bloc
  getIt.registerFactory(
    () => AuthBloc(
      loginUseCase: getIt(),
      registerUseCase: getIt(),
      logoutUseCase: getIt(),
      getCurrentUserUseCase: getIt(),
    ),
  );
}
```

## Code Generation

Run these commands to generate code:

```bash
# Generate Freezed classes
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Testing

### Unit Tests
```dart
void main() {
  late AuthRepository repository;
  late Login useCase;

  setUp(() {
    repository = MockAuthRepository();
    useCase = Login(repository);
  });

  test('should return User when login is successful', () async {
    // Arrange
    final user = User(id: '1', email: 'test@test.com');
    when(repository.login(email: any, password: any))
        .thenAnswer((_) async => Right(user));

    // Act
    final result = await useCase(LoginParams(
      email: 'test@test.com',
      password: 'password',
    ));

    // Assert
    expect(result, Right(user));
    verify(repository.login(
      email: 'test@test.com',
      password: 'password',
    ));
  });
}
```

### Bloc Tests
```dart
void main() {
  late AuthBloc bloc;
  late MockLogin mockLogin;

  setUp(() {
    mockLogin = MockLogin();
    bloc = AuthBloc(loginUseCase: mockLogin, ...);
  });

  blocTest<AuthBloc, AuthState>(
    'emits [loading, authenticated] when login is successful',
    build: () {
      when(mockLogin(any)).thenAnswer(
        (_) async => Right(tUser),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(AuthEvent.loginRequested(
      email: 'test@test.com',
      password: 'password',
    )),
    expect: () => [
      const AuthState.loading(),
      AuthState.authenticated(tUser),
    ],
  );
}
```

## Error Handling with Dartz

### Custom Failures
```dart
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server error']) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Network error']) : super(message);
}
```

### Using Either
```dart
// In UseCase
Future<Either<Failure, User>> call(LoginParams params) async {
  return await repository.login(
    email: params.email,
    password: params.password,
  );
}

// In Bloc
final result = await loginUseCase(params);

result.fold(
  (failure) => emit(AuthState.error(failure)),
  (user) => emit(AuthState.authenticated(user)),
);
```

## Best Practices

1. **Single Responsibility**: Each class should have one reason to change
2. **Dependency Inversion**: Depend on abstractions, not concretions
3. **Immutability**: Use const constructors and freezed
4. **Separation of Concerns**: Clear boundaries between layers
5. **Testability**: Write unit tests for domain and data layers
6. **Error Handling**: Always handle errors properly with Either
7. **Code Generation**: Use freezed and json_serializable
8. **Dependency Injection**: Use GetIt for all dependencies

## Features Structure

Apply the same pattern for all features:
- **auth**: Authentication and user management
- **meetings**: Meeting creation, joining, and management
- **subscription**: Plans, billing, and payments
- **profile**: User profile and settings
- **call**: Video calling with WebRTC

Each feature is self-contained and follows the same Clean Architecture pattern.
