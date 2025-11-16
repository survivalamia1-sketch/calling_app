import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/audio_state.dart';
import '../../domain/entities/call_connection_state.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/meeting_layout.dart';
import '../../domain/entities/network_quality.dart';
import '../../domain/entities/participant.dart';
import '../../domain/entities/video_state.dart';
import '../../domain/repositories/meeting_connection_service.dart';

part 'in_meeting_state.freezed.dart';

@freezed
class InMeetingState with _$InMeetingState {
  const factory InMeetingState({
    // Connection state
    @Default(CallConnectionState.disconnected)
    CallConnectionState connectionState,

    // Media states
    @Default(AudioState.unmuted) AudioState audioState,
    @Default(VideoState.enabled) VideoState videoState,
    @Default(false) bool isScreenSharing,

    // Network and quality
    @Default(NetworkQuality(level: NetworkQualityLevel.unknown))
    NetworkQuality networkQuality,

    // Participants
    @Default([]) List<Participant> participants,
    String? currentSpeakerId,
    String? pinnedParticipantId,

    // Chat
    @Default([]) List<ChatMessage> messages,
    @Default(0) int unreadMessageCount,

    // Layout
    @Default(MeetingLayout.gallery) MeetingLayout layout,

    // Meeting info
    MeetingInfo? meetingInfo,

    // UI state
    @Default(false) bool isParticipantsPanelOpen,
    @Default(false) bool isChatPanelOpen,
    @Default(false) bool isMoreOptionsOpen,

    // Recording state
    @Default(false) bool isRecording,

    // Error handling
    String? errorMessage,

    // Loading states for specific operations
    @Default(false) bool isTogglingAudio,
    @Default(false) bool isTogglingVideo,
    @Default(false) bool isTogglingScreenShare,
    @Default(false) bool isSendingMessage,
  }) = _InMeetingState;

  const InMeetingState._();

  /// Check if user is the host
  bool get isHost => meetingInfo?.hostName != null;

  /// Check if call is active and user can interact
  bool get canInteract => connectionState.canInteract;

  /// Check if we're in a loading/transitional state
  bool get isLoading =>
      connectionState == CallConnectionState.connecting ||
      connectionState == CallConnectionState.reconnecting;

  /// Check if there are any active participants
  bool get hasParticipants => participants.isNotEmpty;

  /// Get participant count (excluding self)
  int get participantCount => participants.length;

  /// Check if there are unread messages
  bool get hasUnreadMessages => unreadMessageCount > 0;

  /// Check if network quality is poor
  bool get hasNetworkIssues => networkQuality.shouldShowWarning;

  /// Get pinned participant
  Participant? get pinnedParticipant {
    if (pinnedParticipantId == null) return null;
    try {
      return participants.firstWhere((p) => p.id == pinnedParticipantId);
    } catch (_) {
      return null;
    }
  }

  /// Get current active speaker
  Participant? get activeSpeaker {
    if (currentSpeakerId == null) return null;
    try {
      return participants.firstWhere((p) => p.id == currentSpeakerId);
    } catch (_) {
      return null;
    }
  }

  /// Check if screen sharing is supported on this platform
  bool get canScreenShare => !isScreenSharing;

  /// Get display participants based on current layout
  List<Participant> get displayParticipants {
    switch (layout) {
      case MeetingLayout.gallery:
        return participants;
      case MeetingLayout.speaker:
        if (activeSpeaker != null) {
          return [
            activeSpeaker!,
            ...participants.where((p) => p.id != currentSpeakerId)
          ];
        }
        return participants;
      case MeetingLayout.pinned:
        if (pinnedParticipant != null) {
          return [
            pinnedParticipant!,
            ...participants.where((p) => p.id != pinnedParticipantId)
          ];
        }
        return participants;
    }
  }
}
