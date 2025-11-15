import 'package:calling_app/features/subscriptions/presentation/bloc/subscriptions_event.dart';
import 'package:calling_app/features/subscriptions/presentation/bloc/subscriptions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/di/injection.dart';
import '../bloc/subscriptions_bloc.dart';
import '../widgets/plan_card.dart';

class SubscriptionPlansPage extends StatefulWidget {
  const SubscriptionPlansPage({super.key});

  @override
  State<SubscriptionPlansPage> createState() => _SubscriptionPlansPageState();
}

class _SubscriptionPlansPageState extends State<SubscriptionPlansPage> {
  bool _isYearly = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SubscriptionsBloc>()..add(const SubscriptionsEvent.loadPlans()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Subscription Plans'),
        ),
        body: BlocConsumer<SubscriptionsBloc, SubscriptionsState>(
          listener: (context, state) {
            state.maybeWhen(
              checkoutUrlGenerated: (url) async {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Could not open checkout page'),
                      ),
                    );
                  }
                }
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
              plansLoaded: (plans, currentSubscription) {
                if (plans.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.3),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No plans available',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  );
                }

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Current Plan Status
                      if (currentSubscription != null) ...[
                        Card(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Plan',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      currentSubscription.status.toUpperCase(),
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${currentSubscription.daysRemaining} days left',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Billing Cycle Toggle
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest
                                .withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildToggleButton(
                                context,
                                'Monthly',
                                !_isYearly,
                                () => setState(() => _isYearly = false),
                              ),
                              _buildToggleButton(
                                context,
                                'Yearly (Save up to 20%)',
                                _isYearly,
                                () => setState(() => _isYearly = true),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Plans
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth >= 1024) {
                            // Desktop: 3 columns
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: plans.map((plan) {
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: PlanCard(
                                      plan: plan,
                                      isYearly: _isYearly,
                                      isCurrentPlan:
                                          currentSubscription?.planId ==
                                              plan.id,
                                      onSubscribe: () {
                                        _handleSubscribe(context, plan.id);
                                      },
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            // Mobile/Tablet: Vertical list
                            return Column(
                              children: plans.map((plan) {
                                return PlanCard(
                                  plan: plan,
                                  isYearly: _isYearly,
                                  isCurrentPlan:
                                      currentSubscription?.planId == plan.id,
                                  onSubscribe: () {
                                    _handleSubscribe(context, plan.id);
                                  },
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  Widget _buildToggleButton(
    BuildContext context,
    String text,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _handleSubscribe(BuildContext context, String planId) {
    context.read<SubscriptionsBloc>().add(
          SubscriptionsEvent.subscribe(
            planId: planId,
            billingCycle: _isYearly ? 'yearly' : 'monthly',
          ),
        );
  }
}
