import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_event.freezed.dart';

/// Preview Events
///
/// Events for Join Preview page to handle camera/microphone setup
@freezed
class PreviewEvent with _$PreviewEvent {
  /// Initialize preview (check permissions, load devices)
  const factory PreviewEvent.initialize(String roomId) = Initialize;

  /// Toggle camera on/off
  const factory PreviewEvent.toggleCamera() = ToggleCamera;

  /// Toggle microphone on/off
  const factory PreviewEvent.toggleMicrophone() = ToggleMicrophone;

  /// Switch camera (front/back)
  const factory PreviewEvent.switchCamera() = SwitchCamera;

  /// Update display name
  const factory PreviewEvent.updateDisplayName(String name) = UpdateDisplayName;

  /// Request camera permission
  const factory PreviewEvent.requestCameraPermission() =
      RequestCameraPermission;

  /// Request microphone permission
  const factory PreviewEvent.requestMicrophonePermission() =
      RequestMicrophonePermission;

  /// Open app settings (for permanently denied permissions)
  const factory PreviewEvent.openSettings() = OpenSettings;

  /// Join meeting
  const factory PreviewEvent.joinMeeting() = JoinMeeting;
}
