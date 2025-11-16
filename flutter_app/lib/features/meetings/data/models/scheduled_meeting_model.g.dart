// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduledMeetingModel _$ScheduledMeetingModelFromJson(
        Map<String, dynamic> json) =>
    ScheduledMeetingModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      hostId: json['host_id'] as String,
      hostName: json['host_name'] as String,
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      maxParticipants: (json['max_participants'] as num?)?.toInt(),
      password: json['password'] as String?,
      requiresApproval: json['requires_approval'] as bool,
      waitingRoomEnabled: json['waiting_room_enabled'] as bool,
      allowJoinBeforeHost: json['allow_join_before_host'] as bool,
      muteOnEntry: json['mute_on_entry'] as bool,
      roomId: json['room_id'] as String?,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      invitedEmails: (json['invited_emails'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      meetingLink: json['meeting_link'] as String?,
      isRecurring: json['is_recurring'] as bool?,
      recurrencePattern: json['recurrence_pattern'] == null
          ? null
          : RecurrencePatternModel.fromJson(
              json['recurrence_pattern'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduledMeetingModelToJson(
        ScheduledMeetingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'host_id': instance.hostId,
      'host_name': instance.hostName,
      'scheduled_at': instance.scheduledAt.toIso8601String(),
      'duration_minutes': instance.durationMinutes,
      'max_participants': instance.maxParticipants,
      'password': instance.password,
      'requires_approval': instance.requiresApproval,
      'waiting_room_enabled': instance.waitingRoomEnabled,
      'allow_join_before_host': instance.allowJoinBeforeHost,
      'mute_on_entry': instance.muteOnEntry,
      'room_id': instance.roomId,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'invited_emails': instance.invitedEmails,
      'meeting_link': instance.meetingLink,
      'is_recurring': instance.isRecurring,
      'recurrence_pattern': instance.recurrencePattern?.toJson(),
    };

RecurrencePatternModel _$RecurrencePatternModelFromJson(
        Map<String, dynamic> json) =>
    RecurrencePatternModel(
      type: json['type'] as String,
      interval: (json['interval'] as num).toInt(),
      daysOfWeek: (json['days_of_week'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      occurrences: (json['occurrences'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RecurrencePatternModelToJson(
        RecurrencePatternModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'interval': instance.interval,
      'days_of_week': instance.daysOfWeek,
      'end_date': instance.endDate?.toIso8601String(),
      'occurrences': instance.occurrences,
    };
