/// Service interface for controlling media (audio/video) in the meeting
abstract class MeetingMediaService {
  /// Mute the user's microphone
  Future<void> muteAudio();

  /// Unmute the user's microphone
  Future<void> unmuteAudio();

  /// Start/enable video camera
  Future<void> startVideo();

  /// Stop/disable video camera
  Future<void> stopVideo();

  /// Switch between front and back camera (mobile)
  Future<void> switchCamera();

  /// Start screen sharing
  Future<void> startScreenShare();

  /// Stop screen sharing
  Future<void> stopScreenShare();

  /// Check if screen sharing is supported on this platform
  bool isScreenShareSupported();

  /// Get list of available audio devices
  Future<List<MediaDevice>> getAudioDevices();

  /// Get list of available video devices
  Future<List<MediaDevice>> getVideoDevices();

  /// Switch to a specific audio device
  Future<void> selectAudioDevice(String deviceId);

  /// Switch to a specific video device
  Future<void> selectVideoDevice(String deviceId);
}

/// Represents a media device (camera, microphone, speaker)
class MediaDevice {
  final String id;
  final String label;
  final MediaDeviceType type;
  final bool isDefault;

  const MediaDevice({
    required this.id,
    required this.label,
    required this.type,
    this.isDefault = false,
  });
}

enum MediaDeviceType {
  audioInput,
  audioOutput,
  videoInput,
}
