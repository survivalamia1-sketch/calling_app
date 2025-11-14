part of 'call_bloc.dart';

@freezed
class CallState with _$CallState {
  const factory CallState.initial() = _Initial;
  const factory CallState.connecting() = _Connecting;
  const factory CallState.connected({
    required Call call,
    required RTCVideoRenderer localRenderer,
    required Map<String, RTCVideoRenderer> remoteRenderers,
  }) = _Connected;
  const factory CallState.disconnected() = _Disconnected;
  const factory CallState.error({required String message}) = _Error;
}
