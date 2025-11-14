import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpcomingMeetingsCard extends StatelessWidget {
  const UpcomingMeetingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Meetings',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextButton(
              onPressed: () => context.push('/meetings'),
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // TODO: Replace with actual data from meetings feature
        _buildMeetingItem(
          context,
          title: 'Team Standup',
          time: 'Today, 10:00 AM',
          participants: 8,
          status: 'In 2 hours',
          statusColor: Colors.orange,
        ),
        const SizedBox(height: 12),
        _buildMeetingItem(
          context,
          title: 'Product Review',
          time: 'Today, 2:00 PM',
          participants: 5,
          status: 'In 6 hours',
          statusColor: Colors.blue,
        ),
        const SizedBox(height: 12),
        _buildMeetingItem(
          context,
          title: 'Client Presentation',
          time: 'Tomorrow, 11:00 AM',
          participants: 12,
          status: 'Tomorrow',
          statusColor: Colors.green,
        ),
        const SizedBox(height: 16),
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

  Widget _buildMeetingItem(
    BuildContext context, {
    required String title,
    required String time,
    required int participants,
    required String status,
    required Color statusColor,
  }) {
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
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
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
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                const SizedBox(width: 4),
                Text(time),
                const SizedBox(width: 16),
                Icon(
                  Icons.people,
                  size: 14,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                const SizedBox(width: 4),
                Text('$participants participants'),
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
          // TODO: Navigate to meeting details
        },
      ),
    );
  }
}
