import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../auth/domain/entities/user.dart';
import '../../domain/entities/profile_update.dart';
import '../../domain/usecases/change_password.dart';
import '../../domain/usecases/update_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateProfile updateProfile;
  final ChangePassword changePassword;

  ProfileBloc({
    required this.updateProfile,
    required this.changePassword,
  }) : super(const ProfileState.initial()) {
    on<_UpdateProfile>(_onUpdateProfile);
    on<_ChangePassword>(_onChangePassword);
  }

  Future<void> _onUpdateProfile(
    _UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await updateProfile(
      UpdateProfileParams(profileUpdate: event.profileUpdate),
    );

    result.fold(
      (failure) => emit(ProfileState.error(
        message: failure.message ?? 'Failed to update profile',
      )),
      (user) => emit(ProfileState.profileUpdated(user: user)),
    );
  }

  Future<void> _onChangePassword(
    _ChangePassword event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await changePassword(
      ChangePasswordParams(passwordChange: event.passwordChange),
    );

    result.fold(
      (failure) => emit(ProfileState.error(
        message: failure.message ?? 'Failed to change password',
      )),
      (_) => emit(const ProfileState.passwordChanged()),
    );
  }
}
