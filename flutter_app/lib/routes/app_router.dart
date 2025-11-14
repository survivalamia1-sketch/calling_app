import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../screens/onboarding/welcome_screen.dart';
import '../screens/auth/sign_in_screen.dart';
import '../screens/auth/sign_up_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/auth/email_verification_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/meetings/meetings_list_screen.dart';
import '../screens/meetings/create_meeting_screen.dart';
import '../screens/meetings/join_meeting_screen.dart';
import '../screens/call/call_screen.dart';
import '../screens/subscription/plans_screen.dart';
import '../screens/subscription/billing_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/profile/settings_screen.dart';
import '../screens/support/help_screen.dart';

class AppRouter {
  static GoRouter router(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return GoRouter(
      initialLocation: '/welcome',
      redirect: (context, state) async {
        final isAuthenticated = await authProvider.isAuthenticated;
        final isAuthRoute = state.matchedLocation.startsWith('/auth') ||
            state.matchedLocation == '/welcome';

        // If not authenticated and trying to access protected route
        if (!isAuthenticated && !isAuthRoute) {
          return '/welcome';
        }

        // If authenticated and trying to access auth routes
        if (isAuthenticated && isAuthRoute) {
          return '/home';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/welcome',
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: '/auth/sign-in',
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: '/auth/sign-up',
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: '/auth/forgot-password',
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
        GoRoute(
          path: '/auth/verify-email',
          builder: (context, state) => const EmailVerificationScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/meetings',
          builder: (context, state) => const MeetingsListScreen(),
        ),
        GoRoute(
          path: '/meetings/create',
          builder: (context, state) => const CreateMeetingScreen(),
        ),
        GoRoute(
          path: '/meetings/join',
          builder: (context, state) => const JoinMeetingScreen(),
        ),
        GoRoute(
          path: '/call/:meetingId',
          builder: (context, state) {
            final meetingId = state.pathParameters['meetingId']!;
            return CallScreen(meetingId: meetingId);
          },
        ),
        GoRoute(
          path: '/subscription/plans',
          builder: (context, state) => const PlansScreen(),
        ),
        GoRoute(
          path: '/subscription/billing',
          builder: (context, state) => const BillingScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/help',
          builder: (context, state) => const HelpScreen(),
        ),
      ],
    );
  }
}
