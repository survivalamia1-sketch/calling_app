import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final bool notificationsEnabled;
  final bool emailNotifications;
  final bool autoJoinAudio;
  final bool autoJoinVideo;
  final String videoQuality; // 'HD', 'SD', 'Low'
  final String theme; // 'system', 'light', 'dark'
  final String language;
  final bool soundEnabled;
  final bool vibrationEnabled;

  const Settings({
    required this.notificationsEnabled,
    required this.emailNotifications,
    required this.autoJoinAudio,
    required this.autoJoinVideo,
    required this.videoQuality,
    required this.theme,
    this.language = 'en',
    this.soundEnabled = true,
    this.vibrationEnabled = true,
  });

  // Default settings
  factory Settings.defaultSettings() => const Settings(
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

  Settings copyWith({
    bool? notificationsEnabled,
    bool? emailNotifications,
    bool? autoJoinAudio,
    bool? autoJoinVideo,
    String? videoQuality,
    String? theme,
    String? language,
    bool? soundEnabled,
    bool? vibrationEnabled,
  }) {
    return Settings(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      autoJoinAudio: autoJoinAudio ?? this.autoJoinAudio,
      autoJoinVideo: autoJoinVideo ?? this.autoJoinVideo,
      videoQuality: videoQuality ?? this.videoQuality,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      soundEnabled: soundEnabled ?? this.soundEnabled,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
    );
  }

  @override
  List<Object?> get props => [
        notificationsEnabled,
        emailNotifications,
        autoJoinAudio,
        autoJoinVideo,
        videoQuality,
        theme,
        language,
        soundEnabled,
        vibrationEnabled,
      ];
}
