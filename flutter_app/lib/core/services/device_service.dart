/// Device Service Interface
///
/// This service provides an abstraction layer for device capabilities
/// and permissions related to camera and microphone.
///
/// No Mock Data - This is an interface only, ready for real implementation
/// using platform-specific packages like permission_handler.
abstract class DeviceService {
  /// Check if device has a camera
  Future<bool> hasCamera();

  /// Check if device has a microphone
  Future<bool> hasMicrophone();

  /// Request camera permission from user
  /// Returns true if granted, false otherwise
  Future<bool> requestCameraPermission();

  /// Request microphone permission from user
  /// Returns true if granted, false otherwise
  Future<bool> requestMicrophonePermission();

  /// Check if camera permission is currently granted
  Future<bool> isCameraPermissionGranted();

  /// Check if microphone permission is currently granted
  Future<bool> isMicrophonePermissionGranted();

  /// Get list of available cameras
  /// Returns list of camera IDs/names
  Future<List<String>> getAvailableCameras();

  /// Switch to next available camera
  /// Returns the new camera ID
  Future<String?> switchCamera();

  /// Open device settings for app permissions
  Future<void> openAppSettings();

  /// Check if permissions are permanently denied
  Future<bool> isCameraPermissionPermanentlyDenied();

  /// Check if microphone permission is permanently denied
  Future<bool> isMicrophonePermissionPermanentlyDenied();
}

/// Device Permission Status
enum PermissionStatus {
  /// Permission granted
  granted,

  /// Permission denied
  denied,

  /// Permission permanently denied (user selected "Don't ask again")
  permanentlyDenied,

  /// Permission not determined yet (first time asking)
  notDetermined,

  /// Permission restricted (parental controls, etc.)
  restricted,
}

/// Device Permissions Model
class DevicePermissions {
  final PermissionStatus camera;
  final PermissionStatus microphone;

  const DevicePermissions({
    required this.camera,
    required this.microphone,
  });

  bool get hasCameraAccess => camera == PermissionStatus.granted;
  bool get hasMicrophoneAccess => microphone == PermissionStatus.granted;
  bool get hasFullAccess => hasCameraAccess && hasMicrophoneAccess;

  bool get isCameraPermanentlyDenied =>
      camera == PermissionStatus.permanentlyDenied;
  bool get isMicrophonePermanentlyDenied =>
      microphone == PermissionStatus.permanentlyDenied;

  DevicePermissions copyWith({
    PermissionStatus? camera,
    PermissionStatus? microphone,
  }) {
    return DevicePermissions(
      camera: camera ?? this.camera,
      microphone: microphone ?? this.microphone,
    );
  }

  @override
  String toString() {
    return 'DevicePermissions(camera: $camera, microphone: $microphone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DevicePermissions &&
        other.camera == camera &&
        other.microphone == microphone;
  }

  @override
  int get hashCode => camera.hashCode ^ microphone.hashCode;
}
