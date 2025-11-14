import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                authenticated: (user) {
                  context.go('/home');
                },
                emailNotVerified: (user) {
                  context.go('/auth/verify-email');
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
              return const SignInForm();
            },
          ),
        ),
      ),
    );
  }
}
