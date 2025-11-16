import 'dart:async';

import 'package:calling_app/features/call/domain/entities/call_connection_state.dart';
import 'package:calling_app/features/call/domain/entities/meeting_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/audio_state.dart';
import '../../domain/entities/video_state.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/repositories/meeting_connection_service.dart';
import '../../domain/repositories/meeting_media_service.dart';
import 'in_meeting_event.dart';
import 'in_meeting_state.dart';

class InMeetingBloc extends Bloc<InMeetingEvent, InMeetingState> {
  final MeetingConnectionService _connectionService;
  final MeetingMediaService _mediaService;
  final ChatRepository _chatRepository;

  // Stream subscriptions
  StreamSubscription<dynamic>? _connectionStateSubscription;
  StreamSubscription<dynamic>? _participantsSubscription;
  StreamSubscription<dynamic>? _networkQualitySubscription;
  StreamSubscription<dynamic>? _messagesSubscription;
  StreamSubscription<dynamic>? _unreadCountSubscription;

  InMeetingBloc({
    required MeetingConnectionService connectionService,
    required MeetingMediaService mediaService,
    required ChatRepository chatRepository,
  })  : _connectionService = connectionService,
        _mediaService = mediaService,
        _chatRepository = chatRepository,
        super(const InMeetingState()) {
    // Register event handlers
    on<JoinRoom>(_onJoinRoom);
    on<LeaveCall>(_onLeaveCall);
    on<EndCallForAll>(_onEndCallForAll);

    on<ToggleAudio>(_onToggleAudio);
    on<ToggleVideo>(_onToggleVideo);
    on<SwitchCamera>(_onSwitchCamera);

    on<ToggleScreenShare>(_onToggleScreenShare);

    on<ChangeLayout>(_onChangeLayout);
    on<PinParticipant>(_onPinParticipant);

    on<SendMessage>(_onSendMessage);
    on<SendPrivateMessage>(_onSendPrivateMessage);
    on<MarkMessagesAsRead>(_onMarkMessagesAsRead);
    on<DeleteMessage>(_onDeleteMessage);

    on<MuteParticipant>(_onMuteParticipant);
    on<RemoveParticipant>(_onRemoveParticipant);
    on<AdmitParticipant>(_onAdmitParticipant);
    on<RejectParticipant>(_onRejectParticipant);

    on<SelectAudioDevice>(_onSelectAudioDevice);
    on<SelectVideoDevice>(_onSelectVideoDevice);

    on<ToggleParticipantsPanel>(_onToggleParticipantsPanel);
    on<ToggleChatPanel>(_onToggleChatPanel);
    on<ToggleMoreOptions>(_onToggleMoreOptions);

    on<ConnectionStateChanged>(_onConnectionStateChanged);
    on<ParticipantsUpdated>(_onParticipantsUpdated);
    on<NetworkQualityChanged>(_onNetworkQualityChanged);
    on<MessagesUpdated>(_onMessagesUpdated);
    on<UnreadCountUpdated>(_onUnreadCountUpdated);

    on<ErrorOccurred>(_onErrorOccurred);
    on<ClearError>(_onClearError);
  }

  // === Connection Events ===

  Future<void> _onJoinRoom(JoinRoom event, Emitter<InMeetingState> emit) async {
    try {
      emit(state.copyWith(
        connectionState: CallConnectionState.connecting,
        errorMessage: null,
      ));

      // Subscribe to streams BEFORE connecting to avoid missing events
      _subscribeToStreams();

      final params = MeetingJoinParams(
        roomId: event.roomId,
        userId: event.userId,
        displayName: event.displayName,
        joinWithAudio: event.joinWithAudio,
        joinWithVideo: event.joinWithVideo,
        password: event.password,
      );

      await _connectionService.connectToRoom(params);

      // Get meeting info
      final meetingInfo = await _connectionService.getMeetingInfo();

      emit(state.copyWith(
        meetingInfo: meetingInfo,
        audioState: event.joinWithAudio ? AudioState.unmuted : AudioState.muted,
        videoState:
            event.joinWithVideo ? VideoState.enabled : VideoState.disabled,
      ));
    } catch (e) {
      emit(state.copyWith(
        connectionState: CallConnectionState.disconnected,
        errorMessage: 'Failed to join room: ${e.toString()}',
      ));
    }
  }

  Future<void> _onLeaveCall(
      LeaveCall event, Emitter<InMeetingState> emit) async {
    try {
      await _connectionService.leaveRoom();
      await _unsubscribeFromStreams();

      // Reset to initial state
      emit(const InMeetingState());
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to leave call: ${e.toString()}',
      ));
    }
  }

  Future<void> _onEndCallForAll(
      EndCallForAll event, Emitter<InMeetingState> emit) async {
    try {
      if (!state.isHost) {
        emit(state.copyWith(
          errorMessage: 'Only the host can end the meeting for all',
        ));
        return;
      }

      await _connectionService.endMeetingForAll();
      await _unsubscribeFromStreams();

      // Reset to initial state
      emit(const InMeetingState());
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to end meeting: ${e.toString()}',
      ));
    }
  }

  // === Audio/Video Control Events ===

  Future<void> _onToggleAudio(
      ToggleAudio event, Emitter<InMeetingState> emit) async {
    if (!state.audioState.canToggle) {
      emit(state.copyWith(
        errorMessage: state.audioState.errorMessage ?? 'Cannot toggle audio',
      ));
      return;
    }

    try {
      emit(state.copyWith(isTogglingAudio: true, errorMessage: null));

      if (state.audioState.isMuted) {
        await _mediaService.unmuteAudio();
        emit(state.copyWith(
          audioState: AudioState.unmuted,
          isTogglingAudio: false,
        ));
      } else {
        await _mediaService.muteAudio();
        emit(state.copyWith(
          audioState: AudioState.muted,
          isTogglingAudio: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isTogglingAudio: false,
        errorMessage: 'Failed to toggle audio: ${e.toString()}',
      ));
    }
  }

  Future<void> _onToggleVideo(
      ToggleVideo event, Emitter<InMeetingState> emit) async {
    if (!state.videoState.canToggle) {
      emit(state.copyWith(
        errorMessage: state.videoState.errorMessage ?? 'Cannot toggle video',
      ));
      return;
    }

    try {
      emit(state.copyWith(isTogglingVideo: true, errorMessage: null));

      if (state.videoState.isEnabled) {
        await _mediaService.stopVideo();
        emit(state.copyWith(
          videoState: VideoState.disabled,
          isTogglingVideo: false,
        ));
      } else {
        await _mediaService.startVideo();
        emit(state.copyWith(
          videoState: VideoState.enabled,
          isTogglingVideo: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isTogglingVideo: false,
        errorMessage: 'Failed to toggle video: ${e.toString()}',
      ));
    }
  }

  Future<void> _onSwitchCamera(
      SwitchCamera event, Emitter<InMeetingState> emit) async {
    try {
      emit(state.copyWith(errorMessage: null));
      await _mediaService.switchCamera();
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to switch camera: ${e.toString()}',
      ));
    }
  }

  // === Screen Sharing Events ===

  Future<void> _onToggleScreenShare(
      ToggleScreenShare event, Emitter<InMeetingState> emit) async {
    if (!_mediaService.isScreenShareSupported()) {
      emit(state.copyWith(
        errorMessage: 'Screen sharing is not supported on this platform',
      ));
      return;
    }

    try {
      emit(state.copyWith(isTogglingScreenShare: true, errorMessage: null));

      if (state.isScreenSharing) {
        await _mediaService.stopScreenShare();
        emit(state.copyWith(
          isScreenSharing: false,
          isTogglingScreenShare: false,
        ));
      } else {
        await _mediaService.startScreenShare();
        emit(state.copyWith(
          isScreenSharing: true,
          isTogglingScreenShare: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isTogglingScreenShare: false,
        errorMessage: 'Failed to toggle screen share: ${e.toString()}',
      ));
    }
  }

  // === Layout Events ===

  Future<void> _onChangeLayout(
      ChangeLayout event, Emitter<InMeetingState> emit) async {
    emit(state.copyWith(layout: event.layout, errorMessage: null));
  }

  Future<void> _onPinParticipant(
      PinParticipant event, Emitter<InMeetingState> emit) async {
    emit(state.copyWith(
      pinnedParticipantId: event.participantId,
      layout: event.participantId != null
          ? MeetingLayout.pinned
          : MeetingLayout.gallery,
      errorMessage: null,
    ));
  }

  // === Chat Events ===

  Future<void> _onSendMessage(
      SendMessage event, Emitter<InMeetingState> emit) async {
    try {
      emit(state.copyWith(isSendingMessage: true, errorMessage: null));
      await _chatRepository.sendMessage(event.content);
      emit(state.copyWith(isSendingMessage: false));
    } catch (e) {
      emit(state.copyWith(
        isSendingMessage: false,
        errorMessage: 'Failed to send message: ${e.toString()}',
      ));
    }
  }

  Future<void> _onSendPrivateMessage(
      SendPrivateMessage event, Emitter<InMeetingState> emit) async {
    try {
      emit(state.copyWith(isSendingMessage: true, errorMessage: null));
      await _chatRepository.sendPrivateMessage(
          event.content, event.recipientId);
      emit(state.copyWith(isSendingMessage: false));
    } catch (e) {
      emit(state.copyWith(
        isSendingMessage: false,
        errorMessage: 'Failed to send private message: ${e.toString()}',
      ));
    }
  }

  Future<void> _onMarkMessagesAsRead(
      MarkMessagesAsRead event, Emitter<InMeetingState> emit) async {
    try {
      await _chatRepository.markAllAsRead();
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to mark messages as read: ${e.toString()}',
      ));
    }
  }

  Future<void> _onDeleteMessage(
      DeleteMessage event, Emitter<InMeetingState> emit) async {
    try {
      await _chatRepository.deleteMessage(event.messageId);
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to delete message: ${e.toString()}',
      ));
    }
  }

  // === Host Control Events ===

  Future<void> _onMuteParticipant(
      MuteParticipant event, Emitter<InMeetingState> emit) async {
    if (!state.isHost) {
      emit(state.copyWith(
        errorMessage: 'Only the host can mute participants',
      ));
      return;
    }

    try {
      await _connectionService.muteParticipant(event.participantId);
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to mute participant: ${e.toString()}',
      ));
    }
  }

  Future<void> _onRemoveParticipant(
      RemoveParticipant event, Emitter<InMeetingState> emit) async {
    if (!state.isHost) {
      emit(state.copyWith(
        errorMessage: 'Only the host can remove participants',
      ));
      return;
    }

    try {
      await _connectionService.removeParticipant(event.participantId);
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to remove participant: ${e.toString()}',
      ));
    }
  }

  Future<void> _onAdmitParticipant(
      AdmitParticipant event, Emitter<InMeetingState> emit) async {
    if (!state.isHost) {
      emit(state.copyWith(
        errorMessage: 'Only the host can admit participants',
      ));
      return;
    }

    try {
      await _connectionService.admitParticipant(event.participantId);
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to admit participant: ${e.toString()}',
      ));
    }
  }

  Future<void> _onRejectParticipant(
      RejectParticipant event, Emitter<InMeetingState> emit) async {
    if (!state.isHost) {
      emit(state.copyWith(
        errorMessage: 'Only the host can reject participants',
      ));
      return;
    }

    try {
      await _connectionService.rejectParticipant(event.participantId);
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to reject participant: ${e.toString()}',
      ));
    }
  }

  // === Device Selection Events ===

  Future<void> _onSelectAudioDevice(
      SelectAudioDevice event, Emitter<InMeetingState> emit) async {
    try {
      await _mediaService.selectAudioDevice(event.deviceId);
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to select audio device: ${e.toString()}',
      ));
    }
  }

  Future<void> _onSelectVideoDevice(
      SelectVideoDevice event, Emitter<InMeetingState> emit) async {
    try {
      await _mediaService.selectVideoDevice(event.deviceId);
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to select video device: ${e.toString()}',
      ));
    }
  }

  // === UI State Events ===

  Future<void> _onToggleParticipantsPanel(
      ToggleParticipantsPanel event, Emitter<InMeetingState> emit) async {
    emit(state.copyWith(
      isParticipantsPanelOpen: !state.isParticipantsPanelOpen,
      // Close other panels when opening participants
      isChatPanelOpen:
          !state.isParticipantsPanelOpen ? false : state.isChatPanelOpen,
      isMoreOptionsOpen: false,
    ));
  }

  Future<void> _onToggleChatPanel(
      ToggleChatPanel event, Emitter<InMeetingState> emit) async {
    emit(state.copyWith(
      isChatPanelOpen: !state.isChatPanelOpen,
      // Close other panels when opening chat
      isParticipantsPanelOpen:
          !state.isChatPanelOpen ? false : state.isParticipantsPanelOpen,
      isMoreOptionsOpen: false,
    ));

    // Mark messages as read when opening chat
    if (!state.isChatPanelOpen && state.hasUnreadMessages) {
      add(const InMeetingEvent.markMessagesAsRead());
    }
  }

  Future<void> _onToggleMoreOptions(
      ToggleMoreOptions event, Emitter<InMeetingState> emit) async {
    emit(state.copyWith(
      isMoreOptionsOpen: !state.isMoreOptionsOpen,
    ));
  }

  // === Stream Update Events ===

  Future<void> _onConnectionStateChanged(
    ConnectionStateChanged event,
    Emitter<InMeetingState> emit,
  ) async {
    emit(state.copyWith(connectionState: event.state));
  }

  Future<void> _onParticipantsUpdated(
    ParticipantsUpdated event,
    Emitter<InMeetingState> emit,
  ) async {
    emit(state.copyWith(participants: event.participants));
  }

  Future<void> _onNetworkQualityChanged(
    NetworkQualityChanged event,
    Emitter<InMeetingState> emit,
  ) async {
    emit(state.copyWith(networkQuality: event.quality));
  }

  Future<void> _onMessagesUpdated(
    MessagesUpdated event,
    Emitter<InMeetingState> emit,
  ) async {
    emit(state.copyWith(messages: event.messages));
  }

  Future<void> _onUnreadCountUpdated(
    UnreadCountUpdated event,
    Emitter<InMeetingState> emit,
  ) async {
    emit(state.copyWith(unreadMessageCount: event.count));
  }

  // === Error Events ===

  Future<void> _onErrorOccurred(
      ErrorOccurred event, Emitter<InMeetingState> emit) async {
    emit(state.copyWith(errorMessage: event.message));
  }

  Future<void> _onClearError(
      ClearError event, Emitter<InMeetingState> emit) async {
    emit(state.copyWith(errorMessage: null));
  }

  // === Stream Management ===

  void _subscribeToStreams() {
    // Connection state stream
    _connectionStateSubscription =
        _connectionService.watchConnectionState().listen(
              (state) => add(InMeetingEvent.connectionStateChanged(state)),
              onError: (error) =>
                  add(InMeetingEvent.errorOccurred('Connection error: $error')),
            );

    // Participants stream
    _participantsSubscription = _connectionService.watchParticipants().listen(
          (participants) =>
              add(InMeetingEvent.participantsUpdated(participants)),
          onError: (error) =>
              add(InMeetingEvent.errorOccurred('Participants error: $error')),
        );

    // Network quality stream
    _networkQualitySubscription = _connectionService
        .watchNetworkQuality()
        .listen(
          (quality) => add(InMeetingEvent.networkQualityChanged(quality)),
          onError: (error) => add(
              InMeetingEvent.errorOccurred('Network quality error: $error')),
        );

    // Chat messages stream
    _messagesSubscription = _chatRepository.watchMessages().listen(
          (messages) => add(InMeetingEvent.messagesUpdated(messages)),
          onError: (error) =>
              add(InMeetingEvent.errorOccurred('Chat error: $error')),
        );

    // Unread count stream
    _unreadCountSubscription = _chatRepository.watchUnreadCount().listen(
          (count) => add(InMeetingEvent.unreadCountUpdated(count)),
          onError: (error) =>
              add(InMeetingEvent.errorOccurred('Unread count error: $error')),
        );
  }

  Future<void> _unsubscribeFromStreams() async {
    await _connectionStateSubscription?.cancel();
    await _participantsSubscription?.cancel();
    await _networkQualitySubscription?.cancel();
    await _messagesSubscription?.cancel();
    await _unreadCountSubscription?.cancel();

    _connectionStateSubscription = null;
    _participantsSubscription = null;
    _networkQualitySubscription = null;
    _messagesSubscription = null;
    _unreadCountSubscription = null;
  }

  @override
  Future<void> close() {
    _unsubscribeFromStreams();
    return super.close();
  }
}
