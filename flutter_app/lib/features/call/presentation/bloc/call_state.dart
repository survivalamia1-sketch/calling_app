part of 'call_bloc.dart';

@freezed
class CallState with _$CallState {
  const factory CallState.initial() = Initial;
  const factory CallState.connecting() = Connecting;
  const factory CallState.connected({
    required Call call,
    required RTCVideoRenderer localRenderer,
    required Map<String, RTCVideoRenderer> remoteRenderers,
  }) = Connected;
  const factory CallState.disconnected() = Disconnected;
  const factory CallState.error({required String message}) = Error;
}
