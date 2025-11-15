part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.updateProfile({
    required ProfileUpdate profileUpdate,
  }) = UpdateProfile;

  const factory ProfileEvent.changePassword({
    required PasswordChange passwordChange,
  }) = ChangePassword;

  const factory ProfileEvent.loadProfile() = LoadProfile;
}
