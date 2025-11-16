// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_meeting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InMeetingState {
// Connection state
  CallConnectionState get connectionState =>
      throw _privateConstructorUsedError; // Media states
  AudioState get audioState => throw _privateConstructorUsedError;
  VideoState get videoState => throw _privateConstructorUsedError;
  bool get isScreenSharing =>
      throw _privateConstructorUsedError; // Network and quality
  NetworkQuality get networkQuality =>
      throw _privateConstructorUsedError; // Participants
  List<Participant> get participants => throw _privateConstructorUsedError;
  String? get currentSpeakerId => throw _privateConstructorUsedError;
  String? get pinnedParticipantId => throw _privateConstructorUsedError; // Chat
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  int get unreadMessageCount => throw _privateConstructorUsedError; // Layout
  MeetingLayout get layout =>
      throw _privateConstructorUsedError; // Meeting info
  MeetingInfo? get meetingInfo =>
      throw _privateConstructorUsedError; // UI state
  bool get isParticipantsPanelOpen => throw _privateConstructorUsedError;
  bool get isChatPanelOpen => throw _privateConstructorUsedError;
  bool get isMoreOptionsOpen =>
      throw _privateConstructorUsedError; // Recording state
  bool get isRecording => throw _privateConstructorUsedError; // Error handling
  String? get errorMessage =>
      throw _privateConstructorUsedError; // Loading states for specific operations
  bool get isTogglingAudio => throw _privateConstructorUsedError;
  bool get isTogglingVideo => throw _privateConstructorUsedError;
  bool get isTogglingScreenShare => throw _privateConstructorUsedError;
  bool get isSendingMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InMeetingStateCopyWith<InMeetingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InMeetingStateCopyWith<$Res> {
  factory $InMeetingStateCopyWith(
          InMeetingState value, $Res Function(InMeetingState) then) =
      _$InMeetingStateCopyWithImpl<$Res, InMeetingState>;
  @useResult
  $Res call(
      {CallConnectionState connectionState,
      AudioState audioState,
      VideoState videoState,
      bool isScreenSharing,
      NetworkQuality networkQuality,
      List<Participant> participants,
      String? currentSpeakerId,
      String? pinnedParticipantId,
      List<ChatMessage> messages,
      int unreadMessageCount,
      MeetingLayout layout,
      MeetingInfo? meetingInfo,
      bool isParticipantsPanelOpen,
      bool isChatPanelOpen,
      bool isMoreOptionsOpen,
      bool isRecording,
      String? errorMessage,
      bool isTogglingAudio,
      bool isTogglingVideo,
      bool isTogglingScreenShare,
      bool isSendingMessage});
}

/// @nodoc
class _$InMeetingStateCopyWithImpl<$Res, $Val extends InMeetingState>
    implements $InMeetingStateCopyWith<$Res> {
  _$InMeetingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectionState = null,
    Object? audioState = null,
    Object? videoState = null,
    Object? isScreenSharing = null,
    Object? networkQuality = null,
    Object? participants = null,
    Object? currentSpeakerId = freezed,
    Object? pinnedParticipantId = freezed,
    Object? messages = null,
    Object? unreadMessageCount = null,
    Object? layout = null,
    Object? meetingInfo = freezed,
    Object? isParticipantsPanelOpen = null,
    Object? isChatPanelOpen = null,
    Object? isMoreOptionsOpen = null,
    Object? isRecording = null,
    Object? errorMessage = freezed,
    Object? isTogglingAudio = null,
    Object? isTogglingVideo = null,
    Object? isTogglingScreenShare = null,
    Object? isSendingMessage = null,
  }) {
    return _then(_value.copyWith(
      connectionState: null == connectionState
          ? _value.connectionState
          : connectionState // ignore: cast_nullable_to_non_nullable
              as CallConnectionState,
      audioState: null == audioState
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as AudioState,
      videoState: null == videoState
          ? _value.videoState
          : videoState // ignore: cast_nullable_to_non_nullable
              as VideoState,
      isScreenSharing: null == isScreenSharing
          ? _value.isScreenSharing
          : isScreenSharing // ignore: cast_nullable_to_non_nullable
              as bool,
      networkQuality: null == networkQuality
          ? _value.networkQuality
          : networkQuality // ignore: cast_nullable_to_non_nullable
              as NetworkQuality,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>,
      currentSpeakerId: freezed == currentSpeakerId
          ? _value.currentSpeakerId
          : currentSpeakerId // ignore: cast_nullable_to_non_nullable
              as String?,
      pinnedParticipantId: freezed == pinnedParticipantId
          ? _value.pinnedParticipantId
          : pinnedParticipantId // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      unreadMessageCount: null == unreadMessageCount
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as MeetingLayout,
      meetingInfo: freezed == meetingInfo
          ? _value.meetingInfo
          : meetingInfo // ignore: cast_nullable_to_non_nullable
              as MeetingInfo?,
      isParticipantsPanelOpen: null == isParticipantsPanelOpen
          ? _value.isParticipantsPanelOpen
          : isParticipantsPanelOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isChatPanelOpen: null == isChatPanelOpen
          ? _value.isChatPanelOpen
          : isChatPanelOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreOptionsOpen: null == isMoreOptionsOpen
          ? _value.isMoreOptionsOpen
          : isMoreOptionsOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isTogglingAudio: null == isTogglingAudio
          ? _value.isTogglingAudio
          : isTogglingAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      isTogglingVideo: null == isTogglingVideo
          ? _value.isTogglingVideo
          : isTogglingVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isTogglingScreenShare: null == isTogglingScreenShare
          ? _value.isTogglingScreenShare
          : isTogglingScreenShare // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendingMessage: null == isSendingMessage
          ? _value.isSendingMessage
          : isSendingMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InMeetingStateImplCopyWith<$Res>
    implements $InMeetingStateCopyWith<$Res> {
  factory _$$InMeetingStateImplCopyWith(_$InMeetingStateImpl value,
          $Res Function(_$InMeetingStateImpl) then) =
      __$$InMeetingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CallConnectionState connectionState,
      AudioState audioState,
      VideoState videoState,
      bool isScreenSharing,
      NetworkQuality networkQuality,
      List<Participant> participants,
      String? currentSpeakerId,
      String? pinnedParticipantId,
      List<ChatMessage> messages,
      int unreadMessageCount,
      MeetingLayout layout,
      MeetingInfo? meetingInfo,
      bool isParticipantsPanelOpen,
      bool isChatPanelOpen,
      bool isMoreOptionsOpen,
      bool isRecording,
      String? errorMessage,
      bool isTogglingAudio,
      bool isTogglingVideo,
      bool isTogglingScreenShare,
      bool isSendingMessage});
}

/// @nodoc
class __$$InMeetingStateImplCopyWithImpl<$Res>
    extends _$InMeetingStateCopyWithImpl<$Res, _$InMeetingStateImpl>
    implements _$$InMeetingStateImplCopyWith<$Res> {
  __$$InMeetingStateImplCopyWithImpl(
      _$InMeetingStateImpl _value, $Res Function(_$InMeetingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectionState = null,
    Object? audioState = null,
    Object? videoState = null,
    Object? isScreenSharing = null,
    Object? networkQuality = null,
    Object? participants = null,
    Object? currentSpeakerId = freezed,
    Object? pinnedParticipantId = freezed,
    Object? messages = null,
    Object? unreadMessageCount = null,
    Object? layout = null,
    Object? meetingInfo = freezed,
    Object? isParticipantsPanelOpen = null,
    Object? isChatPanelOpen = null,
    Object? isMoreOptionsOpen = null,
    Object? isRecording = null,
    Object? errorMessage = freezed,
    Object? isTogglingAudio = null,
    Object? isTogglingVideo = null,
    Object? isTogglingScreenShare = null,
    Object? isSendingMessage = null,
  }) {
    return _then(_$InMeetingStateImpl(
      connectionState: null == connectionState
          ? _value.connectionState
          : connectionState // ignore: cast_nullable_to_non_nullable
              as CallConnectionState,
      audioState: null == audioState
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as AudioState,
      videoState: null == videoState
          ? _value.videoState
          : videoState // ignore: cast_nullable_to_non_nullable
              as VideoState,
      isScreenSharing: null == isScreenSharing
          ? _value.isScreenSharing
          : isScreenSharing // ignore: cast_nullable_to_non_nullable
              as bool,
      networkQuality: null == networkQuality
          ? _value.networkQuality
          : networkQuality // ignore: cast_nullable_to_non_nullable
              as NetworkQuality,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>,
      currentSpeakerId: freezed == currentSpeakerId
          ? _value.currentSpeakerId
          : currentSpeakerId // ignore: cast_nullable_to_non_nullable
              as String?,
      pinnedParticipantId: freezed == pinnedParticipantId
          ? _value.pinnedParticipantId
          : pinnedParticipantId // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      unreadMessageCount: null == unreadMessageCount
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as MeetingLayout,
      meetingInfo: freezed == meetingInfo
          ? _value.meetingInfo
          : meetingInfo // ignore: cast_nullable_to_non_nullable
              as MeetingInfo?,
      isParticipantsPanelOpen: null == isParticipantsPanelOpen
          ? _value.isParticipantsPanelOpen
          : isParticipantsPanelOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isChatPanelOpen: null == isChatPanelOpen
          ? _value.isChatPanelOpen
          : isChatPanelOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreOptionsOpen: null == isMoreOptionsOpen
          ? _value.isMoreOptionsOpen
          : isMoreOptionsOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isTogglingAudio: null == isTogglingAudio
          ? _value.isTogglingAudio
          : isTogglingAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      isTogglingVideo: null == isTogglingVideo
          ? _value.isTogglingVideo
          : isTogglingVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isTogglingScreenShare: null == isTogglingScreenShare
          ? _value.isTogglingScreenShare
          : isTogglingScreenShare // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendingMessage: null == isSendingMessage
          ? _value.isSendingMessage
          : isSendingMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InMeetingStateImpl extends _InMeetingState {
  const _$InMeetingStateImpl(
      {this.connectionState = CallConnectionState.disconnected,
      this.audioState = AudioState.unmuted,
      this.videoState = VideoState.enabled,
      this.isScreenSharing = false,
      this.networkQuality =
          const NetworkQuality(level: NetworkQualityLevel.unknown),
      final List<Participant> participants = const [],
      this.currentSpeakerId,
      this.pinnedParticipantId,
      final List<ChatMessage> messages = const [],
      this.unreadMessageCount = 0,
      this.layout = MeetingLayout.gallery,
      this.meetingInfo,
      this.isParticipantsPanelOpen = false,
      this.isChatPanelOpen = false,
      this.isMoreOptionsOpen = false,
      this.isRecording = false,
      this.errorMessage,
      this.isTogglingAudio = false,
      this.isTogglingVideo = false,
      this.isTogglingScreenShare = false,
      this.isSendingMessage = false})
      : _participants = participants,
        _messages = messages,
        super._();

// Connection state
  @override
  @JsonKey()
  final CallConnectionState connectionState;
// Media states
  @override
  @JsonKey()
  final AudioState audioState;
  @override
  @JsonKey()
  final VideoState videoState;
  @override
  @JsonKey()
  final bool isScreenSharing;
// Network and quality
  @override
  @JsonKey()
  final NetworkQuality networkQuality;
// Participants
  final List<Participant> _participants;
// Participants
  @override
  @JsonKey()
  List<Participant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final String? currentSpeakerId;
  @override
  final String? pinnedParticipantId;
// Chat
  final List<ChatMessage> _messages;
// Chat
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final int unreadMessageCount;
// Layout
  @override
  @JsonKey()
  final MeetingLayout layout;
// Meeting info
  @override
  final MeetingInfo? meetingInfo;
// UI state
  @override
  @JsonKey()
  final bool isParticipantsPanelOpen;
  @override
  @JsonKey()
  final bool isChatPanelOpen;
  @override
  @JsonKey()
  final bool isMoreOptionsOpen;
// Recording state
  @override
  @JsonKey()
  final bool isRecording;
// Error handling
  @override
  final String? errorMessage;
// Loading states for specific operations
  @override
  @JsonKey()
  final bool isTogglingAudio;
  @override
  @JsonKey()
  final bool isTogglingVideo;
  @override
  @JsonKey()
  final bool isTogglingScreenShare;
  @override
  @JsonKey()
  final bool isSendingMessage;

  @override
  String toString() {
    return 'InMeetingState(connectionState: $connectionState, audioState: $audioState, videoState: $videoState, isScreenSharing: $isScreenSharing, networkQuality: $networkQuality, participants: $participants, currentSpeakerId: $currentSpeakerId, pinnedParticipantId: $pinnedParticipantId, messages: $messages, unreadMessageCount: $unreadMessageCount, layout: $layout, meetingInfo: $meetingInfo, isParticipantsPanelOpen: $isParticipantsPanelOpen, isChatPanelOpen: $isChatPanelOpen, isMoreOptionsOpen: $isMoreOptionsOpen, isRecording: $isRecording, errorMessage: $errorMessage, isTogglingAudio: $isTogglingAudio, isTogglingVideo: $isTogglingVideo, isTogglingScreenShare: $isTogglingScreenShare, isSendingMessage: $isSendingMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InMeetingStateImpl &&
            (identical(other.connectionState, connectionState) ||
                other.connectionState == connectionState) &&
            (identical(other.audioState, audioState) ||
                other.audioState == audioState) &&
            (identical(other.videoState, videoState) ||
                other.videoState == videoState) &&
            (identical(other.isScreenSharing, isScreenSharing) ||
                other.isScreenSharing == isScreenSharing) &&
            (identical(other.networkQuality, networkQuality) ||
                other.networkQuality == networkQuality) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.currentSpeakerId, currentSpeakerId) ||
                other.currentSpeakerId == currentSpeakerId) &&
            (identical(other.pinnedParticipantId, pinnedParticipantId) ||
                other.pinnedParticipantId == pinnedParticipantId) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.unreadMessageCount, unreadMessageCount) ||
                other.unreadMessageCount == unreadMessageCount) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.meetingInfo, meetingInfo) ||
                other.meetingInfo == meetingInfo) &&
            (identical(
                    other.isParticipantsPanelOpen, isParticipantsPanelOpen) ||
                other.isParticipantsPanelOpen == isParticipantsPanelOpen) &&
            (identical(other.isChatPanelOpen, isChatPanelOpen) ||
                other.isChatPanelOpen == isChatPanelOpen) &&
            (identical(other.isMoreOptionsOpen, isMoreOptionsOpen) ||
                other.isMoreOptionsOpen == isMoreOptionsOpen) &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isTogglingAudio, isTogglingAudio) ||
                other.isTogglingAudio == isTogglingAudio) &&
            (identical(other.isTogglingVideo, isTogglingVideo) ||
                other.isTogglingVideo == isTogglingVideo) &&
            (identical(other.isTogglingScreenShare, isTogglingScreenShare) ||
                other.isTogglingScreenShare == isTogglingScreenShare) &&
            (identical(other.isSendingMessage, isSendingMessage) ||
                other.isSendingMessage == isSendingMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        connectionState,
        audioState,
        videoState,
        isScreenSharing,
        networkQuality,
        const DeepCollectionEquality().hash(_participants),
        currentSpeakerId,
        pinnedParticipantId,
        const DeepCollectionEquality().hash(_messages),
        unreadMessageCount,
        layout,
        meetingInfo,
        isParticipantsPanelOpen,
        isChatPanelOpen,
        isMoreOptionsOpen,
        isRecording,
        errorMessage,
        isTogglingAudio,
        isTogglingVideo,
        isTogglingScreenShare,
        isSendingMessage
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InMeetingStateImplCopyWith<_$InMeetingStateImpl> get copyWith =>
      __$$InMeetingStateImplCopyWithImpl<_$InMeetingStateImpl>(
          this, _$identity);
}

abstract class _InMeetingState extends InMeetingState {
  const factory _InMeetingState(
      {final CallConnectionState connectionState,
      final AudioState audioState,
      final VideoState videoState,
      final bool isScreenSharing,
      final NetworkQuality networkQuality,
      final List<Participant> participants,
      final String? currentSpeakerId,
      final String? pinnedParticipantId,
      final List<ChatMessage> messages,
      final int unreadMessageCount,
      final MeetingLayout layout,
      final MeetingInfo? meetingInfo,
      final bool isParticipantsPanelOpen,
      final bool isChatPanelOpen,
      final bool isMoreOptionsOpen,
      final bool isRecording,
      final String? errorMessage,
      final bool isTogglingAudio,
      final bool isTogglingVideo,
      final bool isTogglingScreenShare,
      final bool isSendingMessage}) = _$InMeetingStateImpl;
  const _InMeetingState._() : super._();

  @override // Connection state
  CallConnectionState get connectionState;
  @override // Media states
  AudioState get audioState;
  @override
  VideoState get videoState;
  @override
  bool get isScreenSharing;
  @override // Network and quality
  NetworkQuality get networkQuality;
  @override // Participants
  List<Participant> get participants;
  @override
  String? get currentSpeakerId;
  @override
  String? get pinnedParticipantId;
  @override // Chat
  List<ChatMessage> get messages;
  @override
  int get unreadMessageCount;
  @override // Layout
  MeetingLayout get layout;
  @override // Meeting info
  MeetingInfo? get meetingInfo;
  @override // UI state
  bool get isParticipantsPanelOpen;
  @override
  bool get isChatPanelOpen;
  @override
  bool get isMoreOptionsOpen;
  @override // Recording state
  bool get isRecording;
  @override // Error handling
  String? get errorMessage;
  @override // Loading states for specific operations
  bool get isTogglingAudio;
  @override
  bool get isTogglingVideo;
  @override
  bool get isTogglingScreenShare;
  @override
  bool get isSendingMessage;
  @override
  @JsonKey(ignore: true)
  _$$InMeetingStateImplCopyWith<_$InMeetingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
