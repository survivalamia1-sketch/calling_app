import 'package:flutter/material.dart';

import '../../domain/entities/call_connection_state.dart';

/// Status banner showing connection state and important notifications
class StatusBanner extends StatelessWidget {
  final CallConnectionState connectionState;
  final String? errorMessage;

  const StatusBanner({
    super.key,
    required this.connectionState,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    // Don't show banner if connected and no error
    if (connectionState == CallConnectionState.connected &&
        errorMessage == null) {
      return const SizedBox.shrink();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Icon
            _buildIcon(),
            const SizedBox(width: 12),

            // Message
            Expanded(
              child: Text(
                _getMessage(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Loading indicator for connecting/reconnecting
            if (_isLoading())
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    IconData iconData;

    if (errorMessage != null) {
      iconData = Icons.error_outline;
    } else {
      switch (connectionState) {
        case CallConnectionState.connecting:
          iconData = Icons.sync;
        case CallConnectionState.connected:
          iconData = Icons.check_circle_outline;
        case CallConnectionState.reconnecting:
          iconData = Icons.sync_problem;
        case CallConnectionState.disconnected:
          iconData = Icons.cloud_off;
      }
    }

    return Icon(
      iconData,
      color: Colors.white,
      size: 20,
    );
  }

  String _getMessage() {
    if (errorMessage != null) {
      return errorMessage!;
    }

    switch (connectionState) {
      case CallConnectionState.connecting:
        return 'Connecting to meeting...';
      case CallConnectionState.connected:
        return 'Connected';
      case CallConnectionState.reconnecting:
        return 'Reconnecting...';
      case CallConnectionState.disconnected:
        return 'Disconnected from meeting';
    }
  }

  Color _getBackgroundColor() {
    if (errorMessage != null) {
      return Colors.red.shade700;
    }

    switch (connectionState) {
      case CallConnectionState.connecting:
        return Colors.blue.shade700;
      case CallConnectionState.connected:
        return Colors.green.shade700;
      case CallConnectionState.reconnecting:
        return Colors.orange.shade700;
      case CallConnectionState.disconnected:
        return Colors.grey.shade700;
    }
  }

  bool _isLoading() {
    return connectionState == CallConnectionState.connecting ||
        connectionState == CallConnectionState.reconnecting;
  }
}
