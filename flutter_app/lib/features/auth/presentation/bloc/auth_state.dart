import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.authenticated(User user) = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.emailNotVerified(User user) = _EmailNotVerified;

  const factory AuthState.registrationSuccess({
    required User user,
    required bool requiresVerification,
  }) = _RegistrationSuccess;

  const factory AuthState.forgotPasswordSuccess() = _ForgotPasswordSuccess;

  const factory AuthState.verificationEmailSent() = _VerificationEmailSent;

  const factory AuthState.error(Failure failure) = _Error;
}
