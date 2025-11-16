/// Represents the connection state of the call
enum CallConnectionState {
  /// Currently connecting to the meeting
  connecting,

  /// Successfully connected to the meeting
  connected,

  /// Connection lost, attempting to reconnect
  reconnecting,

  /// Disconnected from the meeting
  disconnected,
}

extension CallConnectionStateX on CallConnectionState {
  String get displayName {
    switch (this) {
      case CallConnectionState.connecting:
        return 'Connecting...';
      case CallConnectionState.connected:
        return 'Connected';
      case CallConnectionState.reconnecting:
        return 'Reconnecting...';
      case CallConnectionState.disconnected:
        return 'Disconnected';
    }
  }

  bool get isActive =>
      this == CallConnectionState.connected ||
      this == CallConnectionState.reconnecting;

  bool get canInteract => this == CallConnectionState.connected;
}
