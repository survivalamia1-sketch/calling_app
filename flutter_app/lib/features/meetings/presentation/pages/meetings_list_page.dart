import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../bloc/meetings_bloc.dart';
import '../widgets/meeting_card.dart';

class MeetingsListPage extends StatelessWidget {
  const MeetingsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MeetingsBloc>()
        ..add(const MeetingsEvent.loadMeetings()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meetings'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                context
                    .read<MeetingsBloc>()
                    .add(const MeetingsEvent.refreshMeetings());
              },
            ),
          ],
        ),
        body: BlocConsumer<MeetingsBloc, MeetingsState>(
          listener: (context, state) {
            state.maybeWhen(
              joinedMeeting: (roomId) {
                context.go('/call/$roomId');
              },
              error: (failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(failure.message),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (meetings) {
                if (meetings.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy,
                          size: 64,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.3),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No meetings yet',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Create your first meeting to get started',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.6),
                                  ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: () => context.push('/meetings/new'),
                          icon: const Icon(Icons.add),
                          label: const Text('Create Meeting'),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<MeetingsBloc>()
                        .add(const MeetingsEvent.refreshMeetings());
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: meetings.length,
                    itemBuilder: (context, index) {
                      final meeting = meetings[index];
                      return MeetingCard(
                        meeting: meeting,
                        onTap: () {
                          // TODO: Navigate to meeting details
                        },
                      );
                    },
                  ),
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.push('/meetings/new'),
          icon: const Icon(Icons.add),
          label: const Text('New Meeting'),
        ),
      ),
    );
  }
}
