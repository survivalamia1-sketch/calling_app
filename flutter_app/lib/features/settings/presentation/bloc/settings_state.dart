part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded({required Settings settings}) = _Loaded;
  const factory SettingsState.error({required String message}) = _Error;
  const factory SettingsState.updated({required Settings settings}) = _Updated;
}
