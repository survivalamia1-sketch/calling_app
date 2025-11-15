import 'package:freezed_annotation/freezed_annotation.dart';

part 'meetings_event.freezed.dart';

@freezed
class MeetingsEvent with _$MeetingsEvent {
  const factory MeetingsEvent.loadMeetings({
    String? status,
  }) = LoadMeetings;

  const factory MeetingsEvent.createMeeting({
    required String title,
    required String description,
    required DateTime scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  }) = CreateMeeting;

  const factory MeetingsEvent.joinMeeting({
    required String roomCode,
  }) = JoinMeeting;

  const factory MeetingsEvent.deleteMeeting({
    required String id,
  }) = DeleteMeeting;

  const factory MeetingsEvent.refreshMeetings() = RefreshMeetings;
}
