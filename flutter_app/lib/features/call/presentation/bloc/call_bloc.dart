import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/services/webrtc_service.dart';
import '../../domain/entities/call.dart';
import '../../domain/repositories/call_repository.dart';

part 'call_bloc.freezed.dart';
part 'call_event.dart';
part 'call_state.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  final CallRepository repository;
  final WebRTCService webrtcService;

  StreamSubscription<Call>? _callSubscription;
  StreamSubscription<MediaStream>? _localStreamSubscription;
  StreamSubscription<Map<String, MediaStream>>? _remoteStreamsSubscription;

  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final Map<String, RTCVideoRenderer> _remoteRenderers = {};

  CallBloc({
    required this.repository,
    required this.webrtcService,
  }) : super(const CallState.initial()) {
    on<JoinCall>(_onJoinCall);
    on<LeaveCall>(_onLeaveCall);
    on<ToggleAudio>(_onToggleAudio);
    on<ToggleVideo>(_onToggleVideo);
    on<SwitchCamera>(_onSwitchCamera);
    on<UpdateCall>(_onUpdateCall);

    _initializeRenderers();
  }

  Future<void> _initializeRenderers() async {
    await _localRenderer.initialize();
  }

  Future<void> _onJoinCall(
    JoinCall event,
    Emitter<CallState> emit,
  ) async {
    emit(const CallState.connecting());

    final result = await repository.joinCall(event.roomId);

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
          if (state is Connected) {
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
    LeaveCall event,
    Emitter<CallState> emit,
  ) async {
    final result = await repository.leaveCall();

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
    ToggleAudio event,
    Emitter<CallState> emit,
  ) async {
    if (state is! Connected) return;

    final currentState = state as Connected;
    final currentAudioState = currentState.call.isAudioEnabled;

    final result = await repository.toggleAudio(
      !currentAudioState,
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
    ToggleVideo event,
    Emitter<CallState> emit,
  ) async {
    if (state is! Connected) return;

    final currentState = state as Connected;
    final currentVideoState = currentState.call.isVideoEnabled;

    final result = await repository.toggleVideo(
      !currentVideoState,
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
    SwitchCamera event,
    Emitter<CallState> emit,
  ) async {
    final result = await repository.switchCamera();

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
    UpdateCall event,
    Emitter<CallState> emit,
  ) {
    if (state is Connected) {
      final currentState = state as Connected;
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
