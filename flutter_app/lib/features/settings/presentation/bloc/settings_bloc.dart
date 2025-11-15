import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/settings.dart';
import '../../domain/usecases/get_settings.dart';
import '../../domain/usecases/reset_settings.dart';
import '../../domain/usecases/update_settings.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSettings getSettings;
  final UpdateSettings updateSettings;
  final ResetSettings resetSettings;

  SettingsBloc({
    required this.getSettings,
    required this.updateSettings,
    required this.resetSettings,
  }) : super(const SettingsState.initial()) {
    on<_LoadSettings>(_onLoadSettings);
    on<_UpdateSettings>(_onUpdateSettings);
    on<_ResetSettings>(_onResetSettings);
    on<_ToggleNotifications>(_onToggleNotifications);
    on<_ToggleEmailNotifications>(_onToggleEmailNotifications);
    on<_ToggleAutoJoinAudio>(_onToggleAutoJoinAudio);
    on<_ToggleAutoJoinVideo>(_onToggleAutoJoinVideo);
    on<_ChangeVideoQuality>(_onChangeVideoQuality);
    on<_ChangeTheme>(_onChangeTheme);
    on<_ToggleSound>(_onToggleSound);
    on<_ToggleVibration>(_onToggleVibration);
  }

  Future<void> _onLoadSettings(
    _LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());
    final result = await getSettings(NoParams());

    result.fold(
      (failure) => emit(SettingsState.error(
        message: failure.message,
      )),
      (settings) => emit(SettingsState.loaded(settings: settings)),
    );
  }

  Future<void> _onUpdateSettings(
    _UpdateSettings event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await updateSettings(
      UpdateSettingsParams(settings: event.settings),
    );

    result.fold(
      (failure) => emit(SettingsState.error(
        message: failure.message,
      )),
      (_) => emit(SettingsState.updated(settings: event.settings)),
    );
  }

  Future<void> _onResetSettings(
    _ResetSettings event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await resetSettings(NoParams());

    await result.fold(
      (failure) async => emit(SettingsState.error(
        message: failure.message,
      )),
      (_) async {
        // Reload settings after reset
        final getResult = await getSettings(NoParams());
        getResult.fold(
          (failure) => emit(SettingsState.error(
            message: failure.message,
          )),
          (settings) => emit(SettingsState.loaded(settings: settings)),
        );
      },
    );
  }

  Future<void> _onToggleNotifications(
    _ToggleNotifications event,
    Emitter<SettingsState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (settings) async {
        final newSettings =
            settings.copyWith(notificationsEnabled: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      updated: (settings) async {
        final newSettings =
            settings.copyWith(notificationsEnabled: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      orElse: () {},
    );
  }

  Future<void> _onToggleEmailNotifications(
    _ToggleEmailNotifications event,
    Emitter<SettingsState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (settings) async {
        final newSettings = settings.copyWith(emailNotifications: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      updated: (settings) async {
        final newSettings = settings.copyWith(emailNotifications: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      orElse: () {},
    );
  }

  Future<void> _onToggleAutoJoinAudio(
    _ToggleAutoJoinAudio event,
    Emitter<SettingsState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (settings) async {
        final newSettings = settings.copyWith(autoJoinAudio: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      updated: (settings) async {
        final newSettings = settings.copyWith(autoJoinAudio: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      orElse: () {},
    );
  }

  Future<void> _onToggleAutoJoinVideo(
    _ToggleAutoJoinVideo event,
    Emitter<SettingsState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (settings) async {
        final newSettings = settings.copyWith(autoJoinVideo: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      updated: (settings) async {
        final newSettings = settings.copyWith(autoJoinVideo: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      orElse: () {},
    );
  }

  Future<void> _onChangeVideoQuality(
    _ChangeVideoQuality event,
    Emitter<SettingsState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (settings) async {
        final newSettings = settings.copyWith(videoQuality: event.quality);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      updated: (settings) async {
        final newSettings = settings.copyWith(videoQuality: event.quality);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      orElse: () {},
    );
  }

  Future<void> _onChangeTheme(
    _ChangeTheme event,
    Emitter<SettingsState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (settings) async {
        final newSettings = settings.copyWith(theme: event.theme);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      updated: (settings) async {
        final newSettings = settings.copyWith(theme: event.theme);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      orElse: () {},
    );
  }

  Future<void> _onToggleSound(
    _ToggleSound event,
    Emitter<SettingsState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (settings) async {
        final newSettings = settings.copyWith(soundEnabled: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      updated: (settings) async {
        final newSettings = settings.copyWith(soundEnabled: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      orElse: () {},
    );
  }

  Future<void> _onToggleVibration(
    _ToggleVibration event,
    Emitter<SettingsState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (settings) async {
        final newSettings = settings.copyWith(vibrationEnabled: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      updated: (settings) async {
        final newSettings = settings.copyWith(vibrationEnabled: event.value);
        add(SettingsEvent.updateSettings(settings: newSettings));
      },
      orElse: () {},
    );
  }
}
