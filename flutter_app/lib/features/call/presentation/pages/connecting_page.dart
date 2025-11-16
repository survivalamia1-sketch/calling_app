import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/meeting_connection_service.dart';
import '../bloc/connecting_bloc.dart';
import '../bloc/connecting_event.dart';
import '../bloc/connecting_state.dart';

/// Connecting Page
///
/// Transitional page displayed while connecting to a meeting room.
/// Shows connection progress with animations and messages.
///
/// NO MOCK DATA - All state managed through ConnectingBloc
class ConnectingPage extends StatelessWidget {
  final String roomId;
  final ConnectionOptions options;

  const ConnectingPage({
    super.key,
    required this.roomId,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectingBloc, ConnectingState>(
      listener: (context, state) {
        state.whenOrNull(
          connected: (roomId) {
            // Navigate to call page
            context.go('/call/$roomId');
          },
          cancelled: () {
            // Go back
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        );
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              // Cancel connection on back press
              context.read<ConnectingBloc>().add(
                    const ConnectingEvent.cancelConnection(),
                  );
            }
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: state.when(
                initial: () => _buildInitialState(context),
                connecting: (status, message, progress) =>
                    _buildConnectingState(context, status, message, progress),
                connected: (roomId) => _buildConnectedState(context),
                failed: (message, errorType, canRetry) =>
                    _buildFailedState(context, message, errorType, canRetry),
                cancelled: () => _buildCancelledState(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 24),
          Text(
            'Preparing to connect...',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildConnectingState(
    BuildContext context,
    ConnectionStatus status,
    String message,
    double progress,
  ) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // Spacer
          const Spacer(),

          // Animation Area
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Pulsing animation circles
                ...List.generate(3, (index) {
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 1500 + (index * 200)),
                    builder: (context, value, child) {
                      return Container(
                        width: 150 * value,
                        height: 150 * value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withValues(alpha: 1.0 - value),
                            width: 2,
                          ),
                        ),
                      );
                    },
                    onEnd: () {
                      // Repeat animation
                    },
                  );
                }),

                // Center icon
                Icon(
                  _getIconForStatus(status),
                  size: 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Progress indicator
          SizedBox(
            width: double.infinity,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Status message
          Text(
            message,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          Text(
            '${(progress * 100).toInt()}% complete',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
          ),

          const Spacer(),

          // Cancel button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                context.read<ConnectingBloc>().add(
                      const ConnectingEvent.cancelConnection(),
                    );
              },
              child: const Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectedState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 24),
          Text(
            'Connected!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          const Text('Joining meeting...'),
        ],
      ),
    );
  }

  Widget _buildFailedState(
    BuildContext context,
    String message,
    ConnectionErrorType errorType,
    bool canRetry,
  ) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getIconForErrorType(errorType),
            size: 80,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 24),
          Text(
            'Connection Failed',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Retry button
          if (canRetry)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<ConnectingBloc>().add(
                        const ConnectingEvent.retryConnection(),
                      );
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ),

          const SizedBox(height: 16),

          // Go back button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/home');
                }
              },
              child: const Text('Go Back'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelledState(BuildContext context) {
    return const Center(
      child: Text('Connection cancelled'),
    );
  }

  IconData _getIconForStatus(ConnectionStatus status) {
    switch (status) {
      case ConnectionStatus.checkingPermissions:
        return Icons.verified_user;
      case ConnectionStatus.initializingAudio:
        return Icons.mic;
      case ConnectionStatus.initializingVideo:
        return Icons.videocam;
      case ConnectionStatus.connectingToServer:
      case ConnectionStatus.joiningRoom:
        return Icons.cloud;
      case ConnectionStatus.connected:
        return Icons.check_circle;
      default:
        return Icons.sync;
    }
  }

  IconData _getIconForErrorType(ConnectionErrorType errorType) {
    switch (errorType) {
      case ConnectionErrorType.permissionDenied:
        return Icons.block;
      case ConnectionErrorType.networkError:
        return Icons.wifi_off;
      case ConnectionErrorType.roomNotFound:
        return Icons.search_off;
      case ConnectionErrorType.roomFull:
        return Icons.people;
      case ConnectionErrorType.invalidPassword:
        return Icons.lock;
      case ConnectionErrorType.meetingEnded:
        return Icons.event_busy;
      case ConnectionErrorType.userRemoved:
        return Icons.person_off;
      case ConnectionErrorType.timeout:
        return Icons.timer_off;
      case ConnectionErrorType.unknown:
        return Icons.error;
    }
  }
}
