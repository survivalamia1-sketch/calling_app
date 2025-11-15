part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.profileUpdated({required User user}) =
      ProfileUpdated;
  const factory ProfileState.passwordChanged() = PasswordChanged;
  const factory ProfileState.error({required String message}) = Error;
}
