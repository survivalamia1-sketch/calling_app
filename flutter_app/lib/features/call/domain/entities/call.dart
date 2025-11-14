import 'package:equatable/equatable.dart';

enum CallStatus {
  idle,
  connecting,
  connected,
  reconnecting,
  disconnected,
  ended,
}

enum CallType {
  audio,
  video,
}

class Call extends Equatable {
  final String roomId;
  final String meetingId;
  final CallStatus status;
  final CallType type;
  final bool isAudioEnabled;
  final bool isVideoEnabled;
  final List<CallParticipant> participants;
  final DateTime? startTime;
  final DateTime? endTime;

  const Call({
    required this.roomId,
    required this.meetingId,
    required this.status,
    required this.type,
    required this.isAudioEnabled,
    required this.isVideoEnabled,
    required this.participants,
    this.startTime,
    this.endTime,
  });

  Call copyWith({
    String? roomId,
    String? meetingId,
    CallStatus? status,
    CallType? type,
    bool? isAudioEnabled,
    bool? isVideoEnabled,
    List<CallParticipant>? participants,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return Call(
      roomId: roomId ?? this.roomId,
      meetingId: meetingId ?? this.meetingId,
      status: status ?? this.status,
      type: type ?? this.type,
      isAudioEnabled: isAudioEnabled ?? this.isAudioEnabled,
      isVideoEnabled: isVideoEnabled ?? this.isVideoEnabled,
      participants: participants ?? this.participants,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  List<Object?> get props => [
        roomId,
        meetingId,
        status,
        type,
        isAudioEnabled,
        isVideoEnabled,
        participants,
        startTime,
        endTime,
      ];
}

class CallParticipant extends Equatable {
  final String userId;
  final String name;
  final String? avatarUrl;
  final bool isAudioEnabled;
  final bool isVideoEnabled;
  final bool isScreenSharing;
  final DateTime joinedAt;

  const CallParticipant({
    required this.userId,
    required this.name,
    this.avatarUrl,
    required this.isAudioEnabled,
    required this.isVideoEnabled,
    required this.isScreenSharing,
    required this.joinedAt,
  });

  CallParticipant copyWith({
    String? userId,
    String? name,
    String? avatarUrl,
    bool? isAudioEnabled,
    bool? isVideoEnabled,
    bool? isScreenSharing,
    DateTime? joinedAt,
  }) {
    return CallParticipant(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isAudioEnabled: isAudioEnabled ?? this.isAudioEnabled,
      isVideoEnabled: isVideoEnabled ?? this.isVideoEnabled,
      isScreenSharing: isScreenSharing ?? this.isScreenSharing,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        name,
        avatarUrl,
        isAudioEnabled,
        isVideoEnabled,
        isScreenSharing,
        joinedAt,
      ];
}
