import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/meeting_connection_service.dart';

part 'connecting_event.freezed.dart';

/// Connecting Events
///
/// Events for Connecting page to handle room connection
@freezed
class ConnectingEvent with _$ConnectingEvent {
  /// Start connecting to room
  const factory ConnectingEvent.startConnecting({
    required String roomId,
    required ConnectionOptions options,
  }) = StartConnecting;

  /// Cancel connection
  const factory ConnectingEvent.cancelConnection() = CancelConnection;

  /// Retry connection after failure
  const factory ConnectingEvent.retryConnection() = RetryConnection;
}
