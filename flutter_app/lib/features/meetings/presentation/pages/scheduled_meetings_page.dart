import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/injection.dart';
import '../../domain/entities/scheduled_meeting.dart';
import '../bloc/scheduled_meetings_bloc.dart';
import '../bloc/scheduled_meetings_event.dart';
import '../bloc/scheduled_meetings_state.dart';

/// Schedule Meetings Page
///
/// Displays and manages all scheduled meetings with CRUD operations
/// NO MOCK DATA - All data from repository
class ScheduledMeetingsPage extends StatelessWidget {
  const ScheduledMeetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ScheduledMeetingsBloc>()
        ..add(const ScheduledMeetingsEvent.loadScheduledMeetings()),
      child: const _ScheduledMeetingsView(),
    );
  }
}

class _ScheduledMeetingsView extends StatelessWidget {
  const _ScheduledMeetingsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduled Meetings'),
        actions: [
          // Filter button
          PopupMenuButton<ScheduledMeetingStatus?>(
            icon: const Icon(Icons.filter_list),
            onSelected: (status) {
              context.read<ScheduledMeetingsBloc>().add(
                    ScheduledMeetingsEvent.filterByStatus(status),
                  );
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: null,
                child: Text('All'),
              ),
              const PopupMenuItem(
                value: ScheduledMeetingStatus.scheduled,
                child: Text('Scheduled'),
              ),
              const PopupMenuItem(
                value: ScheduledMeetingStatus.inProgress,
                child: Text('In Progress'),
              ),
              const PopupMenuItem(
                value: ScheduledMeetingStatus.ended,
                child: Text('Ended'),
              ),
              const PopupMenuItem(
                value: ScheduledMeetingStatus.cancelled,
                child: Text('Cancelled'),
              ),
            ],
          ),
        ],
      ),
      body: BlocConsumer<ScheduledMeetingsBloc, ScheduledMeetingsState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (meetings, filter) => _buildMeetingsList(context, meetings),
            empty: () => _buildEmptyState(context),
            error: (message) => _buildErrorState(context, message),
            deleting: (id) => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Deleting meeting...'),
                ],
              ),
            ),
            starting: (id) => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Starting meeting...'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/meetings/schedule/create');
        },
        icon: const Icon(Icons.add),
        label: const Text('Schedule Meeting'),
      ),
    );
  }

  Widget _buildMeetingsList(BuildContext context, List<ScheduledMeeting> meetings) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ScheduledMeetingsBloc>().add(
              const ScheduledMeetingsEvent.refreshScheduledMeetings(),
            );
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: meetings.length,
        itemBuilder: (context, index) {
          final meeting = meetings[index];
          return _ScheduledMeetingCard(meeting: meeting);
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_busy,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No Scheduled Meetings',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first scheduled meeting',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.push('/meetings/schedule/create');
            },
            icon: const Icon(Icons.add),
            label: const Text('Schedule Meeting'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to Load Meetings',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.read<ScheduledMeetingsBloc>().add(
                    const ScheduledMeetingsEvent.loadScheduledMeetings(),
                  );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

/// Scheduled Meeting Card Widget
class _ScheduledMeetingCard extends StatelessWidget {
  final ScheduledMeeting meeting;

  const _ScheduledMeetingCard({required this.meeting});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('h:mm a');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // Navigate to meeting details or edit
          context.push('/meetings/schedule/${meeting.id}/edit');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meeting.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Host: ${meeting.hostName}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey.shade600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusChip(context, meeting.status),
                ],
              ),
              const SizedBox(height: 12),

              // Description
              if (meeting.description.isNotEmpty) ...[
                Text(
                  meeting.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
              ],

              // Date and Time
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Text(
                    dateFormat.format(meeting.scheduledAt),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Text(
                    timeFormat.format(meeting.scheduledAt),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.timer, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Text(
                    meeting.formattedDuration,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              // Action Buttons
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Join button (if can join now)
                  if (meeting.canJoinNow && meeting.status == ScheduledMeetingStatus.scheduled)
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<ScheduledMeetingsBloc>().add(
                              ScheduledMeetingsEvent.startScheduledMeeting(meeting.id),
                            );
                      },
                      icon: const Icon(Icons.video_call, size: 18),
                      label: const Text('Join'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  const SizedBox(width: 8),

                  // Edit button
                  if (meeting.status == ScheduledMeetingStatus.scheduled)
                    IconButton(
                      onPressed: () {
                        context.push('/meetings/schedule/${meeting.id}/edit');
                      },
                      icon: const Icon(Icons.edit),
                      tooltip: 'Edit',
                    ),

                  // Delete button
                  if (meeting.status != ScheduledMeetingStatus.inProgress)
                    IconButton(
                      onPressed: () {
                        _showDeleteConfirmation(context, meeting);
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      tooltip: 'Delete',
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, ScheduledMeetingStatus status) {
    Color color;
    String label;

    switch (status) {
      case ScheduledMeetingStatus.scheduled:
        color = Colors.blue;
        label = 'Scheduled';
        break;
      case ScheduledMeetingStatus.inProgress:
        color = Colors.green;
        label = 'In Progress';
        break;
      case ScheduledMeetingStatus.ended:
        color = Colors.grey;
        label = 'Ended';
        break;
      case ScheduledMeetingStatus.cancelled:
        color = Colors.red;
        label = 'Cancelled';
        break;
    }

    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }

  void _showDeleteConfirmation(BuildContext context, ScheduledMeeting meeting) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Meeting'),
        content: Text('Are you sure you want to delete "${meeting.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<ScheduledMeetingsBloc>().add(
                    ScheduledMeetingsEvent.deleteScheduledMeeting(meeting.id),
                  );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
