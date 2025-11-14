import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import '../../providers/call_provider.dart';

class CallScreen extends StatefulWidget {
  final String meetingId;

  const CallScreen({super.key, required this.meetingId});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    super.initState();
    _initializeCall();
  }

  Future<void> _initializeCall() async {
    final callProvider = Provider.of<CallProvider>(context, listen: false);
    await callProvider.initializeLocalRenderer();
    await callProvider.startLocalStream();
    // TODO: Connect to WebRTC signaling server
  }

  Future<void> _handleEndCall() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('End Call'),
        content: const Text('Are you sure you want to leave this meeting?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Leave'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      final callProvider = Provider.of<CallProvider>(context, listen: false);
      await callProvider.endCall();
      if (mounted) {
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Consumer<CallProvider>(
          builder: (context, callProvider, child) {
            return Stack(
              children: [
                // Video Grid
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Local Video
                      if (callProvider.localRenderer != null)
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: RTCVideoView(
                                callProvider.localRenderer!,
                                mirror: true,
                              ),
                            ),
                          ),
                        ),

                      // Remote Videos (placeholder)
                      if (callProvider.remoteRenderers.isEmpty)
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_outline,
                                    size: 64,
                                    color: Colors.white54,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Waiting for others to join...',
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Top Bar
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Meeting in Progress',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '00:00',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Controls
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Microphone
                        _CallButton(
                          icon: callProvider.isMuted
                              ? Icons.mic_off
                              : Icons.mic,
                          label: 'Mic',
                          isActive: !callProvider.isMuted,
                          onPressed: callProvider.toggleMute,
                        ),

                        // Video
                        _CallButton(
                          icon: callProvider.isVideoEnabled
                              ? Icons.videocam
                              : Icons.videocam_off,
                          label: 'Video',
                          isActive: callProvider.isVideoEnabled,
                          onPressed: callProvider.toggleVideo,
                        ),

                        // Screen Share
                        _CallButton(
                          icon: callProvider.isScreenSharing
                              ? Icons.stop_screen_share
                              : Icons.screen_share,
                          label: 'Share',
                          isActive: callProvider.isScreenSharing,
                          onPressed: callProvider.toggleScreenShare,
                        ),

                        // End Call
                        _CallButton(
                          icon: Icons.call_end,
                          label: 'End',
                          isActive: false,
                          color: Colors.red,
                          onPressed: _handleEndCall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CallButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color? color;
  final VoidCallback onPressed;

  const _CallButton({
    required this.icon,
    required this.label,
    required this.isActive,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? (isActive ? Colors.white : Colors.grey[700]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: buttonColor,
          foregroundColor: isActive ? Colors.black : Colors.white,
          child: Icon(icon),
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
}
