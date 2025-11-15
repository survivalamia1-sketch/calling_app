// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingModel _$MeetingModelFromJson(Map<String, dynamic> json) => MeetingModel(
      id: json['id'] as String,
      title: json['name'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      hostId: json['host_id'] as String,
      scheduledAt: json['scheduled_at'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      maxParticipants: (json['max_participants'] as num).toInt(),
      requiresApproval: json['has_waiting_room'] as bool,
      isPasswordLocked: json['is_password_locked'] as bool,
      isRecording: json['is_recording'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      startedAt: json['started_at'] as String?,
      endedAt: json['ended_at'] as String?,
      recordingUrl: json['recording_url'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$MeetingModelToJson(MeetingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'description': instance.description,
      'status': instance.status,
      'host_id': instance.hostId,
      'scheduled_at': instance.scheduledAt,
      'duration': instance.duration,
      'max_participants': instance.maxParticipants,
      'has_waiting_room': instance.requiresApproval,
      'is_password_locked': instance.isPasswordLocked,
      'is_recording': instance.isRecording,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'started_at': instance.startedAt,
      'ended_at': instance.endedAt,
      'recording_url': instance.recordingUrl,
      'password': instance.password,
    };
