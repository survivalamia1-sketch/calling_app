import 'package:equatable/equatable.dart';

/// Represents a participant in the meeting
class Participant extends Equatable {
  final String id;
  final String displayName;
  final bool isMuted;
  final bool isVideoOn;
  final bool isSpeaking;
  final bool isHost;
  final bool isScreenSharing;
  final bool isHandRaised;
  final String? avatarUrl;

  const Participant({
    required this.id,
    required this.displayName,
    this.isMuted = true,
    this.isVideoOn = false,
    this.isSpeaking = false,
    this.isHost = false,
    this.isScreenSharing = false,
    this.isHandRaised = false,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [
        id,
        displayName,
        isMuted,
        isVideoOn,
        isSpeaking,
        isHost,
        isScreenSharing,
        isHandRaised,
        avatarUrl,
      ];

  Participant copyWith({
    String? id,
    String? displayName,
    bool? isMuted,
    bool? isVideoOn,
    bool? isSpeaking,
    bool? isHost,
    bool? isScreenSharing,
    bool? isHandRaised,
    String? avatarUrl,
  }) {
    return Participant(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      isMuted: isMuted ?? this.isMuted,
      isVideoOn: isVideoOn ?? this.isVideoOn,
      isSpeaking: isSpeaking ?? this.isSpeaking,
      isHost: isHost ?? this.isHost,
      isScreenSharing: isScreenSharing ?? this.isScreenSharing,
      isHandRaised: isHandRaised ?? this.isHandRaised,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  /// Get initials from display name for avatar
  String get initials {
    final parts = displayName.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      return parts[0].isNotEmpty ? parts[0][0].toUpperCase() : '?';
    }
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }
}
