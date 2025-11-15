// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingModel _$MeetingModelFromJson(Map<String, dynamic> json) => MeetingModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      roomCode: json['room_code'] as String,
      hostId: json['host_id'] as String,
      scheduledAt: json['scheduled_at'] as String,
      duration: (json['duration'] as num?)?.toInt(),
      maxParticipants: (json['max_participants'] as num).toInt(),
      isActive: json['is_active'] as bool,
      requiresApproval: json['requires_approval'] as bool,
      createdAt: json['created_at'] as String,
      startedAt: json['started_at'] as String?,
      endedAt: json['ended_at'] as String?,
    );

Map<String, dynamic> _$MeetingModelToJson(MeetingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'room_code': instance.roomCode,
      'host_id': instance.hostId,
      'scheduled_at': instance.scheduledAt,
      'duration': instance.duration,
      'max_participants': instance.maxParticipants,
      'is_active': instance.isActive,
      'requires_approval': instance.requiresApproval,
      'created_at': instance.createdAt,
      'started_at': instance.startedAt,
      'ended_at': instance.endedAt,
    };
