part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.updateProfile({
    required ProfileUpdate profileUpdate,
  }) = _UpdateProfile;

  const factory ProfileEvent.changePassword({
    required PasswordChange passwordChange,
  }) = _ChangePassword;

  const factory ProfileEvent.loadProfile() = _LoadProfile;
}
