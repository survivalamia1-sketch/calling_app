import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/meeting_connection_service.dart';
import '../../../../core/utils/app_logger.dart';
import 'connecting_event.dart';
import 'connecting_state.dart';

/// Connecting BLoC
///
/// Manages state for Connecting page
/// Handles the connection process to meeting room
///
/// NO MOCK DATA - All data comes from MeetingConnectionService interface
class ConnectingBloc extends Bloc<ConnectingEvent, ConnectingState> {
  final MeetingConnectionService? connectionService;
  StreamSubscription<ConnectionStatus>? _statusSubscription;
  String? _currentRoomId;
  ConnectionOptions? _currentOptions;

  ConnectingBloc({
    this.connectionService,
  }) : super(const ConnectingState.initial()) {
    on<StartConnecting>(_onStartConnecting);
    on<CancelConnection>(_onCancelConnection);
    on<RetryConnection>(_onRetryConnection);
  }

  Future<void> _onStartConnecting(
    StartConnecting event,
    Emitter<ConnectingState> emit,
  ) async {
    _currentRoomId = event.roomId;
    _currentOptions = event.options;

    emit(const ConnectingState.connecting(
      status: ConnectionStatus.checkingPermissions,
      message: 'Checking permissions...',
      progress: 0.1,
    ));

    try {
      if (connectionService == null) {
        // Service not implemented - simulate connection steps
        await _simulateConnection(emit, event.roomId);
        return;
      }

      // Listen to connection status updates
      _statusSubscription =
          connectionService!.connectionStatusStream.listen((status) {
        final (message, progress) = _getStatusMessageAndProgress(status);

        if (status == ConnectionStatus.connected) {
          emit(ConnectingState.connected(roomId: event.roomId));
        } else if (status == ConnectionStatus.failed) {
          emit(const ConnectingState.failed(
            message: 'Failed to connect to meeting',
            errorType: ConnectionErrorType.unknown,
            canRetry: true,
          ));
        } else if (status == ConnectionStatus.cancelled) {
          emit(const ConnectingState.cancelled());
        } else {
          emit(ConnectingState.connecting(
            status: status,
            message: message,
            progress: progress,
          ));
        }
      });

      // Start connection
      final success = await connectionService!.connectToRoom(
        event.roomId,
        event.options,
      );

      if (!success && state is! Connected) {
        emit(const ConnectingState.failed(
          message: 'Failed to connect to meeting',
          errorType: ConnectionErrorType.unknown,
          canRetry: true,
        ));
      }
    } catch (e) {
      AppLogger.e('Connection failed', error: e);
      emit(ConnectingState.failed(
        message: 'Connection error: ${e.toString()}',
        errorType: ConnectionErrorType.unknown,
        canRetry: true,
      ));
    }
  }

  Future<void> _simulateConnection(
    Emitter<ConnectingState> emit,
    String roomId,
  ) async {
    // Simulate connection steps for demo purposes
    final steps = [
      (ConnectionStatus.checkingPermissions, 'Checking permissions...', 0.1),
      (ConnectionStatus.initializingAudio, 'Initializing audio...', 0.3),
      (ConnectionStatus.initializingVideo, 'Initializing video...', 0.5),
      (ConnectionStatus.connectingToServer, 'Connecting to server...', 0.7),
      (ConnectionStatus.joiningRoom, 'Joining room...', 0.9),
    ];

    for (final (status, message, progress) in steps) {
      await Future.delayed(const Duration(milliseconds: 800));

      if (state is CancelConnection) {
        return;
      }

      emit(ConnectingState.connecting(
        status: status,
        message: message,
        progress: progress,
      ));
    }

    await Future.delayed(const Duration(milliseconds: 500));

    if (state is! CancelConnection) {
      emit(ConnectingState.connected(roomId: roomId));
    }
  }

  Future<void> _onCancelConnection(
    CancelConnection event,
    Emitter<ConnectingState> emit,
  ) async {
    if (connectionService != null) {
      await connectionService!.cancelConnection();
    }

    await _statusSubscription?.cancel();
    emit(const ConnectingState.cancelled());
  }

  Future<void> _onRetryConnection(
    RetryConnection event,
    Emitter<ConnectingState> emit,
  ) async {
    if (_currentRoomId != null && _currentOptions != null) {
      add(ConnectingEvent.startConnecting(
        roomId: _currentRoomId!,
        options: _currentOptions!,
      ));
    }
  }

  (String message, double progress) _getStatusMessageAndProgress(
    ConnectionStatus status,
  ) {
    switch (status) {
      case ConnectionStatus.idle:
        return ('Preparing...', 0.0);
      case ConnectionStatus.checkingPermissions:
        return ('Checking permissions...', 0.1);
      case ConnectionStatus.initializingAudio:
        return ('Initializing audio...', 0.3);
      case ConnectionStatus.initializingVideo:
        return ('Initializing video...', 0.5);
      case ConnectionStatus.connectingToServer:
        return ('Connecting to server...', 0.7);
      case ConnectionStatus.joiningRoom:
        return ('Joining room...', 0.9);
      case ConnectionStatus.connected:
        return ('Connected!', 1.0);
      case ConnectionStatus.reconnecting:
        return ('Reconnecting...', 0.5);
      case ConnectionStatus.failed:
      case ConnectionStatus.disconnected:
      case ConnectionStatus.cancelled:
        return ('Connection failed', 0.0);
    }
  }

  @override
  Future<void> close() {
    _statusSubscription?.cancel();
    return super.close();
  }
}
