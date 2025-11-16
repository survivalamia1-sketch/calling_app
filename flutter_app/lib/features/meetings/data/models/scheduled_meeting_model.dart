import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/scheduled_meeting.dart';

part 'scheduled_meeting_model.g.dart';

/// Scheduled Meeting Model
///
/// Data layer model for scheduled meetings.
/// Handles JSON serialization/deserialization.
///
/// NO MOCK DATA - Only data from API
@JsonSerializable(explicitToJson: true)
class ScheduledMeetingModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'host_id')
  final String hostId;

  @JsonKey(name: 'host_name')
  final String hostName;

  @JsonKey(name: 'scheduled_at')
  final DateTime scheduledAt;

  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;

  @JsonKey(name: 'max_participants')
  final int? maxParticipants;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'requires_approval')
  final bool requiresApproval;

  @JsonKey(name: 'waiting_room_enabled')
  final bool waitingRoomEnabled;

  @JsonKey(name: 'allow_join_before_host')
  final bool allowJoinBeforeHost;

  @JsonKey(name: 'mute_on_entry')
  final bool muteOnEntry;

  @JsonKey(name: 'room_id')
  final String? roomId;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'invited_emails')
  final List<String>? invitedEmails;

  @JsonKey(name: 'meeting_link')
  final String? meetingLink;

  @JsonKey(name: 'is_recurring')
  final bool? isRecurring;

  @JsonKey(name: 'recurrence_pattern')
  final RecurrencePatternModel? recurrencePattern;

  const ScheduledMeetingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.hostId,
    required this.hostName,
    required this.scheduledAt,
    required this.durationMinutes,
    this.maxParticipants,
    this.password,
    required this.requiresApproval,
    required this.waitingRoomEnabled,
    required this.allowJoinBeforeHost,
    required this.muteOnEntry,
    this.roomId,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.invitedEmails,
    this.meetingLink,
    this.isRecurring,
    this.recurrencePattern,
  });

  factory ScheduledMeetingModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduledMeetingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduledMeetingModelToJson(this);

  /// Convert model to domain entity
  ScheduledMeeting toDomain() {
    return ScheduledMeeting(
      id: id,
      title: title,
      description: description,
      hostId: hostId,
      hostName: hostName,
      scheduledAt: scheduledAt,
      durationMinutes: durationMinutes,
      maxParticipants: maxParticipants,
      password: password,
      requiresApproval: requiresApproval,
      waitingRoomEnabled: waitingRoomEnabled,
      allowJoinBeforeHost: allowJoinBeforeHost,
      muteOnEntry: muteOnEntry,
      roomId: roomId,
      status: _parseStatus(status),
      createdAt: createdAt,
      updatedAt: updatedAt,
      invitedEmails: invitedEmails ?? [],
      meetingLink: meetingLink,
      isRecurring: isRecurring ?? false,
      recurrencePattern: recurrencePattern?.toDomain(),
    );
  }

  /// Create model from domain entity
  factory ScheduledMeetingModel.fromDomain(ScheduledMeeting meeting) {
    return ScheduledMeetingModel(
      id: meeting.id,
      title: meeting.title,
      description: meeting.description,
      hostId: meeting.hostId,
      hostName: meeting.hostName,
      scheduledAt: meeting.scheduledAt,
      durationMinutes: meeting.durationMinutes,
      maxParticipants: meeting.maxParticipants,
      password: meeting.password,
      requiresApproval: meeting.requiresApproval,
      waitingRoomEnabled: meeting.waitingRoomEnabled,
      allowJoinBeforeHost: meeting.allowJoinBeforeHost,
      muteOnEntry: meeting.muteOnEntry,
      roomId: meeting.roomId,
      status: _statusToString(meeting.status),
      createdAt: meeting.createdAt,
      updatedAt: meeting.updatedAt,
      invitedEmails: meeting.invitedEmails,
      meetingLink: meeting.meetingLink,
      isRecurring: meeting.isRecurring,
      recurrencePattern: meeting.recurrencePattern != null
          ? RecurrencePatternModel.fromDomain(meeting.recurrencePattern!)
          : null,
    );
  }

  static ScheduledMeetingStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
        return ScheduledMeetingStatus.scheduled;
      case 'in_progress':
      case 'inprogress':
      case 'active':
        return ScheduledMeetingStatus.inProgress;
      case 'ended':
      case 'completed':
        return ScheduledMeetingStatus.ended;
      case 'cancelled':
      case 'canceled':
        return ScheduledMeetingStatus.cancelled;
      default:
        return ScheduledMeetingStatus.scheduled;
    }
  }

  static String _statusToString(ScheduledMeetingStatus status) {
    switch (status) {
      case ScheduledMeetingStatus.scheduled:
        return 'scheduled';
      case ScheduledMeetingStatus.inProgress:
        return 'in_progress';
      case ScheduledMeetingStatus.ended:
        return 'ended';
      case ScheduledMeetingStatus.cancelled:
        return 'cancelled';
    }
  }
}

/// Recurrence Pattern Model
@JsonSerializable()
class RecurrencePatternModel {
  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'interval')
  final int interval;

  @JsonKey(name: 'days_of_week')
  final List<int>? daysOfWeek;

  @JsonKey(name: 'end_date')
  final DateTime? endDate;

  @JsonKey(name: 'occurrences')
  final int? occurrences;

  const RecurrencePatternModel({
    required this.type,
    required this.interval,
    this.daysOfWeek,
    this.endDate,
    this.occurrences,
  });

  factory RecurrencePatternModel.fromJson(Map<String, dynamic> json) =>
      _$RecurrencePatternModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecurrencePatternModelToJson(this);

  RecurrencePattern toDomain() {
    return RecurrencePattern(
      type: _parseRecurrenceType(type),
      interval: interval,
      daysOfWeek: daysOfWeek,
      endDate: endDate,
      occurrences: occurrences,
    );
  }

  factory RecurrencePatternModel.fromDomain(RecurrencePattern pattern) {
    return RecurrencePatternModel(
      type: _recurrenceTypeToString(pattern.type),
      interval: pattern.interval,
      daysOfWeek: pattern.daysOfWeek,
      endDate: pattern.endDate,
      occurrences: pattern.occurrences,
    );
  }

  static RecurrenceType _parseRecurrenceType(String type) {
    switch (type.toLowerCase()) {
      case 'daily':
        return RecurrenceType.daily;
      case 'weekly':
        return RecurrenceType.weekly;
      case 'monthly':
        return RecurrenceType.monthly;
      case 'yearly':
        return RecurrenceType.yearly;
      default:
        return RecurrenceType.daily;
    }
  }

  static String _recurrenceTypeToString(RecurrenceType type) {
    switch (type) {
      case RecurrenceType.daily:
        return 'daily';
      case RecurrenceType.weekly:
        return 'weekly';
      case RecurrenceType.monthly:
        return 'monthly';
      case RecurrenceType.yearly:
        return 'yearly';
    }
  }
}
