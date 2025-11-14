import 'package:hive/hive.dart';
import '../../../../core/error/exceptions.dart';
import '../models/settings_model.dart';

abstract class SettingsLocalDataSource {
  Future<SettingsModel> getSettings();
  Future<void> cacheSettings(SettingsModel settings);
  Future<void> clearSettings();
}

const String SETTINGS_BOX = 'settings';
const String SETTINGS_KEY = 'user_settings';

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final Box<SettingsModel> settingsBox;

  SettingsLocalDataSourceImpl({required this.settingsBox});

  @override
  Future<SettingsModel> getSettings() async {
    try {
      final settings = settingsBox.get(SETTINGS_KEY);
      if (settings != null) {
        return settings;
      } else {
        // Return default settings if none exist
        final defaultSettings = SettingsModel.defaultSettings();
        await cacheSettings(defaultSettings);
        return defaultSettings;
      }
    } catch (e) {
      throw CacheException(message: 'Failed to get settings from cache');
    }
  }

  @override
  Future<void> cacheSettings(SettingsModel settings) async {
    try {
      await settingsBox.put(SETTINGS_KEY, settings);
    } catch (e) {
      throw CacheException(message: 'Failed to cache settings');
    }
  }

  @override
  Future<void> clearSettings() async {
    try {
      await settingsBox.delete(SETTINGS_KEY);
      // Put default settings back
      await cacheSettings(SettingsModel.defaultSettings());
    } catch (e) {
      throw CacheException(message: 'Failed to clear settings');
    }
  }
}
