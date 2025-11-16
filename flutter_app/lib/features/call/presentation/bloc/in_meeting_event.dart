import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/call_connection_state.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/meeting_layout.dart';
import '../../domain/entities/network_quality.dart';
import '../../domain/entities/participant.dart';

part 'in_meeting_event.freezed.dart';

@freezed
class InMeetingEvent with _$InMeetingEvent {
  // Connection events
  const factory InMeetingEvent.joinRoom({
    required String roomId,
    required String userId,
    required String displayName,
    @Default(true) bool joinWithAudio,
    @Default(true) bool joinWithVideo,
    String? password,
  }) = JoinRoom;

  const factory InMeetingEvent.leaveCall() = LeaveCall;
  const factory InMeetingEvent.endCallForAll() = EndCallForAll;

  // Audio/Video control events
  const factory InMeetingEvent.toggleAudio() = ToggleAudio;
  const factory InMeetingEvent.toggleVideo() = ToggleVideo;
  const factory InMeetingEvent.switchCamera() = SwitchCamera;

  // Screen sharing events
  const factory InMeetingEvent.toggleScreenShare() = ToggleScreenShare;

  // Layout events
  const factory InMeetingEvent.changeLayout(MeetingLayout layout) =
      ChangeLayout;
  const factory InMeetingEvent.pinParticipant(String? participantId) =
      PinParticipant;

  // Chat events
  const factory InMeetingEvent.sendMessage(String content) = SendMessage;
  const factory InMeetingEvent.sendPrivateMessage({
    required String content,
    required String recipientId,
  }) = SendPrivateMessage;
  const factory InMeetingEvent.markMessagesAsRead() = MarkMessagesAsRead;
  const factory InMeetingEvent.deleteMessage(String messageId) = DeleteMessage;

  // Host control events
  const factory InMeetingEvent.muteParticipant(String participantId) =
      MuteParticipant;
  const factory InMeetingEvent.removeParticipant(String participantId) =
      RemoveParticipant;
  const factory InMeetingEvent.admitParticipant(String participantId) =
      AdmitParticipant;
  const factory InMeetingEvent.rejectParticipant(String participantId) =
      RejectParticipant;

  // Device selection events
  const factory InMeetingEvent.selectAudioDevice(String deviceId) =
      SelectAudioDevice;
  const factory InMeetingEvent.selectVideoDevice(String deviceId) =
      SelectVideoDevice;

  // UI state events
  const factory InMeetingEvent.toggleParticipantsPanel() =
      ToggleParticipantsPanel;
  const factory InMeetingEvent.toggleChatPanel() = ToggleChatPanel;
  const factory InMeetingEvent.toggleMoreOptions() = ToggleMoreOptions;

  // Stream update events (internal - from service subscriptions)
  const factory InMeetingEvent.connectionStateChanged(
      CallConnectionState state) = ConnectionStateChanged;
  const factory InMeetingEvent.participantsUpdated(
      List<Participant> participants) = ParticipantsUpdated;
  const factory InMeetingEvent.networkQualityChanged(NetworkQuality quality) =
      NetworkQualityChanged;
  const factory InMeetingEvent.messagesUpdated(List<ChatMessage> messages) =
      MessagesUpdated;
  const factory InMeetingEvent.unreadCountUpdated(int count) =
      UnreadCountUpdated;

  // Error events
  const factory InMeetingEvent.errorOccurred(String message) = ErrorOccurred;
  const factory InMeetingEvent.clearError() = ClearError;
}
