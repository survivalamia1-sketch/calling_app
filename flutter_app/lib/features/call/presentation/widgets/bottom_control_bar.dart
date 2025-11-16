import 'package:flutter/material.dart';
import '../../domain/entities/audio_state.dart';
import '../../domain/entities/video_state.dart';

/// Bottom control bar with all meeting controls
class BottomControlBar extends StatelessWidget {
  final AudioState audioState;
  final VideoState videoState;
  final bool isScreenSharing;
  final int unreadMessageCount;
  final bool isHost;

  final VoidCallback? onToggleAudio;
  final VoidCallback? onToggleVideo;
  final VoidCallback? onToggleScreenShare;
  final VoidCallback? onOpenParticipants;
  final VoidCallback? onOpenChat;
  final VoidCallback? onOpenLayout;
  final VoidCallback? onOpenMore;
  final VoidCallback? onLeave;

  const BottomControlBar({
    super.key,
    required this.audioState,
    required this.videoState,
    this.isScreenSharing = false,
    this.unreadMessageCount = 0,
    this.isHost = false,
    this.onToggleAudio,
    this.onToggleVideo,
    this.onToggleScreenShare,
    this.onOpenParticipants,
    this.onOpenChat,
    this.onOpenLayout,
    this.onOpenMore,
    this.onLeave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: const BoxDecoration(
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
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Audio toggle
            _ControlButton(
              icon: audioState.isMuted ? Icons.mic_off : Icons.mic,
              label: audioState.isMuted ? 'Unmute' : 'Mute',
              isActive: !audioState.isMuted,
              isDisabled: !audioState.canToggle,
              onPressed: audioState.canToggle ? onToggleAudio : null,
            ),

            // Video toggle
            _ControlButton(
              icon: videoState.isEnabled ? Icons.videocam : Icons.videocam_off,
              label: videoState.isEnabled ? 'Stop Video' : 'Start Video',
              isActive: videoState.isEnabled,
              isDisabled: !videoState.canToggle,
              onPressed: videoState.canToggle ? onToggleVideo : null,
            ),

            // Screen share
            _ControlButton(
              icon: isScreenSharing ? Icons.stop_screen_share : Icons.screen_share,
              label: isScreenSharing ? 'Stop Share' : 'Share',
              isActive: isScreenSharing,
              onPressed: onToggleScreenShare,
            ),

            // Participants
            _ControlButton(
              icon: Icons.people,
              label: 'Participants',
              onPressed: onOpenParticipants,
            ),

            // Chat with badge
            _ControlButton(
              icon: Icons.chat_bubble,
              label: 'Chat',
              badge: unreadMessageCount > 0 ? unreadMessageCount : null,
              onPressed: onOpenChat,
            ),

            // Layout
            _ControlButton(
              icon: Icons.view_comfortable,
              label: 'Layout',
              onPressed: onOpenLayout,
            ),

            // More options
            _ControlButton(
              icon: Icons.more_horiz,
              label: 'More',
              onPressed: onOpenMore,
            ),

            // Leave/End button
            _ControlButton(
              icon: Icons.call_end,
              label: isHost ? 'End' : 'Leave',
              isDestructive: true,
              onPressed: onLeave,
            ),
          ],
        ),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool isDestructive;
  final bool isDisabled;
  final int? badge;
  final VoidCallback? onPressed;

  const _ControlButton({
    required this.icon,
    required this.label,
    this.isActive = false,
    this.isDestructive = false,
    this.isDisabled = false,
    this.badge,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Material(
                color: _getBackgroundColor(),
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: isDisabled ? null : onPressed,
                  customBorder: const CircleBorder(),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
              // Badge
              if (badge != null && badge! > 0)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      badge! > 99 ? '99+' : '$badge',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    if (isDestructive) {
      return Colors.red;
    }
    if (isActive) {
      return Colors.white24;
    }
    return Colors.white12;
  }
}
