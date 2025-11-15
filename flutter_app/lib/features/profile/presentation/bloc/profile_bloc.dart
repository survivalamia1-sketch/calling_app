import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/user.dart';
import '../../domain/entities/profile_update.dart';
import '../../domain/usecases/change_password.dart' as change_password;
import '../../domain/usecases/update_profile.dart' as update_profile;

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final update_profile.UpdateProfile updateProfile;
  final change_password.ChangePassword changePassword;

  ProfileBloc({
    required this.updateProfile,
    required this.changePassword,
  }) : super(const ProfileState.initial()) {
    on<UpdateProfile>(_onUpdateProfile);
    on<ChangePassword>(_onChangePassword);
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await updateProfile(
      update_profile.UpdateProfileParams(profileUpdate: event.profileUpdate),
    );

    result.fold(
      (failure) => emit(ProfileState.error(
        message: failure.message,
      )),
      (user) => emit(ProfileState.profileUpdated(user: user)),
    );
  }

  Future<void> _onChangePassword(
    ChangePassword event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await changePassword(
      change_password.ChangePasswordParams(
          passwordChange: event.passwordChange),
    );

    result.fold(
      (failure) => emit(ProfileState.error(
        message: failure.message,
      )),
      (_) => emit(const ProfileState.passwordChanged()),
    );
  }
}
