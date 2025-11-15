import 'package:calling_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:calling_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:calling_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:calling_app/features/subscriptions/presentation/bloc/subscriptions_bloc.dart';
import 'package:calling_app/features/support/presentation/bloc/support_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/pages/email_verification_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/call/presentation/bloc/call_bloc.dart';
import '../../features/call/presentation/pages/call_page.dart';
import '../../features/home/presentation/pages/home_dashboard_page.dart';
import '../../features/meetings/presentation/bloc/meetings_bloc.dart';
import '../../features/meetings/presentation/pages/join_meeting_page.dart';
import '../../features/meetings/presentation/pages/meetings_list_page.dart';
import '../../features/meetings/presentation/pages/new_meeting_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/shell/presentation/pages/main_shell_page.dart';
import '../../features/subscriptions/presentation/pages/subscription_plans_page.dart';
import '../../features/support/presentation/pages/support_page.dart';
import '../di/injection.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/onboarding',
    redirect: (context, state) async {
      final authRepository = getIt<AuthRepository>();
      final isLoggedIn = await authRepository.isLoggedIn();

      final isOnboarding = state.matchedLocation == '/onboarding';
      final isAuthRoute = state.matchedLocation.startsWith('/auth');

      // If user is logged in and trying to access auth routes, redirect to home
      if (isLoggedIn && (isOnboarding || isAuthRoute)) {
        return '/home';
      }

      // If user is not logged in and trying to access protected routes
      if (!isLoggedIn && !isOnboarding && !isAuthRoute) {
        return '/auth/sign-in';
      }

      return null; // No redirect needed
    },
    routes: [
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
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<ProfileBloc>(),
              child: const ProfilePage(),
            ),
          ),
        ],
      ),

      // Routes outside shell (full screen)
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
      GoRoute(
        path: '/call/:roomId',
        builder: (context, state) {
          final roomId = state.pathParameters['roomId']!;
          return BlocProvider(
            create: (_) => getIt<CallBloc>(),
            child: CallPage(roomId: roomId),
          );
        },
      ),

      GoRoute(
        path: '/support',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SupportBloc>(),
          child: const SupportPage(),
        ),
      ),

      // TODO: Add other full-screen routes
      // - /meetings/:id (meeting details)
      // - /meetings/join (join by code)
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
