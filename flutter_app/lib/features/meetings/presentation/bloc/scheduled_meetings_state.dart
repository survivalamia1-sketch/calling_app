import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/scheduled_meeting.dart';

part 'scheduled_meetings_state.freezed.dart';

/// Scheduled Meetings State
@freezed
class ScheduledMeetingsState with _$ScheduledMeetingsState {
  const factory ScheduledMeetingsState.initial() = Initial;

  const factory ScheduledMeetingsState.loading() = Loading;

  const factory ScheduledMeetingsState.loaded({
    required List<ScheduledMeeting> meetings,
    ScheduledMeetingStatus? filter,
  }) = Loaded;

  const factory ScheduledMeetingsState.empty() = Empty;

  const factory ScheduledMeetingsState.error(String message) = Error;

  const factory ScheduledMeetingsState.deleting(String meetingId) = Deleting;

  const factory ScheduledMeetingsState.starting(String meetingId) = Starting;
}
