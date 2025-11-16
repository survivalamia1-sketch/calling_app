import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../../domain/entities/participant.dart';

/// Individual participant video tile with WebRTC video rendering
class ParticipantVideoTile extends StatefulWidget {
  final Participant participant;
  final bool isActiveSpeaker;
  final bool isFocused;
  final bool isPinned;
  final MediaStream? videoStream; // WebRTC video stream

  const ParticipantVideoTile({
    super.key,
    required this.participant,
    this.isActiveSpeaker = false,
    this.isFocused = false,
    this.isPinned = false,
    this.videoStream,
  });

  @override
  State<ParticipantVideoTile> createState() => _ParticipantVideoTileState();
}

class _ParticipantVideoTileState extends State<ParticipantVideoTile> {
  RTCVideoRenderer? _renderer;

  @override
  void initState() {
    super.initState();
    _initRenderer();
  }

  @override
  void didUpdateWidget(ParticipantVideoTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoStream != widget.videoStream) {
      _updateStream();
    }
  }

  Future<void> _initRenderer() async {
    if (widget.videoStream != null) {
      _renderer = RTCVideoRenderer();
      await _renderer!.initialize();
      _renderer!.srcObject = widget.videoStream;
      if (mounted) setState(() {});
    }
  }

  Future<void> _updateStream() async {
    if (_renderer != null) {
      _renderer!.srcObject = widget.videoStream;
      if (mounted) setState(() {});
    } else if (widget.videoStream != null) {
      await _initRenderer();
    }
  }

  @override
  void dispose() {
    _renderer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.isActiveSpeaker ? Colors.green : Colors.white24,
          width: widget.isActiveSpeaker ? 3 : 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // Video or avatar
            Positioned.fill(
              child: widget.participant.isVideoOn
                  ? _buildVideoView()
                  : _buildAvatarPlaceholder(),
            ),

            // Top indicators
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side indicators
                  Row(
                    children: [
                      // Host badge
                      if (widget.participant.isHost)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'HOST',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      const SizedBox(width: 4),

                      // Screen sharing indicator
                      if (widget.participant.isScreenSharing)
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            Icons.screen_share,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                    ],
                  ),

                  // Right side indicators
                  Row(
                    children: [
                      // Hand raised
                      if (widget.participant.isHandRaised)
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.orange.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            Icons.back_hand,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      const SizedBox(width: 4),

                      // Pinned indicator
                      if (widget.isPinned)
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.purple.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            Icons.push_pin,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            // Bottom name and mic status
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    // Microphone icon
                    Icon(
                      widget.participant.isMuted ? Icons.mic_off : Icons.mic,
                      color: widget.participant.isMuted
                          ? Colors.red
                          : Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 4),

                    // Name
                    Expanded(
                      child: Text(
                        widget.participant.displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoView() {
    // If we have a renderer with a valid stream, show the video
    if (_renderer != null && widget.videoStream != null) {
      return RTCVideoView(
        _renderer!,
        objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
        mirror: false,
      );
    }

    // Otherwise show placeholder for video loading
    return Container(
      color: Colors.grey[850],
      child: Center(
        child: Icon(
          Icons.videocam_off,
          size: widget.isFocused ? 48 : 32,
          color: Colors.white38,
        ),
      ),
    );
  }

  Widget _buildAvatarPlaceholder() {
    return Container(
      color: Colors.grey[800],
      child: Center(
        child: CircleAvatar(
          radius: widget.isFocused ? 48 : 32,
          backgroundColor: _getAvatarColor(),
          backgroundImage: widget.participant.avatarUrl != null
              ? NetworkImage(widget.participant.avatarUrl!)
              : null,
          child: widget.participant.avatarUrl == null
              ? Text(
                  widget.participant.initials,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.isFocused ? 32 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Color _getAvatarColor() {
    // Generate a consistent color based on participant ID
    final hash = widget.participant.id.hashCode;
    final colors = [
      Colors.blue,
      Colors.purple,
      Colors.pink,
      Colors.red,
      Colors.orange,
      Colors.teal,
      Colors.green,
      Colors.indigo,
    ];
    return colors[hash.abs() % colors.length];
  }
}
