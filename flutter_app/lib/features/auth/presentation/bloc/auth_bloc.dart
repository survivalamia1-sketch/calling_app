import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/register.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login loginUseCase;
  final Register registerUseCase;
  final Logout logoutUseCase;
  final GetCurrentUser getCurrentUserUseCase;
  final AuthRepository repository;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
    required this.repository,
  }) : super(const AuthState.initial()) {
    on<_CheckAuthStatus>(_onCheckAuthStatus);
    on<_SignInRequested>(_onSignInRequested);
    on<_RegisterRequested>(_onRegisterRequested);
    on<_SignOutRequested>(_onSignOutRequested);
    on<_ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<_ResendVerificationRequested>(_onResendVerificationRequested);
    on<_GetCurrentUserRequested>(_onGetCurrentUserRequested);
  }

  Future<void> _onCheckAuthStatus(
    _CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final isLoggedIn = await repository.isLoggedIn();

    if (isLoggedIn) {
      emit(const AuthState.loading());
      final result = await getCurrentUserUseCase(NoParams());

      result.fold(
        (failure) => emit(const AuthState.unauthenticated()),
        (user) {
          if (user.isVerified) {
            emit(AuthState.authenticated(user));
          } else {
            emit(AuthState.emailNotVerified(user));
          }
        },
      );
    } else {
      emit(const AuthState.unauthenticated());
    }
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

  Future<void> _onRegisterRequested(
    _RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await registerUseCase(RegisterParams(
      email: event.email,
      password: event.password,
      firstName: event.firstName,
      lastName: event.lastName,
    ));

    result.fold(
      (failure) => emit(AuthState.error(failure)),
      (user) {
        // Most apps require email verification
        emit(AuthState.registrationSuccess(
          user: user,
          requiresVerification: !user.isVerified,
        ));
      },
    );
  }

  Future<void> _onSignOutRequested(
    _SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    final result = await logoutUseCase(NoParams());

    result.fold(
      (failure) => emit(AuthState.error(failure)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> _onForgotPasswordRequested(
    _ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await repository.forgotPassword(email: event.email);

    result.fold(
      (failure) => emit(AuthState.error(failure)),
      (_) => emit(const AuthState.forgotPasswordSuccess()),
    );
  }

  Future<void> _onResendVerificationRequested(
    _ResendVerificationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await repository.resendVerificationEmail();

    result.fold(
      (failure) => emit(AuthState.error(failure)),
      (_) => emit(const AuthState.verificationEmailSent()),
    );
  }

  Future<void> _onGetCurrentUserRequested(
    _GetCurrentUserRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await getCurrentUserUseCase(NoParams());

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
