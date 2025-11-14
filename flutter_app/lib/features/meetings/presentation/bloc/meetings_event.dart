import 'package:freezed_annotation/freezed_annotation.dart';

part 'meetings_event.freezed.dart';

@freezed
class MeetingsEvent with _$MeetingsEvent {
  const factory MeetingsEvent.loadMeetings({
    String? status,
  }) = _LoadMeetings;

  const factory MeetingsEvent.createMeeting({
    required String title,
    required String description,
    required DateTime scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  }) = _CreateMeeting;

  const factory MeetingsEvent.joinMeeting({
    required String roomCode,
  }) = _JoinMeeting;

  const factory MeetingsEvent.deleteMeeting({
    required String id,
  }) = _DeleteMeeting;

  const factory MeetingsEvent.refreshMeetings() = _RefreshMeetings;
}
