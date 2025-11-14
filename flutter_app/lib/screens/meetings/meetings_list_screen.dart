import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/meeting_provider.dart';
import '../../models/meeting.dart';

class MeetingsListScreen extends StatefulWidget {
  const MeetingsListScreen({super.key});

  @override
  State<MeetingsListScreen> createState() => _MeetingsListScreenState();
}

class _MeetingsListScreenState extends State<MeetingsListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadMeetings();

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _loadMeetings();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadMeetings() async {
    final meetingProvider = Provider.of<MeetingProvider>(context, listen: false);
    final status = _tabController.index == 0 ? 'upcoming' : 'past';
    await meetingProvider.loadMyMeetings(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Meetings'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMeetingsList(true),
          _buildMeetingsList(false),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/meetings/create'),
        icon: const Icon(Icons.add),
        label: const Text('New Meeting'),
      ),
    );
  }

  Widget _buildMeetingsList(bool isUpcoming) {
    return Consumer<MeetingProvider>(
      builder: (context, meetingProvider, child) {
        if (meetingProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final meetings = isUpcoming
            ? meetingProvider.upcomingMeetings
            : meetingProvider.pastMeetings;

        if (meetings.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_busy_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  isUpcoming
                      ? 'No upcoming meetings'
                      : 'No past meetings',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                if (isUpcoming) ...[
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => context.push('/meetings/create'),
                    icon: const Icon(Icons.add),
                    label: const Text('Create Meeting'),
                  ),
                ],
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: _loadMeetings,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: meetings.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _MeetingCard(
                meeting: meetings[index],
                isUpcoming: isUpcoming,
                onDelete: () => _handleDelete(meetings[index].id),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _handleDelete(String meetingId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Meeting'),
        content: const Text('Are you sure you want to delete this meeting?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      final meetingProvider =
          Provider.of<MeetingProvider>(context, listen: false);
      final success = await meetingProvider.deleteMeeting(meetingId);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success
                  ? 'Meeting deleted'
                  : meetingProvider.error ?? 'Failed to delete meeting',
            ),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
      }
    }
  }
}

class _MeetingCard extends StatelessWidget {
  final Meeting meeting;
  final bool isUpcoming;
  final VoidCallback onDelete;

  const _MeetingCard({
    required this.meeting,
    required this.isUpcoming,
    required this.onDelete,
  });

  void _copyCode(BuildContext context) {
    Clipboard.setData(ClipboardData(text: meeting.meetingCode ?? ''));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Meeting code copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meeting.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            meeting.scheduledAt != null
                                ? DateFormat('MMM d, y • h:mm a')
                                    .format(meeting.scheduledAt!)
                                : meeting.startedAt != null
                                    ? DateFormat('MMM d, y • h:mm a')
                                        .format(meeting.startedAt!)
                                    : 'No date',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: meeting.isActive
                        ? Colors.green.withOpacity(0.1)
                        : meeting.isEnded
                            ? Colors.grey.withOpacity(0.1)
                            : Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    meeting.status.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: meeting.isActive
                          ? Colors.green[700]
                          : meeting.isEnded
                              ? Colors.grey[700]
                              : Colors.blue[700],
                    ),
                  ),
                ),
              ],
            ),
            if (meeting.meetingCode != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Code: ${meeting.meetingCode}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'monospace',
                        ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, size: 16),
                    onPressed: () => _copyCode(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
            if (meeting.formattedDuration != null) ...[
              const SizedBox(height: 4),
              Text(
                'Duration: ${meeting.formattedDuration}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!meeting.isEnded && isUpcoming) ...[
                  OutlinedButton.icon(
                    onPressed: () => context.push('/call/${meeting.id}'),
                    icon: const Icon(Icons.video_call, size: 18),
                    label: const Text('Join'),
                  ),
                  const SizedBox(width: 8),
                ],
                if (isUpcoming)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: onDelete,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
