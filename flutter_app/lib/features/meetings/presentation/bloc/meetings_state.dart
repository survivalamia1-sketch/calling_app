import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/meeting.dart';

part 'meetings_state.freezed.dart';

@freezed
class MeetingsState with _$MeetingsState {
  const factory MeetingsState.initial() = Initial;

  const factory MeetingsState.loading() = Loading;

  const factory MeetingsState.loaded({
    required List<Meeting> meetings,
  }) = Loaded;

  const factory MeetingsState.meetingCreated({
    required Meeting meeting,
  }) = MeetingCreated;

  const factory MeetingsState.joinedMeeting({
    required String roomId,
  }) = JoinedMeeting;

  const factory MeetingsState.error(Failure failure) = Error;
}
