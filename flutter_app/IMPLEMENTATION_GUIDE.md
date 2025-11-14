# Complete Cross-Platform Implementation Guide

## Project Structure Complete Reference

```
lib/
├── core/                                   # ✅ IMPLEMENTED
│   ├── error/
│   │   ├── failures.dart                  # All failure types
│   │   └── exceptions.dart                # All exception types
│   ├── usecases/
│   │   └── usecase.dart                   # Base UseCase<Type, Params>
│   ├── network/
│   │   └── network_info.dart              # Network connectivity checker
│   ├── constants/
│   │   ├── api_constants.dart             # All API endpoints
│   │   └── app_constants.dart             # App configuration
│   ├── utils/
│   │   └── extensions.dart                # Helpful extensions
│   └── widgets/                            # Shared widgets
│       ├── app_button.dart
│       ├── app_text_field.dart
│       ├── loading_indicator.dart
│       └── error_view.dart
│
├── features/
│   ├── auth/                               # ✅ COMPLETE REFERENCE IMPLEMENTATION
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── auth_remote_data_source.dart    # ✅ DONE
│   │   │   │   └── auth_local_data_source.dart     # ✅ DONE
│   │   │   ├── models/
│   │   │   │   └── user_model.dart                 # ✅ DONE (with JSON)
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart       # ✅ DONE
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user.dart                       # ✅ DONE
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart            # ✅ DONE
│   │   │   └── usecases/
│   │   │       ├── login.dart                      # ✅ DONE
│   │   │       ├── register.dart                   # ✅ DONE
│   │   │       ├── logout.dart                     # ✅ DONE
│   │   │       └── get_current_user.dart           # ✅ DONE
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── auth_bloc.dart                  # ✅ DONE
│   │       │   ├── auth_event.dart                 # ✅ DONE (Freezed)
│   │       │   └── auth_state.dart                 # ✅ DONE (Freezed)
│   │       ├── pages/
│   │       │   ├── onboarding_page.dart            # TODO
│   │       │   ├── sign_in_page.dart               # TODO
│   │       │   ├── sign_up_page.dart               # TODO
│   │       │   ├── email_verification_page.dart    # TODO
│   │       │   └── forgot_password_page.dart       # TODO
│   │       └── widgets/
│   │           ├── auth_text_field.dart            # TODO
│   │           └── auth_button.dart                # TODO
│   │
│   ├── shell/                               # Main navigation container
│   │   ├── presentation/
│   │   │   ├── cubit/
│   │   │   │   ├── shell_cubit.dart
│   │   │   │   └── shell_state.dart
│   │   │   ├── pages/
│   │   │   │   └── main_shell_page.dart
│   │   │   └── widgets/
│   │   │       ├── mobile_bottom_nav.dart
│   │   │       ├── desktop_sidebar.dart
│   │   │       └── tablet_navigation_rail.dart
│   │
│   ├── home/                                # Dashboard
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── home_remote_data_source.dart
│   │   │   ├── models/
│   │   │   │   └── dashboard_stats_model.dart
│   │   │   └── repositories/
│   │   │       └── home_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── dashboard_stats.dart
│   │   │   │   └── usage_summary.dart
│   │   │   ├── repositories/
│   │   │   │   └── home_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_dashboard_stats.dart
│   │   │       └── get_usage_summary.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── home_bloc.dart
│   │       │   ├── home_event.dart
│   │       │   └── home_state.dart
│   │       ├── pages/
│   │       │   └── home_dashboard_page.dart
│   │       └── widgets/
│   │           ├── quick_actions_section.dart
│   │           ├── upcoming_meetings_section.dart
│   │           ├── plan_status_card.dart
│   │           └── usage_stats_card.dart
│   │
│   ├── meetings/                            # Meeting management
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── meetings_remote_data_source.dart
│   │   │   │   └── meetings_local_data_source.dart
│   │   │   ├── models/
│   │   │   │   ├── meeting_model.dart
│   │   │   │   └── participant_model.dart
│   │   │   └── repositories/
│   │   │       └── meetings_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── meeting.dart
│   │   │   │   └── participant.dart
│   │   │   ├── repositories/
│   │   │   │   └── meetings_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_upcoming_meetings.dart
│   │   │       ├── get_past_meetings.dart
│   │   │       ├── create_meeting.dart
│   │   │       ├── update_meeting.dart
│   │   │       ├── delete_meeting.dart
│   │   │       └── join_meeting_by_code.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── meetings_bloc.dart
│   │       │   ├── meetings_event.dart
│   │       │   └── meetings_state.dart
│   │       ├── pages/
│   │       │   ├── meetings_list_page.dart
│   │       │   ├── schedule_meeting_page.dart
│   │       │   ├── edit_meeting_page.dart
│   │       │   ├── meeting_details_page.dart
│   │       │   ├── join_by_code_page.dart
│   │       │   └── waiting_room_page.dart
│   │       └── widgets/
│   │           ├── meeting_card.dart
│   │           ├── meeting_form.dart
│   │           ├── meeting_filters.dart
│   │           └── copy_meeting_link_button.dart
│   │
│   ├── subscriptions/                       # Plans & billing
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── subscription_remote_data_source.dart
│   │   │   ├── models/
│   │   │   │   ├── subscription_model.dart
│   │   │   │   ├── plan_model.dart
│   │   │   │   └── invoice_model.dart
│   │   │   └── repositories/
│   │   │       └── subscription_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── subscription.dart
│   │   │   │   ├── plan.dart
│   │   │   │   └── invoice.dart
│   │   │   ├── repositories/
│   │   │   │   └── subscription_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_plans.dart
│   │   │       ├── get_my_subscription.dart
│   │   │       ├── create_checkout_session.dart
│   │   │       ├── cancel_subscription.dart
│   │   │       └── get_billing_history.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── subscription_bloc.dart
│   │       │   ├── subscription_event.dart
│   │       │   └── subscription_state.dart
│   │       ├── pages/
│   │       │   ├── plans_pricing_page.dart
│   │       │   └── billing_history_page.dart
│   │       └── widgets/
│   │           ├── plan_card.dart
│   │           ├── billing_cycle_toggle.dart
│   │           ├── subscription_status_banner.dart
│   │           └── invoice_row.dart
│   │
│   ├── call/                                # Video calling
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── call_remote_data_source.dart
│   │   │   │   └── webrtc_data_source.dart
│   │   │   ├── models/
│   │   │   │   └── call_participant_model.dart
│   │   │   └── repositories/
│   │   │       └── call_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── call_room.dart
│   │   │   │   └── call_participant.dart
│   │   │   ├── repositories/
│   │   │   │   └── call_repository.dart
│   │   │   └── usecases/
│   │   │       ├── join_call.dart
│   │   │       ├── leave_call.dart
│   │   │       ├── toggle_audio.dart
│   │   │       ├── toggle_video.dart
│   │   │       ├── start_screen_share.dart
│   │   │       └── start_recording.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── call_bloc.dart
│   │       │   ├── call_event.dart
│   │       │   └── call_state.dart
│   │       ├── pages/
│   │       │   └── call_page.dart
│   │       └── widgets/
│   │           ├── video_grid.dart
│   │           ├── participant_tile.dart
│   │           ├── call_controls.dart
│   │           ├── participant_list_panel.dart
│   │           ├── in_call_chat_panel.dart
│   │           ├── device_settings_bottom_sheet.dart
│   │           └── end_call_summary_sheet.dart
│   │
│   ├── profile/                             # User profile
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── profile_remote_data_source.dart
│   │   │   ├── models/
│   │   │   │   └── profile_model.dart
│   │   │   └── repositories/
│   │   │       └── profile_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── repositories/
│   │   │   │   └── profile_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_profile.dart
│   │   │       ├── update_profile.dart
│   │   │       └── change_password.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── profile_bloc.dart
│   │       │   ├── profile_event.dart
│   │       │   └── profile_state.dart
│   │       └── pages/
│   │           └── profile_page.dart
│   │
│   ├── settings/                            # App settings
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── settings_local_data_source.dart
│   │   │   ├── models/
│   │   │   │   └── app_settings_model.dart
│   │   │   └── repositories/
│   │   │       └── settings_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── app_settings.dart
│   │   │   ├── repositories/
│   │   │   │   └── settings_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_settings.dart
│   │   │       └── update_settings.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── settings_cubit.dart
│   │       │   └── settings_state.dart
│   │       └── pages/
│   │           ├── app_settings_page.dart
│   │           └── media_settings_page.dart
│   │
│   └── support/                             # Help & support
│       └── presentation/
│           └── pages/
│               ├── help_center_page.dart
│               └── contact_support_page.dart
│
├── injection.dart                           # GetIt DI setup
└── main.dart                                # App entry point
```

## Auth Feature - Complete Implementation Reference

### Domain Layer (Business Logic)

#### Entity
```dart
// user.dart
class User extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isActive;
  final bool isVerified;
  final String planType;
  final DateTime createdAt;

  const User({...});

  String get fullName => '$firstName $lastName';
  bool get isPro => planType == 'pro';

  @override
  List<Object?> get props => [id, email, ...];
}
```

#### Repository Interface
```dart
// auth_repository.dart
abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> register({...});
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, void>> logout();
  Future<bool> isLoggedIn();
}
```

#### Use Cases
```dart
// login.dart
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

### Data Layer

#### Model (✅ IMPLEMENTED)
```dart
@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'email')
  final String email;

  // ... other fields

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toDomain() {
    return User(
      id: id,
      email: email,
      // ...
    );
  }
}
```

#### Remote Data Source (✅ IMPLEMENTED)
Handles all API calls with Dio, throws exceptions.

#### Local Data Source (✅ IMPLEMENTED)
Handles caching with FlutterSecureStorage.

#### Repository Implementation (✅ IMPLEMENTED)
Coordinates remote/local sources, handles network connectivity, maps exceptions to failures.

### Presentation Layer

#### Bloc with Freezed (✅ IMPLEMENTED)

**Events:**
```dart
@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = _SignInRequested;

  const factory AuthEvent.registerRequested({...}) = _RegisterRequested;
  const factory AuthEvent.signOutRequested() = _SignOutRequested;
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
}
```

**States:**
```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.emailNotVerified(User user) = _EmailNotVerified;
  const factory AuthState.error(Failure failure) = _Error;
}
```

**Bloc:**
```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login loginUseCase;
  // ... other use cases

  AuthBloc({required this.loginUseCase, ...})
      : super(const AuthState.initial()) {
    on<_SignInRequested>(_onSignInRequested);
    // ... other handlers
  }

  Future<void> _onSignInRequested(
    _SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await loginUseCase(LoginParams(
      email: event.email,
      password: event.password,
    ));

    result.fold(
      (failure) => emit(AuthState.error(failure)),
      (user) {
        if (user.isVerified) {
          emit(AuthState.authenticated(user));
        } else {
          emit(AuthState.emailNotVerified(user));
        }
      },
    );
  }
}
```

#### Pages (TODO - Example Template)

**Sign In Page:**
```dart
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              authenticated: (user) {
                // Navigate to home
                context.go('/home');
              },
              emailNotVerified: (user) {
                // Navigate to verification
                context.go('/auth/verify-email');
              },
              error: (failure) {
                // Show error
                context.showErrorSnackBar(failure.message);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => const SignInForm(),
            );
          },
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthEvent.signInRequested(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _handleSignIn,
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
```

## Dependency Injection Setup

```dart
// injection.dart
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      baseURL: ApiConstants.apiBaseUrl,
      connectTimeout: AppConstants.connectTimeout,
      receiveTimeout: AppConstants.apiTimeout,
    ));

    // Add token interceptor
    dio.interceptors.add(AuthInterceptor(getIt()));

    return dio;
  });

  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt()),
  );

  // Auth Feature
  _initAuth();

  // Other features...
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
      repository: getIt(),
    ),
  );
}
```

## Main.dart Setup

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'injection.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>()
        ..add(const AuthEvent.checkAuthStatus()),
      child: MaterialApp.router(
        title: 'Calling App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routerConfig: router,
      ),
    );
  }
}

// Router setup with go_router
final router = GoRouter(
  initialLocation: '/auth/onboarding',
  redirect: (context, state) {
    final authState = context.read<AuthBloc>().state;

    return authState.maybeWhen(
      authenticated: (_) => '/home',
      emailNotVerified: (_) => '/auth/verify-email',
      unauthenticated: () => '/auth/onboarding',
      orElse: () => null,
    );
  },
  routes: [
    GoRoute(
      path: '/auth/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/auth/sign-in',
      builder: (context, state) => const SignInPage(),
    ),
    // ... other routes
  ],
);
```

## Code Generation Commands

```bash
# Generate all code (Freezed + JSON Serialization)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (regenerates on file changes)
flutter pub run build_runner watch --delete-conflicting-outputs

# Clean generated files
flutter pub run build_runner clean
```

## Platform Adaptations

### Responsive Layouts

```dart
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200 && desktop != null) {
          return desktop!;
        } else if (constraints.maxWidth >= 768 && tablet != null) {
          return tablet!;
        }
        return mobile;
      },
    );
  }
}
```

### Usage Example

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileHomeLayout(),
      tablet: TabletHomeLayout(),
      desktop: DesktopHomeLayout(),
    );
  }
}
```

## Next Steps

1. ✅ **Auth Feature Complete** - Reference implementation done
2. **Generate Code**: Run build_runner to generate Freezed/JSON code
3. **Implement Auth Pages**: Create all UI pages following the pattern
4. **Repeat Pattern**: Apply same structure to other features
5. **Add Navigation**: Complete go_router setup
6. **Platform Testing**: Test on Android, iOS, Web, Desktop

## Testing Example

```dart
// auth_bloc_test.dart
void main() {
  late AuthBloc bloc;
  late MockLogin mockLogin;
  late MockGetCurrentUser mockGetCurrentUser;

  setUp(() {
    mockLogin = MockLogin();
    mockGetCurrentUser = MockGetCurrentUser();
    bloc = AuthBloc(
      loginUseCase: mockLogin,
      getCurrentUserUseCase: mockGetCurrentUser,
      // ...
    );
  });

  blocTest<AuthBloc, AuthState>(
    'emits [loading, authenticated] when sign in succeeds',
    build: () {
      when(mockLogin(any)).thenAnswer(
        (_) async => Right(tUser),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const AuthEvent.signInRequested(
      email: 'test@test.com',
      password: 'password123',
    )),
    expect: () => [
      const AuthState.loading(),
      AuthState.authenticated(tUser),
    ],
  );
}
```

## Summary

- ✅ **Core Layer**: Complete with failures, exceptions, usecases, network, constants
- ✅ **Auth Feature Domain**: Complete
- ✅ **Auth Feature Data**: Complete with models, datasources, repository
- ✅ **Auth Feature Presentation**: Complete with Bloc/Events/States
- 🔄 **UI Pages**: Template provided, ready to implement
- 📝 **Other Features**: Structure defined, ready to implement following auth pattern

**The foundation is solid. Apply the auth feature pattern to all other features.**
