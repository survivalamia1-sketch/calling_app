import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../bloc/call_bloc.dart';
import '../../domain/entities/call.dart';

class CallPage extends StatefulWidget {
  final String roomId;

  const CallPage({
    super.key,
    required this.roomId,
  });

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  void initState() {
    super.initState();
    // Join call when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CallBloc>().add(CallEvent.joinCall(roomId: widget.roomId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocConsumer<CallBloc, CallState>(
          listener: (context, state) {
            state.whenOrNull(
              disconnected: () {
                // Navigate back when call ends
                context.pop();
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              connecting: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 24),
                    Text(
                      'Connecting to call...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              connected: (call, localRenderer, remoteRenderers) =>
                  _buildCallView(
                context,
                call,
                localRenderer,
                remoteRenderers,
              ),
              disconnected: () => const Center(
                child: Text(
                  'Call ended',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => context.pop(),
                      child: const Text('Go Back'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCallView(
    BuildContext context,
    Call call,
    RTCVideoRenderer localRenderer,
    Map<String, RTCVideoRenderer> remoteRenderers,
  ) {
    return Stack(
      children: [
        // Main video view (remote participants or local if alone)
        if (remoteRenderers.isNotEmpty)
          _buildRemoteVideosGrid(remoteRenderers)
        else
          _buildLocalVideo(localRenderer, isMainView: true),

        // Floating local video (if there are remote participants)
        if (remoteRenderers.isNotEmpty)
          Positioned(
            top: 16,
            right: 16,
            child: _buildLocalVideo(localRenderer, isMainView: false),
          ),

        // Call info overlay
        Positioned(
          top: 16,
          left: 16,
          child: _buildCallInfo(call),
        ),

        // Control buttons at bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildControls(context, call),
        ),
      ],
    );
  }

  Widget _buildRemoteVideosGrid(Map<String, RTCVideoRenderer> remoteRenderers) {
    final renderersList = remoteRenderers.values.toList();

    if (renderersList.length == 1) {
      return RTCVideoView(
        renderersList[0],
        objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
        mirror: false,
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: renderersList.length <= 4 ? 2 : 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: renderersList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            border: Border.all(color: Colors.white24),
          ),
          child: RTCVideoView(
            renderersList[index],
            objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
            mirror: false,
          ),
        );
      },
    );
  }

  Widget _buildLocalVideo(RTCVideoRenderer renderer, {required bool isMainView}) {
    return Container(
      width: isMainView ? double.infinity : 120,
      height: isMainView ? double.infinity : 160,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: isMainView ? null : BorderRadius.circular(12),
        border: isMainView ? null : Border.all(color: Colors.white, width: 2),
      ),
      child: ClipRRect(
        borderRadius: isMainView ? BorderRadius.zero : BorderRadius.circular(10),
        child: RTCVideoView(
          renderer,
          objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          mirror: true,
        ),
      ),
    );
  }

  Widget _buildCallInfo(Call call) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getCallStatusIcon(call.status),
            color: _getCallStatusColor(call.status),
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            _getCallStatusText(call.status),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (call.participants.isNotEmpty) ...[
            const SizedBox(width: 12),
            Container(
              width: 1,
              height: 16,
              color: Colors.white38,
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.people,
              color: Colors.white70,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              '${call.participants.length + 1}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildControls(BuildContext context, Call call) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black87,
            Colors.black54,
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildControlButton(
            icon: call.isAudioEnabled ? Icons.mic : Icons.mic_off,
            label: call.isAudioEnabled ? 'Mute' : 'Unmute',
            onPressed: () {
              context.read<CallBloc>().add(const CallEvent.toggleAudio());
            },
            backgroundColor: call.isAudioEnabled
                ? Colors.white24
                : Colors.red.withOpacity(0.8),
          ),
          _buildControlButton(
            icon: call.isVideoEnabled ? Icons.videocam : Icons.videocam_off,
            label: call.isVideoEnabled ? 'Stop Video' : 'Start Video',
            onPressed: () {
              context.read<CallBloc>().add(const CallEvent.toggleVideo());
            },
            backgroundColor: call.isVideoEnabled
                ? Colors.white24
                : Colors.red.withOpacity(0.8),
          ),
          _buildControlButton(
            icon: Icons.flip_camera_ios,
            label: 'Flip',
            onPressed: () {
              context.read<CallBloc>().add(const CallEvent.switchCamera());
            },
            backgroundColor: Colors.white24,
          ),
          _buildControlButton(
            icon: Icons.call_end,
            label: 'End',
            onPressed: () {
              context.read<CallBloc>().add(const CallEvent.leaveCall());
            },
            backgroundColor: Colors.red,
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
    bool isDestructive = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: backgroundColor,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onPressed,
            customBorder: const CircleBorder(),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  IconData _getCallStatusIcon(CallStatus status) {
    switch (status) {
      case CallStatus.connecting:
        return Icons.sync;
      case CallStatus.connected:
        return Icons.circle;
      case CallStatus.reconnecting:
        return Icons.sync_problem;
      case CallStatus.disconnected:
      case CallStatus.ended:
        return Icons.call_end;
      default:
        return Icons.help_outline;
    }
  }

  Color _getCallStatusColor(CallStatus status) {
    switch (status) {
      case CallStatus.connecting:
      case CallStatus.reconnecting:
        return Colors.orange;
      case CallStatus.connected:
        return Colors.green;
      case CallStatus.disconnected:
      case CallStatus.ended:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getCallStatusText(CallStatus status) {
    switch (status) {
      case CallStatus.connecting:
        return 'Connecting...';
      case CallStatus.connected:
        return 'Connected';
      case CallStatus.reconnecting:
        return 'Reconnecting...';
      case CallStatus.disconnected:
        return 'Disconnected';
      case CallStatus.ended:
        return 'Call Ended';
      default:
        return 'Unknown';
    }
  }
}
