import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/meeting.dart';

part 'meetings_state.freezed.dart';

@freezed
class MeetingsState with _$MeetingsState {
  const factory MeetingsState.initial() = _Initial;

  const factory MeetingsState.loading() = _Loading;

  const factory MeetingsState.loaded({
    required List<Meeting> meetings,
  }) = _Loaded;

  const factory MeetingsState.meetingCreated({
    required Meeting meeting,
  }) = _MeetingCreated;

  const factory MeetingsState.joinedMeeting({
    required String roomId,
  }) = _JoinedMeeting;

  const factory MeetingsState.error(Failure failure) = _Error;
}
