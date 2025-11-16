/// Represents the state of video/camera
enum VideoState {
  /// Video is enabled and working
  enabled,

  /// Video is disabled/stopped
  disabled,

  /// No camera device available
  unavailable,

  /// Camera permission denied
  permissionDenied,

  /// Camera is being used by another application
  cameraInUseElsewhere,
}

extension VideoStateX on VideoState {
  bool get isEnabled => this == VideoState.enabled;

  bool get canToggle =>
      this == VideoState.enabled || this == VideoState.disabled;

  String? get errorMessage {
    switch (this) {
      case VideoState.unavailable:
        return 'No camera found';
      case VideoState.permissionDenied:
        return 'Camera permission denied. Please enable it from system settings.';
      case VideoState.cameraInUseElsewhere:
        return 'Camera is being used by another app';
      default:
        return null;
    }
  }
}
