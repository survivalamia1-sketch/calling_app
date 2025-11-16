import 'package:flutter/material.dart';

import '../../domain/entities/network_quality.dart';
import '../../domain/repositories/meeting_connection_service.dart';

/// Top bar showing meeting info, network status, and participant count
class TopBar extends StatelessWidget {
  final MeetingInfo? meetingInfo;
  final NetworkQuality networkQuality;
  final int participantCount;
  final bool isRecording;
  final VoidCallback? onMenuPressed;

  const TopBar({
    super.key,
    this.meetingInfo,
    required this.networkQuality,
    required this.participantCount,
    this.isRecording = false,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black87,
            Colors.black54,
            Colors.transparent,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Meeting info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Meeting name
                  Text(
                    meetingInfo?.name ?? 'Meeting',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Status row
                  Row(
                    children: [
                      // Network quality indicator
                      Icon(
                        _getNetworkIcon(),
                        size: 14,
                        color: _getNetworkColor(),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        networkQuality.displayMessage,
                        style: TextStyle(
                          color: _getNetworkColor(),
                          fontSize: 12,
                        ),
                      ),

                      // Separator
                      const SizedBox(width: 8),
                      Container(
                        width: 1,
                        height: 12,
                        color: Colors.white38,
                      ),
                      const SizedBox(width: 8),

                      // Participant count
                      const Icon(
                        Icons.people,
                        size: 14,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$participantCount',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),

                      // Recording indicator
                      if (isRecording) ...[
                        const SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 12,
                          color: Colors.white38,
                        ),
                        const SizedBox(width: 8),
                        _buildRecordingIndicator(),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            // Menu button
            if (onMenuPressed != null)
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: onMenuPressed,
                tooltip: 'More options',
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordingIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          'REC',
          style: TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  IconData _getNetworkIcon() {
    switch (networkQuality.level) {
      case NetworkQualityLevel.excellent:
      case NetworkQualityLevel.good:
        return Icons.signal_cellular_alt;
      case NetworkQualityLevel.fair:
        return Icons.signal_cellular_alt_2_bar;
      case NetworkQualityLevel.poor:
      case NetworkQualityLevel.veryPoor:
        return Icons.signal_cellular_alt_1_bar;
      case NetworkQualityLevel.unknown:
        return Icons.signal_cellular_connected_no_internet_0_bar;
    }
  }

  Color _getNetworkColor() {
    switch (networkQuality.level) {
      case NetworkQualityLevel.excellent:
      case NetworkQualityLevel.good:
        return Colors.green;
      case NetworkQualityLevel.fair:
        return Colors.orange;
      case NetworkQualityLevel.poor:
      case NetworkQualityLevel.veryPoor:
        return Colors.red;
      case NetworkQualityLevel.unknown:
        return Colors.grey;
    }
  }
}
