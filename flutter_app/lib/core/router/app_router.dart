import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../di/injection.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/auth/presentation/pages/email_verification_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/shell/presentation/pages/main_shell_page.dart';
import '../../features/home/presentation/pages/home_dashboard_page.dart';
import '../../features/meetings/presentation/pages/meetings_list_page.dart';

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
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/auth/sign-up',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/auth/verify-email',
        builder: (context, state) => const EmailVerificationPage(),
      ),
      GoRoute(
        path: '/auth/forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
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
            builder: (context, state) => const MeetingsListPage(),
          ),
          GoRoute(
            path: '/subscriptions',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Subscriptions Page - TODO'),
              ),
            ),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Settings Page - TODO'),
              ),
            ),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Profile Page - TODO'),
              ),
            ),
          ),
        ],
      ),

      // Routes outside shell (full screen)
      GoRoute(
        path: '/meetings/new',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('New Meeting Page - TODO'),
          ),
        ),
      ),
      GoRoute(
        path: '/call/:roomId',
        builder: (context, state) {
          final roomId = state.pathParameters['roomId']!;
          return Scaffold(
            body: Center(
              child: Text('Call Page - Room: $roomId - TODO'),
            ),
          );
        },
      ),

      // TODO: Add other full-screen routes
      // - /meetings/:id (meeting details)
      // - /meetings/join (join by code)
      // - /support
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
