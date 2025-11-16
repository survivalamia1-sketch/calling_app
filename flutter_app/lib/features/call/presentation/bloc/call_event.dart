part of 'call_bloc.dart';

@freezed
class CallEvent with _$CallEvent {
  const factory CallEvent.joinCall({required String roomId}) = JoinCall;
  const factory CallEvent.leaveCall() = LeaveCall;
  const factory CallEvent.toggleAudio() = ToggleAudio;
  const factory CallEvent.toggleVideo() = ToggleVideo;
  const factory CallEvent.switchCamera() = SwitchCamera;
  const factory CallEvent.updateCall({required Call call}) = UpdateCall;
}
