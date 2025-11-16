import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/meeting.dart';

/// Page displaying detailed information about a meeting
class MeetingDetailsPage extends StatelessWidget {
  final Meeting meeting;

  const MeetingDetailsPage({
    super.key,
    required this.meeting,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Details'),
        actions: [
          if (meeting.isOngoing || meeting.isStartingSoon)
            TextButton.icon(
              onPressed: () => _joinMeeting(context),
              icon: const Icon(Icons.video_call, color: Colors.white),
              label: const Text(
                'Join',
                style: TextStyle(color: Colors.white),
              ),
            ),
          PopupMenuButton<String>(
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              if (!meeting.isCompleted)
                const PopupMenuItem<String>(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 12),
                      Text('Edit Meeting'),
                    ],
                  ),
                ),
              const PopupMenuItem<String>(
                value: 'copy_code',
                child: Row(
                  children: [
                    Icon(Icons.copy),
                    SizedBox(width: 12),
                    Text('Copy Room Code'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'share',
                child: Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(width: 12),
                    Text('Share Meeting'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 12),
                    Text('Delete Meeting', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
            onSelected: (value) => _handleMenuAction(context, value),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Banner
            _buildStatusBanner(context),
            const SizedBox(height: 24),

            // Meeting Title and Description
            Text(
              meeting.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (meeting.description.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                meeting.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
            const SizedBox(height: 24),

            // Meeting Information Cards
            _buildInfoCard(
              icon: Icons.calendar_today,
              title: 'Scheduled Time',
              subtitle: _formatDateTime(meeting.scheduledAt),
            ),
            const SizedBox(height: 12),

            if (meeting.duration != null)
              _buildInfoCard(
                icon: Icons.timer,
                title: 'Duration',
                subtitle: '${meeting.duration} minutes',
              ),
            if (meeting.duration != null) const SizedBox(height: 12),

            _buildInfoCard(
              icon: Icons.meeting_room,
              title: 'Room Code',
              subtitle: meeting.roomCode,
              trailing: IconButton(
                icon: const Icon(Icons.copy, size: 20),
                onPressed: () => _copyRoomCode(context),
              ),
            ),
            const SizedBox(height: 12),

            _buildInfoCard(
              icon: Icons.people,
              title: 'Max Participants',
              subtitle: '${meeting.maxParticipants} participants',
            ),
            const SizedBox(height: 12),

            _buildInfoCard(
              icon: Icons.shield,
              title: 'Approval Required',
              subtitle: meeting.requiresApproval ? 'Yes' : 'No',
            ),
            const SizedBox(height: 12),

            if (meeting.startedAt != null)
              _buildInfoCard(
                icon: Icons.play_circle,
                title: 'Started At',
                subtitle: _formatDateTime(meeting.startedAt!),
              ),
            if (meeting.startedAt != null) const SizedBox(height: 12),

            if (meeting.endedAt != null)
              _buildInfoCard(
                icon: Icons.stop_circle,
                title: 'Ended At',
                subtitle: _formatDateTime(meeting.endedAt!),
              ),
            if (meeting.endedAt != null) const SizedBox(height: 12),

            _buildInfoCard(
              icon: Icons.access_time,
              title: 'Created At',
              subtitle: _formatDateTime(meeting.createdAt),
            ),
            const SizedBox(height: 32),

            // Action Buttons
            if (!meeting.isCompleted) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _joinMeeting(context),
                  icon: const Icon(Icons.video_call),
                  label: Text(
                    meeting.isOngoing
                        ? 'Join Now'
                        : meeting.isStartingSoon
                            ? 'Join Meeting'
                            : 'Join Early',
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: meeting.isOngoing || meeting.isStartingSoon
                        ? Colors.green
                        : Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _shareMeeting(context),
                  icon: const Icon(Icons.share),
                  label: const Text('Share Meeting'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBanner(BuildContext context) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (meeting.isCompleted) {
      statusColor = Colors.grey;
      statusText = 'Meeting Ended';
      statusIcon = Icons.check_circle;
    } else if (meeting.isOngoing) {
      statusColor = Colors.green;
      statusText = 'Meeting in Progress';
      statusIcon = Icons.fiber_manual_record;
    } else if (meeting.isStartingSoon) {
      statusColor = Colors.orange;
      statusText = 'Starting Soon';
      statusIcon = Icons.schedule;
    } else {
      statusColor = Colors.blue;
      statusText = 'Scheduled';
      statusIcon = Icons.calendar_today;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor),
      ),
      child: Row(
        children: [
          Icon(statusIcon, color: statusColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (meeting.isStartingSoon)
                  Text(
                    'Starts in ${_getTimeUntilStart()}',
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final dateToCheck = DateTime(dateTime.year, dateTime.month, dateTime.day);

    final timeFormat = DateFormat('h:mm a');
    final fullFormat = DateFormat('MMM d, yyyy · h:mm a');

    if (dateToCheck == today) {
      return 'Today at ${timeFormat.format(dateTime)}';
    } else if (dateToCheck == tomorrow) {
      return 'Tomorrow at ${timeFormat.format(dateTime)}';
    } else {
      return fullFormat.format(dateTime);
    }
  }

  String _getTimeUntilStart() {
    final now = DateTime.now();
    final difference = meeting.scheduledAt.difference(now);

    if (difference.inMinutes < 1) {
      return 'less than a minute';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'}';
    } else {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'}';
    }
  }

  void _joinMeeting(BuildContext context) {
    // Navigate to in-meeting page
    context.push('/join/${meeting.roomCode}');
  }

  void _copyRoomCode(BuildContext context) {
    Clipboard.setData(ClipboardData(text: meeting.roomCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Room code copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _shareMeeting(BuildContext context) {
    // TODO: Implement share meeting functionality with native share
    final meetingInfo = '''
Join my meeting: ${meeting.title}

Scheduled: ${_formatDateTime(meeting.scheduledAt)}
Room Code: ${meeting.roomCode}

Use the calling app to join!
''';

    Clipboard.setData(ClipboardData(text: meetingInfo));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Meeting details copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleMenuAction(BuildContext context, String action) {
    switch (action) {
      case 'edit':
        context.push('/meetings/schedule/${meeting.id}/edit');
        break;
      case 'copy_code':
        _copyRoomCode(context);
        break;
      case 'share':
        _shareMeeting(context);
        break;
      case 'delete':
        _showDeleteConfirmation(context);
        break;
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Meeting?'),
        content: const Text(
          'Are you sure you want to delete this meeting? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _deleteMeeting(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _deleteMeeting(BuildContext context) {
    // TODO: Implement delete meeting via backend API
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Meeting deleted'),
        duration: Duration(seconds: 2),
      ),
    );

    // Navigate back
    Navigator.of(context).pop();
  }
}
