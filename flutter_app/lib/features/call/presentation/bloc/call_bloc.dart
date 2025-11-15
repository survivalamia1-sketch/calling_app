import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/services/webrtc_service.dart';
import '../../domain/entities/call.dart';
import '../../domain/repositories/call_repository.dart';
import '../../domain/usecases/join_call.dart';
import '../../domain/usecases/leave_call.dart';
import '../../domain/usecases/switch_camera.dart';
import '../../domain/usecases/toggle_audio.dart';
import '../../domain/usecases/toggle_video.dart';

part 'call_bloc.freezed.dart';
part 'call_event.dart';
part 'call_state.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  final JoinCall joinCall;
  final LeaveCall leaveCall;
  final ToggleAudio toggleAudio;
  final ToggleVideo toggleVideo;
  final SwitchCamera switchCamera;
  final CallRepository repository;
  final WebRTCService webrtcService;

  StreamSubscription<Call>? _callSubscription;
  StreamSubscription<MediaStream>? _localStreamSubscription;
  StreamSubscription<Map<String, MediaStream>>? _remoteStreamsSubscription;

  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final Map<String, RTCVideoRenderer> _remoteRenderers = {};

  CallBloc({
    required this.joinCall,
    required this.leaveCall,
    required this.toggleAudio,
    required this.toggleVideo,
    required this.switchCamera,
    required this.repository,
    required this.webrtcService,
  }) : super(const CallState.initial()) {
    on<_JoinCall>(_onJoinCall);
    on<_LeaveCall>(_onLeaveCall);
    on<_ToggleAudio>(_onToggleAudio);
    on<_ToggleVideo>(_onToggleVideo);
    on<_SwitchCamera>(_onSwitchCamera);
    on<_UpdateCall>(_onUpdateCall);

    _initializeRenderers();
  }

  Future<void> _initializeRenderers() async {
    await _localRenderer.initialize();
  }

  Future<void> _onJoinCall(
    _JoinCall event,
    Emitter<CallState> emit,
  ) async {
    emit(const CallState.connecting());

    final result = await joinCall(JoinCallParams(roomId: event.roomId));

    result.fold(
      (failure) => emit(CallState.error(
        message: failure.message,
      )),
      (call) {
        // Listen to call updates
        _callSubscription = repository.callStream.listen((updatedCall) {
          add(CallEvent.updateCall(call: updatedCall));
        });

        // Listen to local stream
        _localStreamSubscription = webrtcService.localStream.listen((stream) {
          _localRenderer.srcObject = stream;
        });

        // Listen to remote streams
        _remoteStreamsSubscription =
            webrtcService.remoteStreams.listen((streams) async {
          // Dispose old renderers that are no longer needed
          final oldStreamIds = _remoteRenderers.keys.toSet();
          final newStreamIds = streams.keys.toSet();
          final removedStreamIds = oldStreamIds.difference(newStreamIds);

          for (var streamId in removedStreamIds) {
            await _remoteRenderers[streamId]?.dispose();
            _remoteRenderers.remove(streamId);
          }

          // Add new renderers
          for (var entry in streams.entries) {
            if (!_remoteRenderers.containsKey(entry.key)) {
              final renderer = RTCVideoRenderer();
              await renderer.initialize();
              renderer.srcObject = entry.value;
              _remoteRenderers[entry.key] = renderer;
            }
          }

          // Emit updated state with renderers
          if (state is _Connected) {
            emit(CallState.connected(
              call: call,
              localRenderer: _localRenderer,
              remoteRenderers: Map.from(_remoteRenderers),
            ));
          }
        });

        // Set initial local stream if available
        if (webrtcService.currentLocalStream != null) {
          _localRenderer.srcObject = webrtcService.currentLocalStream;
        }

        emit(CallState.connected(
          call: call,
          localRenderer: _localRenderer,
          remoteRenderers: Map.from(_remoteRenderers),
        ));
      },
    );
  }

  Future<void> _onLeaveCall(
    _LeaveCall event,
    Emitter<CallState> emit,
  ) async {
    final result = await leaveCall(NoParams());

    result.fold(
      (failure) => emit(CallState.error(
        message: failure.message,
      )),
      (_) {
        _cleanup();
        emit(const CallState.disconnected());
      },
    );
  }

  Future<void> _onToggleAudio(
    _ToggleAudio event,
    Emitter<CallState> emit,
  ) async {
    if (state is! _Connected) return;

    final currentState = state as _Connected;
    final currentAudioState = currentState.call.isAudioEnabled;

    final result = await toggleAudio(
      ToggleAudioParams(enable: !currentAudioState),
    );

    result.fold(
      (failure) => emit(CallState.error(
        message: failure.message,
      )),
      (_) {
        // State will be updated via call stream
      },
    );
  }

  Future<void> _onToggleVideo(
    _ToggleVideo event,
    Emitter<CallState> emit,
  ) async {
    if (state is! _Connected) return;

    final currentState = state as _Connected;
    final currentVideoState = currentState.call.isVideoEnabled;

    final result = await toggleVideo(
      ToggleVideoParams(enable: !currentVideoState),
    );

    result.fold(
      (failure) => emit(CallState.error(
        message: failure.message,
      )),
      (_) {
        // State will be updated via call stream
      },
    );
  }

  Future<void> _onSwitchCamera(
    _SwitchCamera event,
    Emitter<CallState> emit,
  ) async {
    final result = await switchCamera(NoParams());

    result.fold(
      (failure) => emit(CallState.error(
        message: failure.message,
      )),
      (_) {
        // Camera switched successfully
      },
    );
  }

  void _onUpdateCall(
    _UpdateCall event,
    Emitter<CallState> emit,
  ) {
    if (state is _Connected) {
      final currentState = state as _Connected;
      emit(CallState.connected(
        call: event.call,
        localRenderer: currentState.localRenderer,
        remoteRenderers: currentState.remoteRenderers,
      ));
    }
  }

  void _cleanup() {
    _callSubscription?.cancel();
    _localStreamSubscription?.cancel();
    _remoteStreamsSubscription?.cancel();

    _localRenderer.srcObject = null;
    _localRenderer.dispose();

    for (var renderer in _remoteRenderers.values) {
      renderer.srcObject = null;
      renderer.dispose();
    }
    _remoteRenderers.clear();
  }

  @override
  Future<void> close() {
    _cleanup();
    return super.close();
  }
}
