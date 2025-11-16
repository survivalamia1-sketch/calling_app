import 'package:calling_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:calling_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:calling_app/features/call/presentation/bloc/connecting_event.dart';
import 'package:calling_app/features/call/presentation/bloc/preview_event.dart';
import 'package:calling_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:calling_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:calling_app/features/subscriptions/presentation/bloc/subscriptions_bloc.dart';
import 'package:calling_app/features/support/presentation/bloc/support_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/services/meeting_connection_service.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/pages/email_verification_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/call/presentation/bloc/connecting_bloc.dart';
import '../../features/call/presentation/bloc/in_meeting_bloc.dart';
import '../../features/call/presentation/bloc/in_meeting_event.dart';
import '../../features/call/presentation/bloc/preview_bloc.dart';
import '../../features/call/presentation/pages/connecting_page.dart';
import '../../features/call/presentation/pages/in_meeting_page.dart';
import '../../features/call/presentation/pages/join_preview_page.dart';
import '../../features/home/presentation/pages/home_dashboard_page.dart';
import '../../features/meetings/presentation/bloc/meetings_bloc.dart';
import '../../features/meetings/presentation/pages/create_schedule_page.dart';
import '../../features/meetings/presentation/pages/join_meeting_page.dart';
import '../../features/meetings/presentation/pages/meetings_list_page.dart';
import '../../features/meetings/presentation/pages/new_meeting_page.dart';
import '../../features/meetings/presentation/pages/scheduled_meetings_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/shell/presentation/pages/main_shell_page.dart';
import '../../features/splash/presentation/pages/splash_screen_page.dart';
import '../../features/subscriptions/presentation/pages/subscription_plans_page.dart';
import '../../features/support/presentation/pages/support_page.dart';
import '../di/injection.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) async {
      final authRepository = getIt<AuthRepository>();
      final isLoggedIn = await authRepository.isLoggedIn();

      final isSplash = state.matchedLocation == '/splash';
      final isOnboarding = state.matchedLocation == '/onboarding';
      final isAuthRoute = state.matchedLocation.startsWith('/auth');

      // Allow splash screen
      if (isSplash) return null;

      // If user is logged in and trying to access auth routes, redirect to home
      if (isLoggedIn && (isOnboarding || isAuthRoute)) {
        return '/home';
      }

      // If user is not logged in and trying to access protected routes
      if (!isLoggedIn && !isSplash && !isOnboarding && !isAuthRoute) {
        return '/auth/sign-in';
      }

      return null; // No redirect needed
    },
    routes: [
      // Splash Screen
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreenPage(),
      ),

      // Onboarding
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),

      // Auth Routes
      GoRoute(
        path: '/auth/sign-in',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthBloc>(),
          child: const SignInPage(),
        ),
      ),
      GoRoute(
        path: '/auth/sign-up',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthBloc>(),
          child: const SignUpPage(),
        ),
      ),
      GoRoute(
        path: '/auth/verify-email',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthBloc>(),
          child: const EmailVerificationPage(),
        ),
      ),
      GoRoute(
        path: '/auth/forgot-password',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthBloc>(),
          child: const ForgotPasswordPage(),
        ),
      ),

      // Main App Routes (Protected) - Wrapped in Shell
      ShellRoute(
        builder: (context, state, child) => MainShellPage(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeDashboardPage(),
          ),
          GoRoute(
            path: '/meetings',
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<MeetingsBloc>(),
              child: const MeetingsListPage(),
            ),
          ),
          GoRoute(
            path: '/subscriptions',
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<SubscriptionsBloc>(),
              child: const SubscriptionPlansPage(),
            ),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<SettingsBloc>(),
              child: const SettingsPage(),
            ),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => getIt<ProfileBloc>()),
                BlocProvider(
                  create: (_) => getIt<AuthBloc>()
                    ..add(const AuthEvent.getCurrentUserRequested()),
                ),
              ],
              child: const ProfilePage(),
            ),
          ),
        ],
      ),

      // Routes outside shell (full screen)

      // Meetings Routes
      GoRoute(
        path: '/meetings/new',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<MeetingsBloc>(),
          child: const NewMeetingPage(),
        ),
      ),
      GoRoute(
        path: '/meetings/join',
        builder: (context, state) => const JoinMeetingPage(),
      ),

      // Scheduled Meetings Routes
      GoRoute(
        path: '/meetings/schedule',
        builder: (context, state) => const ScheduledMeetingsPage(),
      ),
      GoRoute(
        path: '/meetings/schedule/create',
        builder: (context, state) => const CreateSchedulePage(),
      ),
      GoRoute(
        path: '/meetings/schedule/:id/edit',
        builder: (context, state) {
          final meetingId = state.pathParameters['id'];
          return CreateSchedulePage(meetingId: meetingId);
        },
      ),

      // Call Flow Routes (NEW: Preview → Connecting → Call)

      // Join Preview Page
      GoRoute(
        path: '/call/preview/:roomId',
        builder: (context, state) {
          final roomId = state.pathParameters['roomId']!;
          final roomName = state.uri.queryParameters['name'];
          return BlocProvider(
            create: (_) => PreviewBloc(
              roomId: roomId,
              deviceService: null, // Will be injected when implemented
            )..add(PreviewEvent.initialize(roomId)),
            child: JoinPreviewPage(
              roomId: roomId,
              roomName: roomName,
            ),
          );
        },
      ),

      // Connecting Page
      GoRoute(
        path: '/call/connecting/:roomId',
        builder: (context, state) {
          final roomId = state.pathParameters['roomId']!;
          // Get connection options from previous page or use defaults
          const options = ConnectionOptions(
            audioEnabled: true,
            videoEnabled: true,
          );

          return BlocProvider(
            create: (_) => ConnectingBloc(
              connectionService: null, // Will be injected when implemented
            )..add(ConnectingEvent.startConnecting(
                roomId: roomId,
                options: options,
              )),
            child: ConnectingPage(
              roomId: roomId,
              options: options,
            ),
          );
        },
      ),

      // Call Page (In-Meeting) - Using new comprehensive UI
      GoRoute(
        path: '/call/:roomId',
        builder: (context, state) {
          final roomId = state.pathParameters['roomId']!;

          // Get parameters from query or extra data
          final displayName = state.uri.queryParameters['displayName'] ??
              state.uri.queryParameters['name'] ??
              'Guest';
          final userId = state.uri.queryParameters['userId'] ??
              DateTime.now().millisecondsSinceEpoch.toString();
          final joinWithAudio = state.uri.queryParameters['audio'] != 'false';
          final joinWithVideo = state.uri.queryParameters['video'] != 'false';
          final password = state.uri.queryParameters['password'];

          return BlocProvider(
            create: (_) => getIt<InMeetingBloc>()
              ..add(InMeetingEvent.joinRoom(
                roomId: roomId,
                userId: userId,
                displayName: displayName,
                joinWithAudio: joinWithAudio,
                joinWithVideo: joinWithVideo,
                password: password,
              )),
            child: InMeetingPage(
              roomId: roomId,
              userId: userId,
              displayName: displayName,
              joinWithAudio: joinWithAudio,
              joinWithVideo: joinWithVideo,
              password: password,
            ),
          );
        },
      ),

      // Support
      GoRoute(
        path: '/support',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SupportBloc>(),
          child: const SupportPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(state.matchedLocation),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
