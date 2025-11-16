/// Represents the state of audio/microphone
enum AudioState {
  /// Audio is unmuted and working
  unmuted,

  /// Audio is muted
  muted,

  /// No microphone device available
  unavailable,

  /// Microphone permission denied
  permissionDenied,
}

extension AudioStateX on AudioState {
  bool get isMuted => this == AudioState.muted;

  bool get canToggle =>
      this == AudioState.muted || this == AudioState.unmuted;

  String? get errorMessage {
    switch (this) {
      case AudioState.unavailable:
        return 'No microphone detected';
      case AudioState.permissionDenied:
        return 'Microphone permission denied';
      default:
        return null;
    }
  }
}
