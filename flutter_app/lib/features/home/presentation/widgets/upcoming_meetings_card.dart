import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../meetings/domain/entities/meeting.dart';

class UpcomingMeetingsCard extends StatelessWidget {
  final List<Meeting> meetings;

  const UpcomingMeetingsCard({
    super.key,
    required this.meetings,
  });

  @override
  Widget build(BuildContext context) {
    if (meetings.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Icon(
                Icons.event_available,
                size: 64,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              ),
              const SizedBox(height: 16),
              Text(
                'No upcoming meetings',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Start a new meeting or schedule one',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.4),
                    ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => context.push('/meetings/create'),
                icon: const Icon(Icons.add),
                label: const Text('Create Meeting'),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...meetings.map((meeting) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildMeetingItem(context, meeting),
            )),
        const SizedBox(height: 8),
        Center(
          child: OutlinedButton.icon(
            onPressed: () => context.push('/meetings'),
            icon: const Icon(Icons.calendar_today),
            label: const Text('View All Meetings'),
          ),
        ),
      ],
    );
  }

  Widget _buildMeetingItem(BuildContext context, Meeting meeting) {
    final DateFormat dateFormat = DateFormat('MMM d, h:mm a');
    final DateFormat timeFormat = DateFormat('h:mm a');

    // Format the meeting time
    String formattedTime;
    if (meeting.startTime != null) {
      final now = DateTime.now();
      final startTime = meeting.startTime!;
      final isToday = startTime.year == now.year &&
          startTime.month == now.month &&
          startTime.day == now.day;

      if (isToday) {
        formattedTime = 'Today, ${timeFormat.format(startTime)}';
      } else {
        formattedTime = dateFormat.format(startTime);
      }
    } else {
      formattedTime = 'Not scheduled';
    }

    // Calculate status and color
    String status;
    Color statusColor;
    if (meeting.isStartingSoon) {
      status = 'Starting Soon';
      statusColor = Colors.orange;
    } else if (meeting.isOngoing) {
      status = 'Live';
      statusColor = Colors.red;
    } else if (meeting.isScheduled) {
      status = 'Scheduled';
      statusColor = Colors.blue;
    } else {
      status = 'Upcoming';
      statusColor = Colors.green;
    }

    return Card(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.video_call,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          meeting.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 14,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    formattedTime,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                if (meeting.maxParticipants > 0) ...[
                  Icon(
                    Icons.people,
                    size: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                  const SizedBox(width: 4),
                  Text('${meeting.maxParticipants} max'),
                ],
              ],
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        onTap: () {
          context.push('/meetings/${meeting.id}');
        },
      ),
    );
  }
}
