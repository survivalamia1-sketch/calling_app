import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/preview_bloc.dart';
import '../bloc/preview_event.dart';
import '../bloc/preview_state.dart';

/// Join Preview Page
///
/// This page is displayed before joining a meeting.
/// It allows users to:
/// - Preview their video (if camera is available)
/// - Toggle camera on/off
/// - Toggle microphone on/off
/// - Switch camera (front/back)
/// - Set display name
/// - Handle permission requests
///
/// NO MOCK DATA - All state managed through PreviewBloc
class JoinPreviewPage extends StatelessWidget {
  final String roomId;
  final String? roomName;

  const JoinPreviewPage({
    super.key,
    required this.roomId,
    this.roomName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(roomName ?? 'Join Meeting'),
        centerTitle: true,
      ),
      body: BlocConsumer<PreviewBloc, PreviewState>(
        listener: (context, state) {
          // Show error messages
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Initializing...'),
                ],
              ),
            );
          }

          return Column(
            children: [
              // Video Preview Area
              Expanded(
                child: _buildVideoPreview(context, state),
              ),

              // Controls Area
              _buildControlsArea(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildVideoPreview(BuildContext context, PreviewState state) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          // Video Preview or Placeholder
          Center(
            child: _buildPreviewContent(context, state),
          ),

          // Permissions Warning
          if (state.showPermissionsWarning)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: _buildPermissionsWarning(context, state),
            ),
        ],
      ),
    );
  }

  Widget _buildPreviewContent(BuildContext context, PreviewState state) {
    // If camera is enabled and permission granted
    if (state.cameraEnabled && state.permissions.hasCameraAccess) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.videocam,
            size: 64,
            color: Colors.white.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 16),
          Text(
            'Camera Preview',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Video preview will be shown here',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
          ),
        ],
      );
    }

    // If camera is off or no permission
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            shape: BoxShape.circle,
          ),
          child: Icon(
            state.permissions.hasCameraAccess
                ? Icons.videocam_off
                : Icons.no_photography,
            size: 48,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          state.permissions.hasCameraAccess
              ? 'Camera is off'
              : 'Camera permission required',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        if (!state.permissions.hasCameraAccess) ...[
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              context.read<PreviewBloc>().add(
                    const PreviewEvent.requestCameraPermission(),
                  );
            },
            child: const Text('Grant Permission'),
          ),
        ],
      ],
    );
  }

  Widget _buildPermissionsWarning(BuildContext context, PreviewState state) {
    return Card(
      color: Colors.orange.shade900,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.warning, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    state.permissionsMessage,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  context.read<PreviewBloc>().add(
                        const PreviewEvent.openSettings(),
                      );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text('Open Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlsArea(BuildContext context, PreviewState state) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display Name Input
          TextField(
            decoration: const InputDecoration(
              labelText: 'Your name',
              hintText: 'Enter your display name',
              prefixIcon: Icon(Icons.person),
            ),
            onChanged: (value) {
              context.read<PreviewBloc>().add(
                    PreviewEvent.updateDisplayName(value),
                  );
            },
          ),
          const SizedBox(height: 24),

          // Control Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Camera Toggle
              _buildControlButton(
                context: context,
                icon: state.cameraEnabled
                    ? Icons.videocam
                    : Icons.videocam_off,
                label: state.cameraEnabled ? 'Camera' : 'Camera Off',
                isActive: state.cameraEnabled,
                isEnabled: state.canToggleCamera,
                onPressed: state.canToggleCamera
                    ? () {
                        context.read<PreviewBloc>().add(
                              const PreviewEvent.toggleCamera(),
                            );
                      }
                    : null,
              ),

              // Microphone Toggle
              _buildControlButton(
                context: context,
                icon: state.microphoneEnabled ? Icons.mic : Icons.mic_off,
                label: state.microphoneEnabled ? 'Mic' : 'Mic Off',
                isActive: state.microphoneEnabled,
                isEnabled: state.canToggleMicrophone,
                onPressed: state.canToggleMicrophone
                    ? () {
                        context.read<PreviewBloc>().add(
                              const PreviewEvent.toggleMicrophone(),
                            );
                      }
                    : null,
              ),

              // Switch Camera
              _buildControlButton(
                context: context,
                icon: Icons.switch_camera,
                label: 'Switch',
                isActive: false,
                isEnabled: state.canSwitchCamera,
                onPressed: state.canSwitchCamera
                    ? () {
                        context.read<PreviewBloc>().add(
                              const PreviewEvent.switchCamera(),
                            );
                      }
                    : null,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Join Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: state.canJoin
                  ? () {
                      context.read<PreviewBloc>().add(
                            const PreviewEvent.joinMeeting(),
                          );
                      // Navigate to connecting page
                      context.go('/call/connecting/${state.roomId}');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Join Meeting',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isActive,
    required bool isEnabled,
    VoidCallback? onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isEnabled
                ? (isActive
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade300)
                : Colors.grey.shade200,
          ),
          child: IconButton(
            icon: Icon(icon),
            iconSize: 28,
            color: isEnabled
                ? (isActive ? Colors.white : Colors.grey.shade700)
                : Colors.grey.shade400,
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isEnabled ? Colors.black87 : Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
