import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;

  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = _SignInRequested;

  const factory AuthEvent.registerRequested({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) = _RegisterRequested;

  const factory AuthEvent.signOutRequested() = _SignOutRequested;

  const factory AuthEvent.forgotPasswordRequested({
    required String email,
  }) = _ForgotPasswordRequested;

  const factory AuthEvent.resendVerificationRequested() =
      _ResendVerificationRequested;

  const factory AuthEvent.getCurrentUserRequested() = _GetCurrentUserRequested;
}
