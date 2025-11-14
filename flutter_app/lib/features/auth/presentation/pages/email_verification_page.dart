import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_button.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                verificationEmailSent: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Verification email sent!'),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  );
                },
                authenticated: (user) {
                  context.go('/home');
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
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email Icon
                        Icon(
                          Icons.email_outlined,
                          size: 80,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 32),

                        // Title
                        Text(
                          'Verify Your Email',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),

                        // Description
                        Text(
                          'We\'ve sent a verification link to your email address. Please check your inbox and click the link to verify your account.',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.6),
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 48),

                        // Resend Email Button
                        CustomButton(
                          text: 'Resend Verification Email',
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.resendVerificationRequested());
                          },
                          isLoading: isLoading,
                          isOutlined: true,
                        ),
                        const SizedBox(height: 16),

                        // Check Verification Status Button
                        CustomButton(
                          text: 'I\'ve Verified My Email',
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.checkAuthStatus());
                          },
                          isLoading: isLoading,
                        ),
                        const SizedBox(height: 24),

                        // Back to Sign In
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      context.read<AuthBloc>().add(
                                          const AuthEvent.signOutRequested());
                                      context.go('/auth/sign-in');
                                    },
                              child: const Text('Back to Sign In'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
