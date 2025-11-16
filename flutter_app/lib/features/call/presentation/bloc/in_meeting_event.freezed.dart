// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_meeting_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InMeetingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InMeetingEventCopyWith<$Res> {
  factory $InMeetingEventCopyWith(
          InMeetingEvent value, $Res Function(InMeetingEvent) then) =
      _$InMeetingEventCopyWithImpl<$Res, InMeetingEvent>;
}

/// @nodoc
class _$InMeetingEventCopyWithImpl<$Res, $Val extends InMeetingEvent>
    implements $InMeetingEventCopyWith<$Res> {
  _$InMeetingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$JoinRoomImplCopyWith<$Res> {
  factory _$$JoinRoomImplCopyWith(
          _$JoinRoomImpl value, $Res Function(_$JoinRoomImpl) then) =
      __$$JoinRoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String roomId,
      String userId,
      String displayName,
      bool joinWithAudio,
      bool joinWithVideo,
      String? password});
}

/// @nodoc
class __$$JoinRoomImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$JoinRoomImpl>
    implements _$$JoinRoomImplCopyWith<$Res> {
  __$$JoinRoomImplCopyWithImpl(
      _$JoinRoomImpl _value, $Res Function(_$JoinRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? displayName = null,
    Object? joinWithAudio = null,
    Object? joinWithVideo = null,
    Object? password = freezed,
  }) {
    return _then(_$JoinRoomImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      joinWithAudio: null == joinWithAudio
          ? _value.joinWithAudio
          : joinWithAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      joinWithVideo: null == joinWithVideo
          ? _value.joinWithVideo
          : joinWithVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$JoinRoomImpl implements JoinRoom {
  const _$JoinRoomImpl(
      {required this.roomId,
      required this.userId,
      required this.displayName,
      this.joinWithAudio = true,
      this.joinWithVideo = true,
      this.password});

  @override
  final String roomId;
  @override
  final String userId;
  @override
  final String displayName;
  @override
  @JsonKey()
  final bool joinWithAudio;
  @override
  @JsonKey()
  final bool joinWithVideo;
  @override
  final String? password;

  @override
  String toString() {
    return 'InMeetingEvent.joinRoom(roomId: $roomId, userId: $userId, displayName: $displayName, joinWithAudio: $joinWithAudio, joinWithVideo: $joinWithVideo, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinRoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.joinWithAudio, joinWithAudio) ||
                other.joinWithAudio == joinWithAudio) &&
            (identical(other.joinWithVideo, joinWithVideo) ||
                other.joinWithVideo == joinWithVideo) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId, userId, displayName,
      joinWithAudio, joinWithVideo, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinRoomImplCopyWith<_$JoinRoomImpl> get copyWith =>
      __$$JoinRoomImplCopyWithImpl<_$JoinRoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return joinRoom(
        roomId, userId, displayName, joinWithAudio, joinWithVideo, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return joinRoom?.call(
        roomId, userId, displayName, joinWithAudio, joinWithVideo, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(
          roomId, userId, displayName, joinWithAudio, joinWithVideo, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return joinRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return joinRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(this);
    }
    return orElse();
  }
}

abstract class JoinRoom implements InMeetingEvent {
  const factory JoinRoom(
      {required final String roomId,
      required final String userId,
      required final String displayName,
      final bool joinWithAudio,
      final bool joinWithVideo,
      final String? password}) = _$JoinRoomImpl;

  String get roomId;
  String get userId;
  String get displayName;
  bool get joinWithAudio;
  bool get joinWithVideo;
  String? get password;
  @JsonKey(ignore: true)
  _$$JoinRoomImplCopyWith<_$JoinRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LeaveCallImplCopyWith<$Res> {
  factory _$$LeaveCallImplCopyWith(
          _$LeaveCallImpl value, $Res Function(_$LeaveCallImpl) then) =
      __$$LeaveCallImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LeaveCallImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$LeaveCallImpl>
    implements _$$LeaveCallImplCopyWith<$Res> {
  __$$LeaveCallImplCopyWithImpl(
      _$LeaveCallImpl _value, $Res Function(_$LeaveCallImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LeaveCallImpl implements LeaveCall {
  const _$LeaveCallImpl();

  @override
  String toString() {
    return 'InMeetingEvent.leaveCall()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LeaveCallImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return leaveCall();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return leaveCall?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (leaveCall != null) {
      return leaveCall();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return leaveCall(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return leaveCall?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (leaveCall != null) {
      return leaveCall(this);
    }
    return orElse();
  }
}

abstract class LeaveCall implements InMeetingEvent {
  const factory LeaveCall() = _$LeaveCallImpl;
}

/// @nodoc
abstract class _$$EndCallForAllImplCopyWith<$Res> {
  factory _$$EndCallForAllImplCopyWith(
          _$EndCallForAllImpl value, $Res Function(_$EndCallForAllImpl) then) =
      __$$EndCallForAllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EndCallForAllImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$EndCallForAllImpl>
    implements _$$EndCallForAllImplCopyWith<$Res> {
  __$$EndCallForAllImplCopyWithImpl(
      _$EndCallForAllImpl _value, $Res Function(_$EndCallForAllImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EndCallForAllImpl implements EndCallForAll {
  const _$EndCallForAllImpl();

  @override
  String toString() {
    return 'InMeetingEvent.endCallForAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EndCallForAllImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return endCallForAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return endCallForAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (endCallForAll != null) {
      return endCallForAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return endCallForAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return endCallForAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (endCallForAll != null) {
      return endCallForAll(this);
    }
    return orElse();
  }
}

abstract class EndCallForAll implements InMeetingEvent {
  const factory EndCallForAll() = _$EndCallForAllImpl;
}

/// @nodoc
abstract class _$$ToggleAudioImplCopyWith<$Res> {
  factory _$$ToggleAudioImplCopyWith(
          _$ToggleAudioImpl value, $Res Function(_$ToggleAudioImpl) then) =
      __$$ToggleAudioImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleAudioImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ToggleAudioImpl>
    implements _$$ToggleAudioImplCopyWith<$Res> {
  __$$ToggleAudioImplCopyWithImpl(
      _$ToggleAudioImpl _value, $Res Function(_$ToggleAudioImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleAudioImpl implements ToggleAudio {
  const _$ToggleAudioImpl();

  @override
  String toString() {
    return 'InMeetingEvent.toggleAudio()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleAudioImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return toggleAudio();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return toggleAudio?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (toggleAudio != null) {
      return toggleAudio();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return toggleAudio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return toggleAudio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (toggleAudio != null) {
      return toggleAudio(this);
    }
    return orElse();
  }
}

abstract class ToggleAudio implements InMeetingEvent {
  const factory ToggleAudio() = _$ToggleAudioImpl;
}

/// @nodoc
abstract class _$$ToggleVideoImplCopyWith<$Res> {
  factory _$$ToggleVideoImplCopyWith(
          _$ToggleVideoImpl value, $Res Function(_$ToggleVideoImpl) then) =
      __$$ToggleVideoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleVideoImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ToggleVideoImpl>
    implements _$$ToggleVideoImplCopyWith<$Res> {
  __$$ToggleVideoImplCopyWithImpl(
      _$ToggleVideoImpl _value, $Res Function(_$ToggleVideoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleVideoImpl implements ToggleVideo {
  const _$ToggleVideoImpl();

  @override
  String toString() {
    return 'InMeetingEvent.toggleVideo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleVideoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return toggleVideo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return toggleVideo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (toggleVideo != null) {
      return toggleVideo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return toggleVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return toggleVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (toggleVideo != null) {
      return toggleVideo(this);
    }
    return orElse();
  }
}

abstract class ToggleVideo implements InMeetingEvent {
  const factory ToggleVideo() = _$ToggleVideoImpl;
}

/// @nodoc
abstract class _$$SwitchCameraImplCopyWith<$Res> {
  factory _$$SwitchCameraImplCopyWith(
          _$SwitchCameraImpl value, $Res Function(_$SwitchCameraImpl) then) =
      __$$SwitchCameraImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchCameraImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$SwitchCameraImpl>
    implements _$$SwitchCameraImplCopyWith<$Res> {
  __$$SwitchCameraImplCopyWithImpl(
      _$SwitchCameraImpl _value, $Res Function(_$SwitchCameraImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchCameraImpl implements SwitchCamera {
  const _$SwitchCameraImpl();

  @override
  String toString() {
    return 'InMeetingEvent.switchCamera()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchCameraImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return switchCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return switchCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (switchCamera != null) {
      return switchCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return switchCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return switchCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (switchCamera != null) {
      return switchCamera(this);
    }
    return orElse();
  }
}

abstract class SwitchCamera implements InMeetingEvent {
  const factory SwitchCamera() = _$SwitchCameraImpl;
}

/// @nodoc
abstract class _$$ToggleScreenShareImplCopyWith<$Res> {
  factory _$$ToggleScreenShareImplCopyWith(_$ToggleScreenShareImpl value,
          $Res Function(_$ToggleScreenShareImpl) then) =
      __$$ToggleScreenShareImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleScreenShareImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ToggleScreenShareImpl>
    implements _$$ToggleScreenShareImplCopyWith<$Res> {
  __$$ToggleScreenShareImplCopyWithImpl(_$ToggleScreenShareImpl _value,
      $Res Function(_$ToggleScreenShareImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleScreenShareImpl implements ToggleScreenShare {
  const _$ToggleScreenShareImpl();

  @override
  String toString() {
    return 'InMeetingEvent.toggleScreenShare()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleScreenShareImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return toggleScreenShare();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return toggleScreenShare?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (toggleScreenShare != null) {
      return toggleScreenShare();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return toggleScreenShare(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return toggleScreenShare?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (toggleScreenShare != null) {
      return toggleScreenShare(this);
    }
    return orElse();
  }
}

abstract class ToggleScreenShare implements InMeetingEvent {
  const factory ToggleScreenShare() = _$ToggleScreenShareImpl;
}

/// @nodoc
abstract class _$$ChangeLayoutImplCopyWith<$Res> {
  factory _$$ChangeLayoutImplCopyWith(
          _$ChangeLayoutImpl value, $Res Function(_$ChangeLayoutImpl) then) =
      __$$ChangeLayoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MeetingLayout layout});
}

/// @nodoc
class __$$ChangeLayoutImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ChangeLayoutImpl>
    implements _$$ChangeLayoutImplCopyWith<$Res> {
  __$$ChangeLayoutImplCopyWithImpl(
      _$ChangeLayoutImpl _value, $Res Function(_$ChangeLayoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layout = null,
  }) {
    return _then(_$ChangeLayoutImpl(
      null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as MeetingLayout,
    ));
  }
}

/// @nodoc

class _$ChangeLayoutImpl implements ChangeLayout {
  const _$ChangeLayoutImpl(this.layout);

  @override
  final MeetingLayout layout;

  @override
  String toString() {
    return 'InMeetingEvent.changeLayout(layout: $layout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLayoutImpl &&
            (identical(other.layout, layout) || other.layout == layout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, layout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeLayoutImplCopyWith<_$ChangeLayoutImpl> get copyWith =>
      __$$ChangeLayoutImplCopyWithImpl<_$ChangeLayoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return changeLayout(layout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return changeLayout?.call(layout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (changeLayout != null) {
      return changeLayout(layout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return changeLayout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return changeLayout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (changeLayout != null) {
      return changeLayout(this);
    }
    return orElse();
  }
}

abstract class ChangeLayout implements InMeetingEvent {
  const factory ChangeLayout(final MeetingLayout layout) = _$ChangeLayoutImpl;

  MeetingLayout get layout;
  @JsonKey(ignore: true)
  _$$ChangeLayoutImplCopyWith<_$ChangeLayoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PinParticipantImplCopyWith<$Res> {
  factory _$$PinParticipantImplCopyWith(_$PinParticipantImpl value,
          $Res Function(_$PinParticipantImpl) then) =
      __$$PinParticipantImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? participantId});
}

/// @nodoc
class __$$PinParticipantImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$PinParticipantImpl>
    implements _$$PinParticipantImplCopyWith<$Res> {
  __$$PinParticipantImplCopyWithImpl(
      _$PinParticipantImpl _value, $Res Function(_$PinParticipantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = freezed,
  }) {
    return _then(_$PinParticipantImpl(
      freezed == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PinParticipantImpl implements PinParticipant {
  const _$PinParticipantImpl(this.participantId);

  @override
  final String? participantId;

  @override
  String toString() {
    return 'InMeetingEvent.pinParticipant(participantId: $participantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinParticipantImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, participantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PinParticipantImplCopyWith<_$PinParticipantImpl> get copyWith =>
      __$$PinParticipantImplCopyWithImpl<_$PinParticipantImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return pinParticipant(participantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return pinParticipant?.call(participantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (pinParticipant != null) {
      return pinParticipant(participantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return pinParticipant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return pinParticipant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (pinParticipant != null) {
      return pinParticipant(this);
    }
    return orElse();
  }
}

abstract class PinParticipant implements InMeetingEvent {
  const factory PinParticipant(final String? participantId) =
      _$PinParticipantImpl;

  String? get participantId;
  @JsonKey(ignore: true)
  _$$PinParticipantImplCopyWith<_$PinParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$SendMessageImpl(
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl implements SendMessage {
  const _$SendMessageImpl(this.content);

  @override
  final String content;

  @override
  String toString() {
    return 'InMeetingEvent.sendMessage(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return sendMessage(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return sendMessage?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class SendMessage implements InMeetingEvent {
  const factory SendMessage(final String content) = _$SendMessageImpl;

  String get content;
  @JsonKey(ignore: true)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendPrivateMessageImplCopyWith<$Res> {
  factory _$$SendPrivateMessageImplCopyWith(_$SendPrivateMessageImpl value,
          $Res Function(_$SendPrivateMessageImpl) then) =
      __$$SendPrivateMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content, String recipientId});
}

/// @nodoc
class __$$SendPrivateMessageImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$SendPrivateMessageImpl>
    implements _$$SendPrivateMessageImplCopyWith<$Res> {
  __$$SendPrivateMessageImplCopyWithImpl(_$SendPrivateMessageImpl _value,
      $Res Function(_$SendPrivateMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? recipientId = null,
  }) {
    return _then(_$SendPrivateMessageImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _value.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendPrivateMessageImpl implements SendPrivateMessage {
  const _$SendPrivateMessageImpl(
      {required this.content, required this.recipientId});

  @override
  final String content;
  @override
  final String recipientId;

  @override
  String toString() {
    return 'InMeetingEvent.sendPrivateMessage(content: $content, recipientId: $recipientId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPrivateMessageImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, recipientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPrivateMessageImplCopyWith<_$SendPrivateMessageImpl> get copyWith =>
      __$$SendPrivateMessageImplCopyWithImpl<_$SendPrivateMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return sendPrivateMessage(content, recipientId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return sendPrivateMessage?.call(content, recipientId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (sendPrivateMessage != null) {
      return sendPrivateMessage(content, recipientId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return sendPrivateMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return sendPrivateMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (sendPrivateMessage != null) {
      return sendPrivateMessage(this);
    }
    return orElse();
  }
}

abstract class SendPrivateMessage implements InMeetingEvent {
  const factory SendPrivateMessage(
      {required final String content,
      required final String recipientId}) = _$SendPrivateMessageImpl;

  String get content;
  String get recipientId;
  @JsonKey(ignore: true)
  _$$SendPrivateMessageImplCopyWith<_$SendPrivateMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkMessagesAsReadImplCopyWith<$Res> {
  factory _$$MarkMessagesAsReadImplCopyWith(_$MarkMessagesAsReadImpl value,
          $Res Function(_$MarkMessagesAsReadImpl) then) =
      __$$MarkMessagesAsReadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkMessagesAsReadImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$MarkMessagesAsReadImpl>
    implements _$$MarkMessagesAsReadImplCopyWith<$Res> {
  __$$MarkMessagesAsReadImplCopyWithImpl(_$MarkMessagesAsReadImpl _value,
      $Res Function(_$MarkMessagesAsReadImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MarkMessagesAsReadImpl implements MarkMessagesAsRead {
  const _$MarkMessagesAsReadImpl();

  @override
  String toString() {
    return 'InMeetingEvent.markMessagesAsRead()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarkMessagesAsReadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return markMessagesAsRead();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return markMessagesAsRead?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (markMessagesAsRead != null) {
      return markMessagesAsRead();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return markMessagesAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return markMessagesAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (markMessagesAsRead != null) {
      return markMessagesAsRead(this);
    }
    return orElse();
  }
}

abstract class MarkMessagesAsRead implements InMeetingEvent {
  const factory MarkMessagesAsRead() = _$MarkMessagesAsReadImpl;
}

/// @nodoc
abstract class _$$DeleteMessageImplCopyWith<$Res> {
  factory _$$DeleteMessageImplCopyWith(
          _$DeleteMessageImpl value, $Res Function(_$DeleteMessageImpl) then) =
      __$$DeleteMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String messageId});
}

/// @nodoc
class __$$DeleteMessageImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$DeleteMessageImpl>
    implements _$$DeleteMessageImplCopyWith<$Res> {
  __$$DeleteMessageImplCopyWithImpl(
      _$DeleteMessageImpl _value, $Res Function(_$DeleteMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
  }) {
    return _then(_$DeleteMessageImpl(
      null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteMessageImpl implements DeleteMessage {
  const _$DeleteMessageImpl(this.messageId);

  @override
  final String messageId;

  @override
  String toString() {
    return 'InMeetingEvent.deleteMessage(messageId: $messageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMessageImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMessageImplCopyWith<_$DeleteMessageImpl> get copyWith =>
      __$$DeleteMessageImplCopyWithImpl<_$DeleteMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return deleteMessage(messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return deleteMessage?.call(messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return deleteMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return deleteMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(this);
    }
    return orElse();
  }
}

abstract class DeleteMessage implements InMeetingEvent {
  const factory DeleteMessage(final String messageId) = _$DeleteMessageImpl;

  String get messageId;
  @JsonKey(ignore: true)
  _$$DeleteMessageImplCopyWith<_$DeleteMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MuteParticipantImplCopyWith<$Res> {
  factory _$$MuteParticipantImplCopyWith(_$MuteParticipantImpl value,
          $Res Function(_$MuteParticipantImpl) then) =
      __$$MuteParticipantImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String participantId});
}

/// @nodoc
class __$$MuteParticipantImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$MuteParticipantImpl>
    implements _$$MuteParticipantImplCopyWith<$Res> {
  __$$MuteParticipantImplCopyWithImpl(
      _$MuteParticipantImpl _value, $Res Function(_$MuteParticipantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
  }) {
    return _then(_$MuteParticipantImpl(
      null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MuteParticipantImpl implements MuteParticipant {
  const _$MuteParticipantImpl(this.participantId);

  @override
  final String participantId;

  @override
  String toString() {
    return 'InMeetingEvent.muteParticipant(participantId: $participantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MuteParticipantImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, participantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MuteParticipantImplCopyWith<_$MuteParticipantImpl> get copyWith =>
      __$$MuteParticipantImplCopyWithImpl<_$MuteParticipantImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return muteParticipant(participantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return muteParticipant?.call(participantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (muteParticipant != null) {
      return muteParticipant(participantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return muteParticipant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return muteParticipant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (muteParticipant != null) {
      return muteParticipant(this);
    }
    return orElse();
  }
}

abstract class MuteParticipant implements InMeetingEvent {
  const factory MuteParticipant(final String participantId) =
      _$MuteParticipantImpl;

  String get participantId;
  @JsonKey(ignore: true)
  _$$MuteParticipantImplCopyWith<_$MuteParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveParticipantImplCopyWith<$Res> {
  factory _$$RemoveParticipantImplCopyWith(_$RemoveParticipantImpl value,
          $Res Function(_$RemoveParticipantImpl) then) =
      __$$RemoveParticipantImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String participantId});
}

/// @nodoc
class __$$RemoveParticipantImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$RemoveParticipantImpl>
    implements _$$RemoveParticipantImplCopyWith<$Res> {
  __$$RemoveParticipantImplCopyWithImpl(_$RemoveParticipantImpl _value,
      $Res Function(_$RemoveParticipantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
  }) {
    return _then(_$RemoveParticipantImpl(
      null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveParticipantImpl implements RemoveParticipant {
  const _$RemoveParticipantImpl(this.participantId);

  @override
  final String participantId;

  @override
  String toString() {
    return 'InMeetingEvent.removeParticipant(participantId: $participantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveParticipantImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, participantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveParticipantImplCopyWith<_$RemoveParticipantImpl> get copyWith =>
      __$$RemoveParticipantImplCopyWithImpl<_$RemoveParticipantImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return removeParticipant(participantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return removeParticipant?.call(participantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (removeParticipant != null) {
      return removeParticipant(participantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return removeParticipant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return removeParticipant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (removeParticipant != null) {
      return removeParticipant(this);
    }
    return orElse();
  }
}

abstract class RemoveParticipant implements InMeetingEvent {
  const factory RemoveParticipant(final String participantId) =
      _$RemoveParticipantImpl;

  String get participantId;
  @JsonKey(ignore: true)
  _$$RemoveParticipantImplCopyWith<_$RemoveParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdmitParticipantImplCopyWith<$Res> {
  factory _$$AdmitParticipantImplCopyWith(_$AdmitParticipantImpl value,
          $Res Function(_$AdmitParticipantImpl) then) =
      __$$AdmitParticipantImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String participantId});
}

/// @nodoc
class __$$AdmitParticipantImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$AdmitParticipantImpl>
    implements _$$AdmitParticipantImplCopyWith<$Res> {
  __$$AdmitParticipantImplCopyWithImpl(_$AdmitParticipantImpl _value,
      $Res Function(_$AdmitParticipantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
  }) {
    return _then(_$AdmitParticipantImpl(
      null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AdmitParticipantImpl implements AdmitParticipant {
  const _$AdmitParticipantImpl(this.participantId);

  @override
  final String participantId;

  @override
  String toString() {
    return 'InMeetingEvent.admitParticipant(participantId: $participantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdmitParticipantImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, participantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdmitParticipantImplCopyWith<_$AdmitParticipantImpl> get copyWith =>
      __$$AdmitParticipantImplCopyWithImpl<_$AdmitParticipantImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return admitParticipant(participantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return admitParticipant?.call(participantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (admitParticipant != null) {
      return admitParticipant(participantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return admitParticipant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return admitParticipant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (admitParticipant != null) {
      return admitParticipant(this);
    }
    return orElse();
  }
}

abstract class AdmitParticipant implements InMeetingEvent {
  const factory AdmitParticipant(final String participantId) =
      _$AdmitParticipantImpl;

  String get participantId;
  @JsonKey(ignore: true)
  _$$AdmitParticipantImplCopyWith<_$AdmitParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectParticipantImplCopyWith<$Res> {
  factory _$$RejectParticipantImplCopyWith(_$RejectParticipantImpl value,
          $Res Function(_$RejectParticipantImpl) then) =
      __$$RejectParticipantImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String participantId});
}

/// @nodoc
class __$$RejectParticipantImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$RejectParticipantImpl>
    implements _$$RejectParticipantImplCopyWith<$Res> {
  __$$RejectParticipantImplCopyWithImpl(_$RejectParticipantImpl _value,
      $Res Function(_$RejectParticipantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
  }) {
    return _then(_$RejectParticipantImpl(
      null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectParticipantImpl implements RejectParticipant {
  const _$RejectParticipantImpl(this.participantId);

  @override
  final String participantId;

  @override
  String toString() {
    return 'InMeetingEvent.rejectParticipant(participantId: $participantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectParticipantImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, participantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectParticipantImplCopyWith<_$RejectParticipantImpl> get copyWith =>
      __$$RejectParticipantImplCopyWithImpl<_$RejectParticipantImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return rejectParticipant(participantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return rejectParticipant?.call(participantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (rejectParticipant != null) {
      return rejectParticipant(participantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return rejectParticipant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return rejectParticipant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (rejectParticipant != null) {
      return rejectParticipant(this);
    }
    return orElse();
  }
}

abstract class RejectParticipant implements InMeetingEvent {
  const factory RejectParticipant(final String participantId) =
      _$RejectParticipantImpl;

  String get participantId;
  @JsonKey(ignore: true)
  _$$RejectParticipantImplCopyWith<_$RejectParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectAudioDeviceImplCopyWith<$Res> {
  factory _$$SelectAudioDeviceImplCopyWith(_$SelectAudioDeviceImpl value,
          $Res Function(_$SelectAudioDeviceImpl) then) =
      __$$SelectAudioDeviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class __$$SelectAudioDeviceImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$SelectAudioDeviceImpl>
    implements _$$SelectAudioDeviceImplCopyWith<$Res> {
  __$$SelectAudioDeviceImplCopyWithImpl(_$SelectAudioDeviceImpl _value,
      $Res Function(_$SelectAudioDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_$SelectAudioDeviceImpl(
      null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectAudioDeviceImpl implements SelectAudioDevice {
  const _$SelectAudioDeviceImpl(this.deviceId);

  @override
  final String deviceId;

  @override
  String toString() {
    return 'InMeetingEvent.selectAudioDevice(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAudioDeviceImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAudioDeviceImplCopyWith<_$SelectAudioDeviceImpl> get copyWith =>
      __$$SelectAudioDeviceImplCopyWithImpl<_$SelectAudioDeviceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return selectAudioDevice(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return selectAudioDevice?.call(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (selectAudioDevice != null) {
      return selectAudioDevice(deviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return selectAudioDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return selectAudioDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (selectAudioDevice != null) {
      return selectAudioDevice(this);
    }
    return orElse();
  }
}

abstract class SelectAudioDevice implements InMeetingEvent {
  const factory SelectAudioDevice(final String deviceId) =
      _$SelectAudioDeviceImpl;

  String get deviceId;
  @JsonKey(ignore: true)
  _$$SelectAudioDeviceImplCopyWith<_$SelectAudioDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectVideoDeviceImplCopyWith<$Res> {
  factory _$$SelectVideoDeviceImplCopyWith(_$SelectVideoDeviceImpl value,
          $Res Function(_$SelectVideoDeviceImpl) then) =
      __$$SelectVideoDeviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class __$$SelectVideoDeviceImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$SelectVideoDeviceImpl>
    implements _$$SelectVideoDeviceImplCopyWith<$Res> {
  __$$SelectVideoDeviceImplCopyWithImpl(_$SelectVideoDeviceImpl _value,
      $Res Function(_$SelectVideoDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_$SelectVideoDeviceImpl(
      null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectVideoDeviceImpl implements SelectVideoDevice {
  const _$SelectVideoDeviceImpl(this.deviceId);

  @override
  final String deviceId;

  @override
  String toString() {
    return 'InMeetingEvent.selectVideoDevice(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectVideoDeviceImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectVideoDeviceImplCopyWith<_$SelectVideoDeviceImpl> get copyWith =>
      __$$SelectVideoDeviceImplCopyWithImpl<_$SelectVideoDeviceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return selectVideoDevice(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return selectVideoDevice?.call(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (selectVideoDevice != null) {
      return selectVideoDevice(deviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return selectVideoDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return selectVideoDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (selectVideoDevice != null) {
      return selectVideoDevice(this);
    }
    return orElse();
  }
}

abstract class SelectVideoDevice implements InMeetingEvent {
  const factory SelectVideoDevice(final String deviceId) =
      _$SelectVideoDeviceImpl;

  String get deviceId;
  @JsonKey(ignore: true)
  _$$SelectVideoDeviceImplCopyWith<_$SelectVideoDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleParticipantsPanelImplCopyWith<$Res> {
  factory _$$ToggleParticipantsPanelImplCopyWith(
          _$ToggleParticipantsPanelImpl value,
          $Res Function(_$ToggleParticipantsPanelImpl) then) =
      __$$ToggleParticipantsPanelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleParticipantsPanelImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ToggleParticipantsPanelImpl>
    implements _$$ToggleParticipantsPanelImplCopyWith<$Res> {
  __$$ToggleParticipantsPanelImplCopyWithImpl(
      _$ToggleParticipantsPanelImpl _value,
      $Res Function(_$ToggleParticipantsPanelImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleParticipantsPanelImpl implements ToggleParticipantsPanel {
  const _$ToggleParticipantsPanelImpl();

  @override
  String toString() {
    return 'InMeetingEvent.toggleParticipantsPanel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleParticipantsPanelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return toggleParticipantsPanel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return toggleParticipantsPanel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (toggleParticipantsPanel != null) {
      return toggleParticipantsPanel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return toggleParticipantsPanel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return toggleParticipantsPanel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (toggleParticipantsPanel != null) {
      return toggleParticipantsPanel(this);
    }
    return orElse();
  }
}

abstract class ToggleParticipantsPanel implements InMeetingEvent {
  const factory ToggleParticipantsPanel() = _$ToggleParticipantsPanelImpl;
}

/// @nodoc
abstract class _$$ToggleChatPanelImplCopyWith<$Res> {
  factory _$$ToggleChatPanelImplCopyWith(_$ToggleChatPanelImpl value,
          $Res Function(_$ToggleChatPanelImpl) then) =
      __$$ToggleChatPanelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleChatPanelImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ToggleChatPanelImpl>
    implements _$$ToggleChatPanelImplCopyWith<$Res> {
  __$$ToggleChatPanelImplCopyWithImpl(
      _$ToggleChatPanelImpl _value, $Res Function(_$ToggleChatPanelImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleChatPanelImpl implements ToggleChatPanel {
  const _$ToggleChatPanelImpl();

  @override
  String toString() {
    return 'InMeetingEvent.toggleChatPanel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleChatPanelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return toggleChatPanel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return toggleChatPanel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (toggleChatPanel != null) {
      return toggleChatPanel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return toggleChatPanel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return toggleChatPanel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (toggleChatPanel != null) {
      return toggleChatPanel(this);
    }
    return orElse();
  }
}

abstract class ToggleChatPanel implements InMeetingEvent {
  const factory ToggleChatPanel() = _$ToggleChatPanelImpl;
}

/// @nodoc
abstract class _$$ToggleMoreOptionsImplCopyWith<$Res> {
  factory _$$ToggleMoreOptionsImplCopyWith(_$ToggleMoreOptionsImpl value,
          $Res Function(_$ToggleMoreOptionsImpl) then) =
      __$$ToggleMoreOptionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleMoreOptionsImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ToggleMoreOptionsImpl>
    implements _$$ToggleMoreOptionsImplCopyWith<$Res> {
  __$$ToggleMoreOptionsImplCopyWithImpl(_$ToggleMoreOptionsImpl _value,
      $Res Function(_$ToggleMoreOptionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleMoreOptionsImpl implements ToggleMoreOptions {
  const _$ToggleMoreOptionsImpl();

  @override
  String toString() {
    return 'InMeetingEvent.toggleMoreOptions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleMoreOptionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return toggleMoreOptions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return toggleMoreOptions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (toggleMoreOptions != null) {
      return toggleMoreOptions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return toggleMoreOptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return toggleMoreOptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (toggleMoreOptions != null) {
      return toggleMoreOptions(this);
    }
    return orElse();
  }
}

abstract class ToggleMoreOptions implements InMeetingEvent {
  const factory ToggleMoreOptions() = _$ToggleMoreOptionsImpl;
}

/// @nodoc
abstract class _$$ConnectionStateChangedImplCopyWith<$Res> {
  factory _$$ConnectionStateChangedImplCopyWith(
          _$ConnectionStateChangedImpl value,
          $Res Function(_$ConnectionStateChangedImpl) then) =
      __$$ConnectionStateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CallConnectionState state});
}

/// @nodoc
class __$$ConnectionStateChangedImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ConnectionStateChangedImpl>
    implements _$$ConnectionStateChangedImplCopyWith<$Res> {
  __$$ConnectionStateChangedImplCopyWithImpl(
      _$ConnectionStateChangedImpl _value,
      $Res Function(_$ConnectionStateChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$ConnectionStateChangedImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as CallConnectionState,
    ));
  }
}

/// @nodoc

class _$ConnectionStateChangedImpl implements ConnectionStateChanged {
  const _$ConnectionStateChangedImpl(this.state);

  @override
  final CallConnectionState state;

  @override
  String toString() {
    return 'InMeetingEvent.connectionStateChanged(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionStateChangedImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionStateChangedImplCopyWith<_$ConnectionStateChangedImpl>
      get copyWith => __$$ConnectionStateChangedImplCopyWithImpl<
          _$ConnectionStateChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return connectionStateChanged(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return connectionStateChanged?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (connectionStateChanged != null) {
      return connectionStateChanged(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return connectionStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return connectionStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (connectionStateChanged != null) {
      return connectionStateChanged(this);
    }
    return orElse();
  }
}

abstract class ConnectionStateChanged implements InMeetingEvent {
  const factory ConnectionStateChanged(final CallConnectionState state) =
      _$ConnectionStateChangedImpl;

  CallConnectionState get state;
  @JsonKey(ignore: true)
  _$$ConnectionStateChangedImplCopyWith<_$ConnectionStateChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParticipantsUpdatedImplCopyWith<$Res> {
  factory _$$ParticipantsUpdatedImplCopyWith(_$ParticipantsUpdatedImpl value,
          $Res Function(_$ParticipantsUpdatedImpl) then) =
      __$$ParticipantsUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Participant> participants});
}

/// @nodoc
class __$$ParticipantsUpdatedImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ParticipantsUpdatedImpl>
    implements _$$ParticipantsUpdatedImplCopyWith<$Res> {
  __$$ParticipantsUpdatedImplCopyWithImpl(_$ParticipantsUpdatedImpl _value,
      $Res Function(_$ParticipantsUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participants = null,
  }) {
    return _then(_$ParticipantsUpdatedImpl(
      null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>,
    ));
  }
}

/// @nodoc

class _$ParticipantsUpdatedImpl implements ParticipantsUpdated {
  const _$ParticipantsUpdatedImpl(final List<Participant> participants)
      : _participants = participants;

  final List<Participant> _participants;
  @override
  List<Participant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'InMeetingEvent.participantsUpdated(participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantsUpdatedImpl &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_participants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantsUpdatedImplCopyWith<_$ParticipantsUpdatedImpl> get copyWith =>
      __$$ParticipantsUpdatedImplCopyWithImpl<_$ParticipantsUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return participantsUpdated(participants);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return participantsUpdated?.call(participants);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (participantsUpdated != null) {
      return participantsUpdated(participants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return participantsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return participantsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (participantsUpdated != null) {
      return participantsUpdated(this);
    }
    return orElse();
  }
}

abstract class ParticipantsUpdated implements InMeetingEvent {
  const factory ParticipantsUpdated(final List<Participant> participants) =
      _$ParticipantsUpdatedImpl;

  List<Participant> get participants;
  @JsonKey(ignore: true)
  _$$ParticipantsUpdatedImplCopyWith<_$ParticipantsUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkQualityChangedImplCopyWith<$Res> {
  factory _$$NetworkQualityChangedImplCopyWith(
          _$NetworkQualityChangedImpl value,
          $Res Function(_$NetworkQualityChangedImpl) then) =
      __$$NetworkQualityChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkQuality quality});
}

/// @nodoc
class __$$NetworkQualityChangedImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$NetworkQualityChangedImpl>
    implements _$$NetworkQualityChangedImplCopyWith<$Res> {
  __$$NetworkQualityChangedImplCopyWithImpl(_$NetworkQualityChangedImpl _value,
      $Res Function(_$NetworkQualityChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quality = null,
  }) {
    return _then(_$NetworkQualityChangedImpl(
      null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as NetworkQuality,
    ));
  }
}

/// @nodoc

class _$NetworkQualityChangedImpl implements NetworkQualityChanged {
  const _$NetworkQualityChangedImpl(this.quality);

  @override
  final NetworkQuality quality;

  @override
  String toString() {
    return 'InMeetingEvent.networkQualityChanged(quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkQualityChangedImpl &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkQualityChangedImplCopyWith<_$NetworkQualityChangedImpl>
      get copyWith => __$$NetworkQualityChangedImplCopyWithImpl<
          _$NetworkQualityChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return networkQualityChanged(quality);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return networkQualityChanged?.call(quality);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (networkQualityChanged != null) {
      return networkQualityChanged(quality);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return networkQualityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return networkQualityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (networkQualityChanged != null) {
      return networkQualityChanged(this);
    }
    return orElse();
  }
}

abstract class NetworkQualityChanged implements InMeetingEvent {
  const factory NetworkQualityChanged(final NetworkQuality quality) =
      _$NetworkQualityChangedImpl;

  NetworkQuality get quality;
  @JsonKey(ignore: true)
  _$$NetworkQualityChangedImplCopyWith<_$NetworkQualityChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessagesUpdatedImplCopyWith<$Res> {
  factory _$$MessagesUpdatedImplCopyWith(_$MessagesUpdatedImpl value,
          $Res Function(_$MessagesUpdatedImpl) then) =
      __$$MessagesUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatMessage> messages});
}

/// @nodoc
class __$$MessagesUpdatedImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$MessagesUpdatedImpl>
    implements _$$MessagesUpdatedImplCopyWith<$Res> {
  __$$MessagesUpdatedImplCopyWithImpl(
      _$MessagesUpdatedImpl _value, $Res Function(_$MessagesUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$MessagesUpdatedImpl(
      null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
    ));
  }
}

/// @nodoc

class _$MessagesUpdatedImpl implements MessagesUpdated {
  const _$MessagesUpdatedImpl(final List<ChatMessage> messages)
      : _messages = messages;

  final List<ChatMessage> _messages;
  @override
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'InMeetingEvent.messagesUpdated(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesUpdatedImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesUpdatedImplCopyWith<_$MessagesUpdatedImpl> get copyWith =>
      __$$MessagesUpdatedImplCopyWithImpl<_$MessagesUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return messagesUpdated(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return messagesUpdated?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (messagesUpdated != null) {
      return messagesUpdated(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return messagesUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return messagesUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (messagesUpdated != null) {
      return messagesUpdated(this);
    }
    return orElse();
  }
}

abstract class MessagesUpdated implements InMeetingEvent {
  const factory MessagesUpdated(final List<ChatMessage> messages) =
      _$MessagesUpdatedImpl;

  List<ChatMessage> get messages;
  @JsonKey(ignore: true)
  _$$MessagesUpdatedImplCopyWith<_$MessagesUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnreadCountUpdatedImplCopyWith<$Res> {
  factory _$$UnreadCountUpdatedImplCopyWith(_$UnreadCountUpdatedImpl value,
          $Res Function(_$UnreadCountUpdatedImpl) then) =
      __$$UnreadCountUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$UnreadCountUpdatedImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$UnreadCountUpdatedImpl>
    implements _$$UnreadCountUpdatedImplCopyWith<$Res> {
  __$$UnreadCountUpdatedImplCopyWithImpl(_$UnreadCountUpdatedImpl _value,
      $Res Function(_$UnreadCountUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$UnreadCountUpdatedImpl(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UnreadCountUpdatedImpl implements UnreadCountUpdated {
  const _$UnreadCountUpdatedImpl(this.count);

  @override
  final int count;

  @override
  String toString() {
    return 'InMeetingEvent.unreadCountUpdated(count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnreadCountUpdatedImpl &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnreadCountUpdatedImplCopyWith<_$UnreadCountUpdatedImpl> get copyWith =>
      __$$UnreadCountUpdatedImplCopyWithImpl<_$UnreadCountUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return unreadCountUpdated(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return unreadCountUpdated?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (unreadCountUpdated != null) {
      return unreadCountUpdated(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return unreadCountUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return unreadCountUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (unreadCountUpdated != null) {
      return unreadCountUpdated(this);
    }
    return orElse();
  }
}

abstract class UnreadCountUpdated implements InMeetingEvent {
  const factory UnreadCountUpdated(final int count) = _$UnreadCountUpdatedImpl;

  int get count;
  @JsonKey(ignore: true)
  _$$UnreadCountUpdatedImplCopyWith<_$UnreadCountUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorOccurredImplCopyWith<$Res> {
  factory _$$ErrorOccurredImplCopyWith(
          _$ErrorOccurredImpl value, $Res Function(_$ErrorOccurredImpl) then) =
      __$$ErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorOccurredImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ErrorOccurredImpl>
    implements _$$ErrorOccurredImplCopyWith<$Res> {
  __$$ErrorOccurredImplCopyWithImpl(
      _$ErrorOccurredImpl _value, $Res Function(_$ErrorOccurredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorOccurredImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorOccurredImpl implements ErrorOccurred {
  const _$ErrorOccurredImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'InMeetingEvent.errorOccurred(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorOccurredImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorOccurredImplCopyWith<_$ErrorOccurredImpl> get copyWith =>
      __$$ErrorOccurredImplCopyWithImpl<_$ErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return errorOccurred(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return errorOccurred?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class ErrorOccurred implements InMeetingEvent {
  const factory ErrorOccurred(final String message) = _$ErrorOccurredImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorOccurredImplCopyWith<_$ErrorOccurredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
          _$ClearErrorImpl value, $Res Function(_$ClearErrorImpl) then) =
      __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$InMeetingEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
      _$ClearErrorImpl _value, $Res Function(_$ClearErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearErrorImpl implements ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'InMeetingEvent.clearError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)
        joinRoom,
    required TResult Function() leaveCall,
    required TResult Function() endCallForAll,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function() toggleScreenShare,
    required TResult Function(MeetingLayout layout) changeLayout,
    required TResult Function(String? participantId) pinParticipant,
    required TResult Function(String content) sendMessage,
    required TResult Function(String content, String recipientId)
        sendPrivateMessage,
    required TResult Function() markMessagesAsRead,
    required TResult Function(String messageId) deleteMessage,
    required TResult Function(String participantId) muteParticipant,
    required TResult Function(String participantId) removeParticipant,
    required TResult Function(String participantId) admitParticipant,
    required TResult Function(String participantId) rejectParticipant,
    required TResult Function(String deviceId) selectAudioDevice,
    required TResult Function(String deviceId) selectVideoDevice,
    required TResult Function() toggleParticipantsPanel,
    required TResult Function() toggleChatPanel,
    required TResult Function() toggleMoreOptions,
    required TResult Function(CallConnectionState state) connectionStateChanged,
    required TResult Function(List<Participant> participants)
        participantsUpdated,
    required TResult Function(NetworkQuality quality) networkQualityChanged,
    required TResult Function(List<ChatMessage> messages) messagesUpdated,
    required TResult Function(int count) unreadCountUpdated,
    required TResult Function(String message) errorOccurred,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult? Function()? leaveCall,
    TResult? Function()? endCallForAll,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function()? toggleScreenShare,
    TResult? Function(MeetingLayout layout)? changeLayout,
    TResult? Function(String? participantId)? pinParticipant,
    TResult? Function(String content)? sendMessage,
    TResult? Function(String content, String recipientId)? sendPrivateMessage,
    TResult? Function()? markMessagesAsRead,
    TResult? Function(String messageId)? deleteMessage,
    TResult? Function(String participantId)? muteParticipant,
    TResult? Function(String participantId)? removeParticipant,
    TResult? Function(String participantId)? admitParticipant,
    TResult? Function(String participantId)? rejectParticipant,
    TResult? Function(String deviceId)? selectAudioDevice,
    TResult? Function(String deviceId)? selectVideoDevice,
    TResult? Function()? toggleParticipantsPanel,
    TResult? Function()? toggleChatPanel,
    TResult? Function()? toggleMoreOptions,
    TResult? Function(CallConnectionState state)? connectionStateChanged,
    TResult? Function(List<Participant> participants)? participantsUpdated,
    TResult? Function(NetworkQuality quality)? networkQualityChanged,
    TResult? Function(List<ChatMessage> messages)? messagesUpdated,
    TResult? Function(int count)? unreadCountUpdated,
    TResult? Function(String message)? errorOccurred,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, String userId, String displayName,
            bool joinWithAudio, bool joinWithVideo, String? password)?
        joinRoom,
    TResult Function()? leaveCall,
    TResult Function()? endCallForAll,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function()? toggleScreenShare,
    TResult Function(MeetingLayout layout)? changeLayout,
    TResult Function(String? participantId)? pinParticipant,
    TResult Function(String content)? sendMessage,
    TResult Function(String content, String recipientId)? sendPrivateMessage,
    TResult Function()? markMessagesAsRead,
    TResult Function(String messageId)? deleteMessage,
    TResult Function(String participantId)? muteParticipant,
    TResult Function(String participantId)? removeParticipant,
    TResult Function(String participantId)? admitParticipant,
    TResult Function(String participantId)? rejectParticipant,
    TResult Function(String deviceId)? selectAudioDevice,
    TResult Function(String deviceId)? selectVideoDevice,
    TResult Function()? toggleParticipantsPanel,
    TResult Function()? toggleChatPanel,
    TResult Function()? toggleMoreOptions,
    TResult Function(CallConnectionState state)? connectionStateChanged,
    TResult Function(List<Participant> participants)? participantsUpdated,
    TResult Function(NetworkQuality quality)? networkQualityChanged,
    TResult Function(List<ChatMessage> messages)? messagesUpdated,
    TResult Function(int count)? unreadCountUpdated,
    TResult Function(String message)? errorOccurred,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JoinRoom value) joinRoom,
    required TResult Function(LeaveCall value) leaveCall,
    required TResult Function(EndCallForAll value) endCallForAll,
    required TResult Function(ToggleAudio value) toggleAudio,
    required TResult Function(ToggleVideo value) toggleVideo,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(ToggleScreenShare value) toggleScreenShare,
    required TResult Function(ChangeLayout value) changeLayout,
    required TResult Function(PinParticipant value) pinParticipant,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendPrivateMessage value) sendPrivateMessage,
    required TResult Function(MarkMessagesAsRead value) markMessagesAsRead,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(MuteParticipant value) muteParticipant,
    required TResult Function(RemoveParticipant value) removeParticipant,
    required TResult Function(AdmitParticipant value) admitParticipant,
    required TResult Function(RejectParticipant value) rejectParticipant,
    required TResult Function(SelectAudioDevice value) selectAudioDevice,
    required TResult Function(SelectVideoDevice value) selectVideoDevice,
    required TResult Function(ToggleParticipantsPanel value)
        toggleParticipantsPanel,
    required TResult Function(ToggleChatPanel value) toggleChatPanel,
    required TResult Function(ToggleMoreOptions value) toggleMoreOptions,
    required TResult Function(ConnectionStateChanged value)
        connectionStateChanged,
    required TResult Function(ParticipantsUpdated value) participantsUpdated,
    required TResult Function(NetworkQualityChanged value)
        networkQualityChanged,
    required TResult Function(MessagesUpdated value) messagesUpdated,
    required TResult Function(UnreadCountUpdated value) unreadCountUpdated,
    required TResult Function(ErrorOccurred value) errorOccurred,
    required TResult Function(ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JoinRoom value)? joinRoom,
    TResult? Function(LeaveCall value)? leaveCall,
    TResult? Function(EndCallForAll value)? endCallForAll,
    TResult? Function(ToggleAudio value)? toggleAudio,
    TResult? Function(ToggleVideo value)? toggleVideo,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(ToggleScreenShare value)? toggleScreenShare,
    TResult? Function(ChangeLayout value)? changeLayout,
    TResult? Function(PinParticipant value)? pinParticipant,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult? Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(MuteParticipant value)? muteParticipant,
    TResult? Function(RemoveParticipant value)? removeParticipant,
    TResult? Function(AdmitParticipant value)? admitParticipant,
    TResult? Function(RejectParticipant value)? rejectParticipant,
    TResult? Function(SelectAudioDevice value)? selectAudioDevice,
    TResult? Function(SelectVideoDevice value)? selectVideoDevice,
    TResult? Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult? Function(ToggleChatPanel value)? toggleChatPanel,
    TResult? Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult? Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult? Function(ParticipantsUpdated value)? participantsUpdated,
    TResult? Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult? Function(MessagesUpdated value)? messagesUpdated,
    TResult? Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult? Function(ErrorOccurred value)? errorOccurred,
    TResult? Function(ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JoinRoom value)? joinRoom,
    TResult Function(LeaveCall value)? leaveCall,
    TResult Function(EndCallForAll value)? endCallForAll,
    TResult Function(ToggleAudio value)? toggleAudio,
    TResult Function(ToggleVideo value)? toggleVideo,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(ToggleScreenShare value)? toggleScreenShare,
    TResult Function(ChangeLayout value)? changeLayout,
    TResult Function(PinParticipant value)? pinParticipant,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendPrivateMessage value)? sendPrivateMessage,
    TResult Function(MarkMessagesAsRead value)? markMessagesAsRead,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(MuteParticipant value)? muteParticipant,
    TResult Function(RemoveParticipant value)? removeParticipant,
    TResult Function(AdmitParticipant value)? admitParticipant,
    TResult Function(RejectParticipant value)? rejectParticipant,
    TResult Function(SelectAudioDevice value)? selectAudioDevice,
    TResult Function(SelectVideoDevice value)? selectVideoDevice,
    TResult Function(ToggleParticipantsPanel value)? toggleParticipantsPanel,
    TResult Function(ToggleChatPanel value)? toggleChatPanel,
    TResult Function(ToggleMoreOptions value)? toggleMoreOptions,
    TResult Function(ConnectionStateChanged value)? connectionStateChanged,
    TResult Function(ParticipantsUpdated value)? participantsUpdated,
    TResult Function(NetworkQualityChanged value)? networkQualityChanged,
    TResult Function(MessagesUpdated value)? messagesUpdated,
    TResult Function(UnreadCountUpdated value)? unreadCountUpdated,
    TResult Function(ErrorOccurred value)? errorOccurred,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class ClearError implements InMeetingEvent {
  const factory ClearError() = _$ClearErrorImpl;
}
