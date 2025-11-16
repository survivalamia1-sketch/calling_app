/// Meeting Connection Service Interface
///
/// This service provides an abstraction layer for connecting to meeting rooms.
/// It handles the connection lifecycle from initial connection to disconnection.
///
/// No Mock Data - This is an interface only, ready for real implementation
/// using the existing WebRTC and Signaling services.
abstract class MeetingConnectionService {
  /// Connect to a meeting room
  ///
  /// [meetingId] - The room/meeting ID to connect to
  /// [options] - Connection options (audio enabled, video enabled, etc.)
  ///
  /// Returns true if connection was successful
  Future<bool> connectToRoom(String meetingId, ConnectionOptions options);

  /// Cancel ongoing connection attempt
  Future<void> cancelConnection();

  /// Disconnect from current room
  Future<void> disconnect();

  /// Get stream of connection status updates
  Stream<ConnectionStatus> get connectionStatusStream;

  /// Get current connection status
  ConnectionStatus get currentStatus;

  /// Get connection progress messages
  Stream<String> get connectionProgressStream;
}

/// Connection Options
class ConnectionOptions {
  /// Enable audio on join
  final bool audioEnabled;

  /// Enable video on join
  final bool videoEnabled;

  /// User display name (for guests or override)
  final String? displayName;

  /// Meeting password (if required)
  final String? password;

  /// Preferred camera (front/back)
  final CameraPreference cameraPreference;

  const ConnectionOptions({
    this.audioEnabled = true,
    this.videoEnabled = true,
    this.displayName,
    this.password,
    this.cameraPreference = CameraPreference.front,
  });

  ConnectionOptions copyWith({
    bool? audioEnabled,
    bool? videoEnabled,
    String? displayName,
    String? password,
    CameraPreference? cameraPreference,
  }) {
    return ConnectionOptions(
      audioEnabled: audioEnabled ?? this.audioEnabled,
      videoEnabled: videoEnabled ?? this.videoEnabled,
      displayName: displayName ?? this.displayName,
      password: password ?? this.password,
      cameraPreference: cameraPreference ?? this.cameraPreference,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'audio_enabled': audioEnabled,
      'video_enabled': videoEnabled,
      'display_name': displayName,
      'password': password,
      'camera_preference': cameraPreference.name,
    };
  }

  @override
  String toString() {
    return 'ConnectionOptions(audio: $audioEnabled, video: $videoEnabled, name: $displayName)';
  }
}

/// Camera Preference
enum CameraPreference {
  /// Front-facing camera (selfie camera)
  front,

  /// Back-facing camera
  back,

  /// System default
  systemDefault,
}

/// Connection Status
enum ConnectionStatus {
  /// Not connected, idle state
  idle,

  /// Checking device permissions
  checkingPermissions,

  /// Initializing audio
  initializingAudio,

  /// Initializing video
  initializingVideo,

  /// Connecting to server
  connectingToServer,

  /// Joining room
  joiningRoom,

  /// Successfully connected
  connected,

  /// Connection failed
  failed,

  /// Disconnected
  disconnected,

  /// Connection cancelled by user
  cancelled,

  /// Reconnecting after network issue
  reconnecting,
}

/// Connection Error
class ConnectionError {
  final ConnectionErrorType type;
  final String message;
  final dynamic originalError;

  const ConnectionError({
    required this.type,
    required this.message,
    this.originalError,
  });

  @override
  String toString() => 'ConnectionError($type): $message';
}

/// Connection Error Types
enum ConnectionErrorType {
  /// Permission denied (camera/microphone)
  permissionDenied,

  /// Network error
  networkError,

  /// Room not found
  roomNotFound,

  /// Room is full
  roomFull,

  /// Invalid password
  invalidPassword,

  /// Meeting has ended
  meetingEnded,

  /// User was kicked/removed
  userRemoved,

  /// Timeout
  timeout,

  /// Unknown error
  unknown,
}
