import 'package:hive/hive.dart';
import '../../domain/entities/settings.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 0)
class SettingsModel extends HiveObject {
  @HiveField(0)
  final bool notificationsEnabled;

  @HiveField(1)
  final bool emailNotifications;

  @HiveField(2)
  final bool autoJoinAudio;

  @HiveField(3)
  final bool autoJoinVideo;

  @HiveField(4)
  final String videoQuality;

  @HiveField(5)
  final String theme;

  @HiveField(6)
  final String language;

  @HiveField(7)
  final bool soundEnabled;

  @HiveField(8)
  final bool vibrationEnabled;

  SettingsModel({
    required this.notificationsEnabled,
    required this.emailNotifications,
    required this.autoJoinAudio,
    required this.autoJoinVideo,
    required this.videoQuality,
    required this.theme,
    required this.language,
    required this.soundEnabled,
    required this.vibrationEnabled,
  });

  Settings toDomain() => Settings(
        notificationsEnabled: notificationsEnabled,
        emailNotifications: emailNotifications,
        autoJoinAudio: autoJoinAudio,
        autoJoinVideo: autoJoinVideo,
        videoQuality: videoQuality,
        theme: theme,
        language: language,
        soundEnabled: soundEnabled,
        vibrationEnabled: vibrationEnabled,
      );

  factory SettingsModel.fromDomain(Settings settings) => SettingsModel(
        notificationsEnabled: settings.notificationsEnabled,
        emailNotifications: settings.emailNotifications,
        autoJoinAudio: settings.autoJoinAudio,
        autoJoinVideo: settings.autoJoinVideo,
        videoQuality: settings.videoQuality,
        theme: settings.theme,
        language: settings.language,
        soundEnabled: settings.soundEnabled,
        vibrationEnabled: settings.vibrationEnabled,
      );

  factory SettingsModel.defaultSettings() => SettingsModel(
        notificationsEnabled: true,
        emailNotifications: true,
        autoJoinAudio: false,
        autoJoinVideo: true,
        videoQuality: 'HD',
        theme: 'system',
        language: 'en',
        soundEnabled: true,
        vibrationEnabled: true,
      );
}
