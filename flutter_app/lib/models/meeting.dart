class Meeting {
  final String id;
  final String name;
  final String hostId;
  final String? hostEmail;
  final String? hostName;
  final String status;
  final int participantCount;
  final int maxParticipants;
  final bool isRecording;
  final String? meetingCode;
  final String? password;
  final DateTime? scheduledAt;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final DateTime createdAt;

  Meeting({
    required this.id,
    required this.name,
    required this.hostId,
    this.hostEmail,
    this.hostName,
    required this.status,
    required this.participantCount,
    required this.maxParticipants,
    required this.isRecording,
    this.meetingCode,
    this.password,
    this.scheduledAt,
    this.startedAt,
    this.endedAt,
    required this.createdAt,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      id: json['id'],
      name: json['name'],
      hostId: json['host_id'],
      hostEmail: json['host_email'],
      hostName: json['host_name'],
      status: json['status'],
      participantCount: json['participant_count'] ?? 0,
      maxParticipants: json['max_participants'] ?? 3,
      isRecording: json['is_recording'] ?? false,
      meetingCode: json['meeting_code'],
      password: json['password'],
      scheduledAt: json['scheduled_at'] != null
          ? DateTime.parse(json['scheduled_at'])
          : null,
      startedAt: json['started_at'] != null
          ? DateTime.parse(json['started_at'])
          : null,
      endedAt: json['ended_at'] != null ? DateTime.parse(json['ended_at']) : null,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  bool get isScheduled => status == 'scheduled';
  bool get isActive => status == 'active';
  bool get isEnded => status == 'ended';
  bool get isWaiting => status == 'waiting';

  bool get isFull => participantCount >= maxParticipants;

  String get joinUrl => 'callingapp://join/$meetingCode';

  Duration? get duration {
    if (startedAt == null) return null;
    final end = endedAt ?? DateTime.now();
    return end.difference(startedAt!);
  }

  String? get formattedDuration {
    final dur = duration;
    if (dur == null) return null;

    final hours = dur.inHours;
    final minutes = dur.inMinutes.remainder(60);
    final seconds = dur.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }
}

class Participant {
  final String id;
  final String userId;
  final String name;
  final String? email;
  final bool isHost;
  final bool isMuted;
  final bool isVideoEnabled;
  final bool isScreenSharing;
  final DateTime joinedAt;
  final DateTime? leftAt;

  Participant({
    required this.id,
    required this.userId,
    required this.name,
    this.email,
    required this.isHost,
    required this.isMuted,
    required this.isVideoEnabled,
    required this.isScreenSharing,
    required this.joinedAt,
    this.leftAt,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      isHost: json['is_host'] ?? false,
      isMuted: json['is_muted'] ?? false,
      isVideoEnabled: json['is_video_enabled'] ?? true,
      isScreenSharing: json['is_screen_sharing'] ?? false,
      joinedAt: DateTime.parse(json['joined_at']),
      leftAt: json['left_at'] != null ? DateTime.parse(json['left_at']) : null,
    );
  }

  bool get isActive => leftAt == null;
}
