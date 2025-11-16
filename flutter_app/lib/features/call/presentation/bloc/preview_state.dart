import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/device_service.dart';

part 'preview_state.freezed.dart';

/// Preview State
///
/// State for Join Preview page
@freezed
class PreviewState with _$PreviewState {
  const factory PreviewState({
    /// Current room ID
    required String roomId,

    /// Is camera enabled
    @Default(true) bool cameraEnabled,

    /// Is microphone enabled
    @Default(true) bool microphoneEnabled,

    /// Current camera (front/back)
    @Default('front') String currentCamera,

    /// Display name for user
    String? displayName,

    /// Device permissions status
    @Default(DevicePermissions(
      camera: PermissionStatus.notDetermined,
      microphone: PermissionStatus.notDetermined,
    ))
    DevicePermissions permissions,

    /// Available cameras
    @Default([]) List<String> availableCameras,

    /// Has camera device
    @Default(true) bool hasCamera,

    /// Has microphone device
    @Default(true) bool hasMicrophone,

    /// Is loading/processing
    @Default(false) bool isLoading,

    /// Error message
    String? errorMessage,

    /// Is ready to join
    @Default(false) bool isReadyToJoin,
  }) = _PreviewState;

  const PreviewState._();

  /// Can join meeting
  bool get canJoin {
    // Can join if at least one permission is granted or devices are available
    // User can join without camera/mic (audio-only or view-only)
    return !isLoading && errorMessage == null;
  }

  /// Should show permissions warning
  bool get showPermissionsWarning {
    return permissions.isCameraPermanentlyDenied ||
        permissions.isMicrophonePermanentlyDenied;
  }

  /// Permissions message
  String get permissionsMessage {
    if (permissions.isCameraPermanentlyDenied &&
        permissions.isMicrophonePermanentlyDenied) {
      return 'Camera and microphone permissions are permanently denied. Please enable them in settings.';
    } else if (permissions.isCameraPermanentlyDenied) {
      return 'Camera permission is permanently denied. Please enable it in settings to use video.';
    } else if (permissions.isMicrophonePermanentlyDenied) {
      return 'Microphone permission is permanently denied. Please enable it in settings to use audio.';
    } else if (!permissions.hasCameraAccess && !permissions.hasMicrophoneAccess) {
      return 'Camera and microphone permissions are required for full meeting experience.';
    } else if (!permissions.hasCameraAccess) {
      return 'Camera permission is required to share video.';
    } else if (!permissions.hasMicrophoneAccess) {
      return 'Microphone permission is required to share audio.';
    }
    return '';
  }

  /// Can toggle camera
  bool get canToggleCamera {
    return hasCamera && permissions.hasCameraAccess;
  }

  /// Can toggle microphone
  bool get canToggleMicrophone {
    return hasMicrophone && permissions.hasMicrophoneAccess;
  }

  /// Can switch camera
  bool get canSwitchCamera {
    return hasCamera &&
        permissions.hasCameraAccess &&
        cameraEnabled &&
        availableCameras.length > 1;
  }
}
