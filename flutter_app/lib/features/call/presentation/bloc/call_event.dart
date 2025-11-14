part of 'call_bloc.dart';

@freezed
class CallEvent with _$CallEvent {
  const factory CallEvent.joinCall({required String roomId}) = _JoinCall;
  const factory CallEvent.leaveCall() = _LeaveCall;
  const factory CallEvent.toggleAudio() = _ToggleAudio;
  const factory CallEvent.toggleVideo() = _ToggleVideo;
  const factory CallEvent.switchCamera() = _SwitchCamera;
  const factory CallEvent.updateCall({required Call call}) = _UpdateCall;
}
