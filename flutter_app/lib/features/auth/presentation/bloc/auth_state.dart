import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;

  const factory AuthState.loading() = Loading;

  const factory AuthState.authenticated(User user) = Authenticated;

  const factory AuthState.unauthenticated() = Unauthenticated;

  const factory AuthState.emailNotVerified(User user) = EmailNotVerified;

  const factory AuthState.registrationSuccess({
    required User user,
    required bool requiresVerification,
  }) = RegistrationSuccess;

  const factory AuthState.forgotPasswordSuccess() = ForgotPasswordSuccess;

  const factory AuthState.verificationEmailSent() = VerificationEmailSent;

  const factory AuthState.error(Failure failure) = Error;
}
