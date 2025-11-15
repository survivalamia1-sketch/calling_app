import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/meeting.dart';

part 'meeting_model.g.dart';

@JsonSerializable()
class MeetingModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name') // Backend uses 'name', not 'title'
  final String title;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'status') // Backend uses 'status' (string)
  final String status;

  @JsonKey(name: 'host_id')
  final String hostId;

  @JsonKey(name: 'scheduled_at')
  final String? scheduledAt;

  @JsonKey(name: 'duration')
  final int? duration;

  @JsonKey(name: 'max_participants')
  final int maxParticipants;

  @JsonKey(name: 'has_waiting_room') // Backend uses 'has_waiting_room', not 'requires_approval'
  final bool requiresApproval;

  @JsonKey(name: 'is_password_locked')
  final bool isPasswordLocked;

  @JsonKey(name: 'is_recording')
  final bool isRecording;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'started_at')
  final String? startedAt;

  @JsonKey(name: 'ended_at')
  final String? endedAt;

  @JsonKey(name: 'recording_url')
  final String? recordingUrl;

  @JsonKey(name: 'password')
  final String? password;

  const MeetingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.hostId,
    this.scheduledAt,
    this.duration,
    required this.maxParticipants,
    required this.requiresApproval,
    required this.isPasswordLocked,
    required this.isRecording,
    required this.createdAt,
    required this.updatedAt,
    this.startedAt,
    this.endedAt,
    this.recordingUrl,
    this.password,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingModelToJson(this);

  Meeting toDomain() {
    return Meeting(
      id: id,
      title: title,
      description: description,
      roomCode: id, // Use room ID as room code
      hostId: hostId,
      scheduledAt: scheduledAt != null
          ? DateTime.parse(scheduledAt!)
          : DateTime.now(),
      duration: duration,
      maxParticipants: maxParticipants,
      isActive: status == 'active' || status == 'waiting', // Convert status to isActive
      requiresApproval: requiresApproval,
      createdAt: DateTime.parse(createdAt),
      startedAt: startedAt != null ? DateTime.parse(startedAt!) : null,
      endedAt: endedAt != null ? DateTime.parse(endedAt!) : null,
    );
  }

  factory MeetingModel.fromDomain(Meeting meeting) {
    return MeetingModel(
      id: meeting.id,
      title: meeting.title,
      description: meeting.description,
      status: meeting.isActive ? 'active' : 'ended',
      hostId: meeting.hostId,
      scheduledAt: meeting.scheduledAt.toIso8601String(),
      duration: meeting.duration,
      maxParticipants: meeting.maxParticipants,
      requiresApproval: meeting.requiresApproval,
      isPasswordLocked: false,
      isRecording: false,
      createdAt: meeting.createdAt.toIso8601String(),
      updatedAt: meeting.createdAt.toIso8601String(),
      startedAt: meeting.startedAt?.toIso8601String(),
      endedAt: meeting.endedAt?.toIso8601String(),
      recordingUrl: null,
      password: null,
    );
  }
}
