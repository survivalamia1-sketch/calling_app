import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/meeting_connection_service.dart';

part 'connecting_state.freezed.dart';

/// Connecting State
///
/// State for Connecting page
@freezed
class ConnectingState with _$ConnectingState {
  const factory ConnectingState.initial() = Initial;

  const factory ConnectingState.connecting({
    required ConnectionStatus status,
    required String message,
    @Default(0.0) double progress,
  }) = Connecting;

  const factory ConnectingState.connected({
    required String roomId,
  }) = Connected;

  const factory ConnectingState.failed({
    required String message,
    required ConnectionErrorType errorType,
    @Default(false) bool canRetry,
  }) = Failed;

  const factory ConnectingState.cancelled() = Cancelled;
}
