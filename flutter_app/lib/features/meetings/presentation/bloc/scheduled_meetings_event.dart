import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/scheduled_meeting.dart';

part 'scheduled_meetings_event.freezed.dart';

/// Scheduled Meetings Events
@freezed
class ScheduledMeetingsEvent with _$ScheduledMeetingsEvent {
  /// Load scheduled meetings
  const factory ScheduledMeetingsEvent.loadScheduledMeetings({
    ScheduledMeetingStatus? status,
  }) = LoadScheduledMeetings;

  /// Refresh scheduled meetings
  const factory ScheduledMeetingsEvent.refreshScheduledMeetings() =
      RefreshScheduledMeetings;

  /// Delete scheduled meeting
  const factory ScheduledMeetingsEvent.deleteScheduledMeeting(String id) =
      DeleteScheduledMeeting;

  /// Start scheduled meeting
  const factory ScheduledMeetingsEvent.startScheduledMeeting(String id) =
      StartScheduledMeeting;

  /// Filter by status
  const factory ScheduledMeetingsEvent.filterByStatus(
      ScheduledMeetingStatus? status) = FilterByStatus;
}
