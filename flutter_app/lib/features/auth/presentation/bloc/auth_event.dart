import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;

  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = SignInRequested;

  const factory AuthEvent.registerRequested({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) = RegisterRequested;

  const factory AuthEvent.signOutRequested() = SignOutRequested;

  const factory AuthEvent.forgotPasswordRequested({
    required String email,
  }) = ForgotPasswordRequested;

  const factory AuthEvent.resendVerificationRequested() =
      ResendVerificationRequested;

  const factory AuthEvent.getCurrentUserRequested() = GetCurrentUserRequested;
}
