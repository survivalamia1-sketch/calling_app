import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/meeting.dart';

part 'meeting_model.g.dart';

@JsonSerializable()
class MeetingModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'room_code')
  final String roomCode;

  @JsonKey(name: 'host_id')
  final String hostId;

  @JsonKey(name: 'scheduled_at')
  final String scheduledAt;

  @JsonKey(name: 'duration')
  final int? duration;

  @JsonKey(name: 'max_participants')
  final int maxParticipants;

  @JsonKey(name: 'is_active')
  final bool isActive;

  @JsonKey(name: 'requires_approval')
  final bool requiresApproval;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'started_at')
  final String? startedAt;

  @JsonKey(name: 'ended_at')
  final String? endedAt;

  const MeetingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.roomCode,
    required this.hostId,
    required this.scheduledAt,
    this.duration,
    required this.maxParticipants,
    required this.isActive,
    required this.requiresApproval,
    required this.createdAt,
    this.startedAt,
    this.endedAt,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingModelToJson(this);

  Meeting toDomain() {
    return Meeting(
      id: id,
      title: title,
      description: description,
      roomCode: roomCode,
      hostId: hostId,
      scheduledAt: DateTime.parse(scheduledAt),
      duration: duration,
      maxParticipants: maxParticipants,
      isActive: isActive,
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
      roomCode: meeting.roomCode,
      hostId: meeting.hostId,
      scheduledAt: meeting.scheduledAt.toIso8601String(),
      duration: meeting.duration,
      maxParticipants: meeting.maxParticipants,
      isActive: meeting.isActive,
      requiresApproval: meeting.requiresApproval,
      createdAt: meeting.createdAt.toIso8601String(),
      startedAt: meeting.startedAt?.toIso8601String(),
      endedAt: meeting.endedAt?.toIso8601String(),
    );
  }
}
