import 'package:calling_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/stat_card.dart';
import '../widgets/upcoming_meetings_card.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.getCurrentUserRequested()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<DashboardBloc>()..add(const DashboardEvent.loadDashboard()),
        ),
      ],
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
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<DashboardBloc>().add(
                  const DashboardEvent.refreshDashboard(),
                );
            // Wait a bit for the refresh to complete
            await Future.delayed(const Duration(milliseconds: 500));
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              return authState.maybeWhen(
                authenticated: (user) =>
                    _buildDashboard(context, user.fullName),
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context, String userName) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, dashboardState) {
        return dashboardState.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (stats, upcomingMeetings) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.6),
                      ),
                ),
                const SizedBox(height: 32),

                // Stats Row - with real data from DashboardBloc
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
                              value: stats.totalMeetings.toString(),
                              subtitle: 'This month',
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: StatCard(
                              icon: Icons.schedule,
                              title: 'Upcoming',
                              value: stats.upcomingMeetings.toString(),
                              subtitle: 'This week',
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: StatCard(
                              icon: Icons.access_time,
                              title: 'Meeting Hours',
                              value: stats.totalHours.toStringAsFixed(1),
                              subtitle: 'This month',
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: StatCard(
                              icon: Icons.people,
                              title: 'Participants',
                              value: stats.totalParticipants.toString(),
                              subtitle: 'Total',
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
                                  value: stats.totalMeetings.toString(),
                                  subtitle: 'This month',
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: StatCard(
                                  icon: Icons.schedule,
                                  title: 'Upcoming',
                                  value: stats.upcomingMeetings.toString(),
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
                                  value: stats.totalHours.toStringAsFixed(1),
                                  subtitle: 'This month',
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: StatCard(
                                  icon: Icons.people,
                                  title: 'Participants',
                                  value: stats.totalParticipants.toString(),
                                  subtitle: 'Total',
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
                            value: stats.totalMeetings.toString(),
                            subtitle: 'This month',
                            color: Colors.blue,
                          ),
                          const SizedBox(height: 12),
                          StatCard(
                            icon: Icons.schedule,
                            title: 'Upcoming',
                            value: stats.upcomingMeetings.toString(),
                            subtitle: 'This week',
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 12),
                          StatCard(
                            icon: Icons.access_time,
                            title: 'Meeting Hours',
                            value: stats.totalHours.toStringAsFixed(1),
                            subtitle: 'This month',
                            color: Colors.green,
                          ),
                          const SizedBox(height: 12),
                          StatCard(
                            icon: Icons.people,
                            title: 'Participants',
                            value: stats.totalParticipants.toString(),
                            subtitle: 'Total',
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
                    final isDesktop = constraints.maxWidth >= 1024;

                    if (isDesktop) {
                      return Row(
                        children: [
                          Expanded(
                            child: QuickActionCard(
                              icon: Icons.video_call,
                              title: 'Start Meeting',
                              subtitle: 'Begin an instant meeting',
                              color: Colors.blue,
                              onTap: () {
                                context.push('/meetings/create');
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: QuickActionCard(
                              icon: Icons.calendar_today,
                              title: 'Schedule',
                              subtitle: 'Plan a future meeting',
                              color: Colors.green,
                              onTap: () {
                                context.push('/meetings/create?scheduled=true');
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: QuickActionCard(
                              icon: Icons.meeting_room,
                              title: 'Join Meeting',
                              subtitle: 'Enter with a code',
                              color: Colors.orange,
                              onTap: () {
                                context.push('/meetings/join');
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: QuickActionCard(
                              icon: Icons.screen_share,
                              title: 'Share Screen',
                              subtitle: 'Present your screen',
                              color: Colors.purple,
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Screen sharing available in call'),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.5,
                        children: [
                          QuickActionCard(
                            icon: Icons.video_call,
                            title: 'Start Meeting',
                            subtitle: 'Begin instant',
                            color: Colors.blue,
                            onTap: () {
                              context.push('/meetings/create');
                            },
                          ),
                          QuickActionCard(
                            icon: Icons.calendar_today,
                            title: 'Schedule',
                            subtitle: 'Plan future',
                            color: Colors.green,
                            onTap: () {
                              context.push('/meetings/create?scheduled=true');
                            },
                          ),
                          QuickActionCard(
                            icon: Icons.meeting_room,
                            title: 'Join Meeting',
                            subtitle: 'Enter code',
                            color: Colors.orange,
                            onTap: () {
                              context.push('/meetings/join');
                            },
                          ),
                          QuickActionCard(
                            icon: Icons.screen_share,
                            title: 'Share Screen',
                            subtitle: 'Present',
                            color: Colors.purple,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Screen sharing available in call'),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),

                const SizedBox(height: 32),

                // Upcoming Meetings - with real data from DashboardBloc
                Text(
                  'Upcoming Meetings',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                UpcomingMeetingsCard(meetings: upcomingMeetings),
              ],
            ),
          ),
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load dashboard',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<DashboardBloc>().add(
                          const DashboardEvent.loadDashboard(),
                        );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
