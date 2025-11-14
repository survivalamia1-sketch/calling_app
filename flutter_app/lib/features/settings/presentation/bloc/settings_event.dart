part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadSettings() = _LoadSettings;
  const factory SettingsEvent.updateSettings({required Settings settings}) =
      _UpdateSettings;
  const factory SettingsEvent.resetSettings() = _ResetSettings;
  const factory SettingsEvent.toggleNotifications({required bool value}) =
      _ToggleNotifications;
  const factory SettingsEvent.toggleEmailNotifications({required bool value}) =
      _ToggleEmailNotifications;
  const factory SettingsEvent.toggleAutoJoinAudio({required bool value}) =
      _ToggleAutoJoinAudio;
  const factory SettingsEvent.toggleAutoJoinVideo({required bool value}) =
      _ToggleAutoJoinVideo;
  const factory SettingsEvent.changeVideoQuality({required String quality}) =
      _ChangeVideoQuality;
  const factory SettingsEvent.changeTheme({required String theme}) =
      _ChangeTheme;
  const factory SettingsEvent.toggleSound({required bool value}) =
      _ToggleSound;
  const factory SettingsEvent.toggleVibration({required bool value}) =
      _ToggleVibration;
}
