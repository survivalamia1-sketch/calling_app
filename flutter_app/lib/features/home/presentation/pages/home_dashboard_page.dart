import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../core/di/injection.dart';
import '../widgets/stat_card.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/upcoming_meetings_card.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>()
        ..add(const AuthEvent.getCurrentUserRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {
                // TODO: Navigate to notifications
              },
            ),
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                context.push('/support');
              },
            ),
          ],
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.maybeWhen(
              authenticated: (user) => _buildDashboard(context, user.fullName),
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context, String userName) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Message
          Text(
            'Welcome back, $userName!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Here\'s what\'s happening with your meetings today.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
          const SizedBox(height: 32),

          // Stats Row
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 1024;
              final isTablet = constraints.maxWidth >= 640;

              if (isDesktop) {
                return Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        icon: Icons.video_call,
                        title: 'Total Meetings',
                        value: '24',
                        subtitle: 'This month',
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: StatCard(
                        icon: Icons.schedule,
                        title: 'Upcoming',
                        value: '5',
                        subtitle: 'This week',
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: StatCard(
                        icon: Icons.access_time,
                        title: 'Meeting Hours',
                        value: '12.5',
                        subtitle: 'This month',
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: StatCard(
                        icon: Icons.people,
                        title: 'Participants',
                        value: '48',
                        subtitle: 'Average',
                        color: Colors.purple,
                      ),
                    ),
                  ],
                );
              } else if (isTablet) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            icon: Icons.video_call,
                            title: 'Total Meetings',
                            value: '24',
                            subtitle: 'This month',
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: StatCard(
                            icon: Icons.schedule,
                            title: 'Upcoming',
                            value: '5',
                            subtitle: 'This week',
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            icon: Icons.access_time,
                            title: 'Meeting Hours',
                            value: '12.5',
                            subtitle: 'This month',
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: StatCard(
                            icon: Icons.people,
                            title: 'Participants',
                            value: '48',
                            subtitle: 'Average',
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    StatCard(
                      icon: Icons.video_call,
                      title: 'Total Meetings',
                      value: '24',
                      subtitle: 'This month',
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 12),
                    StatCard(
                      icon: Icons.schedule,
                      title: 'Upcoming',
                      value: '5',
                      subtitle: 'This week',
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 12),
                    StatCard(
                      icon: Icons.access_time,
                      title: 'Meeting Hours',
                      value: '12.5',
                      subtitle: 'This month',
                      color: Colors.green,
                    ),
                    const SizedBox(height: 12),
                    StatCard(
                      icon: Icons.people,
                      title: 'Participants',
                      value: '48',
                      subtitle: 'Average',
                      color: Colors.purple,
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 32),

          // Quick Actions
          Text(
            'Quick Actions',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth >= 1024
                  ? 4
                  : constraints.maxWidth >= 640
                      ? 2
                      : 2;

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  QuickActionCard(
                    icon: Icons.video_call,
                    title: 'Start Meeting',
                    subtitle: 'Instant meeting',
                    color: Colors.blue,
                    onTap: () => context.push('/meetings/new'),
                  ),
                  QuickActionCard(
                    icon: Icons.schedule,
                    title: 'Schedule',
                    subtitle: 'Plan ahead',
                    color: Colors.orange,
                    onTap: () => context.push('/meetings/new'),
                  ),
                  QuickActionCard(
                    icon: Icons.input,
                    title: 'Join Meeting',
                    subtitle: 'Enter code',
                    color: Colors.green,
                    onTap: () {
                      // TODO: Show join dialog
                    },
                  ),
                  QuickActionCard(
                    icon: Icons.screen_share,
                    title: 'Share Screen',
                    subtitle: 'Present now',
                    color: Colors.purple,
                    onTap: () => context.push('/meetings/new'),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 32),

          // Upcoming Meetings
          const UpcomingMeetingsCard(),
        ],
      ),
    );
  }
}
