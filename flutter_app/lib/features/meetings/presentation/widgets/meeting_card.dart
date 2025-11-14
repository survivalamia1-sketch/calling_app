import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/meeting.dart';

class MeetingCard extends StatelessWidget {
  final Meeting meeting;
  final VoidCallback onTap;

  const MeetingCard({
    super.key,
    required this.meeting,
    required this.onTap,
  });

  Color _getStatusColor(BuildContext context) {
    if (meeting.isOngoing) return Colors.green;
    if (meeting.isStartingSoon) return Colors.orange;
    if (meeting.isScheduled) return Colors.blue;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('hh:mm a');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      meeting.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(context).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      meeting.status,
                      style: TextStyle(
                        color: _getStatusColor(context),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (meeting.description.isNotEmpty)
                Text(
                  meeting.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  _buildInfoChip(
                    context,
                    icon: Icons.calendar_today,
                    label: dateFormat.format(meeting.scheduledAt),
                  ),
                  _buildInfoChip(
                    context,
                    icon: Icons.access_time,
                    label: timeFormat.format(meeting.scheduledAt),
                  ),
                  if (meeting.duration != null)
                    _buildInfoChip(
                      context,
                      icon: Icons.timelapse,
                      label: '${meeting.duration} min',
                    ),
                  _buildInfoChip(
                    context,
                    icon: Icons.people,
                    label: 'Max ${meeting.maxParticipants}',
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceVariant
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.key,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          meeting.roomCode,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (meeting.isOngoing || meeting.isStartingSoon)
                    ElevatedButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.video_call, size: 18),
                      label: const Text('Join'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context,
      {required IconData icon, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
        ),
      ],
    );
  }
}
