import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/subscription_provider.dart';
import '../../providers/auth_provider.dart';
import '../../models/subscription.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  bool _isYearly = false;

  @override
  void initState() {
    super.initState();
    _loadPlans();
  }

  Future<void> _loadPlans() async {
    final subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);
    await Future.wait([
      subscriptionProvider.loadPlans(),
      subscriptionProvider.loadSubscription(),
    ]);
  }

  Future<void> _handleUpgrade(SubscriptionPlan plan) async {
    final subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);

    final checkoutUrl = await subscriptionProvider.createCheckoutSession(
      plan.type,
      _isYearly ? 'yearly' : 'monthly',
    );

    if (checkoutUrl != null) {
      // Open Stripe checkout
      final uri = Uri.parse(checkoutUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              subscriptionProvider.error ?? 'Failed to create checkout session',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);
    final currentPlan = authProvider.user?.planType ?? 'free';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Plans'),
      ),
      body: subscriptionProvider.isLoading && subscriptionProvider.plans.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Billing Cycle Toggle
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _BillingTab(
                            title: 'Monthly',
                            isSelected: !_isYearly,
                            onTap: () => setState(() => _isYearly = false),
                          ),
                        ),
                        Expanded(
                          child: _BillingTab(
                            title: 'Yearly (Save 20%)',
                            isSelected: _isYearly,
                            onTap: () => setState(() => _isYearly = true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Plan Cards
                  ...subscriptionProvider.plans.map((plan) {
                    final isCurrent = plan.type == currentPlan;
                    final price = _isYearly ? plan.priceYearly : plan.priceMonthly;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _PlanCard(
                        plan: plan,
                        price: price,
                        interval: _isYearly ? 'year' : 'month',
                        isCurrent: isCurrent,
                        onSelect: () => _handleUpgrade(plan),
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 16),

                  // Billing Link
                  if (currentPlan != 'free')
                    TextButton(
                      onPressed: () => context.push('/subscription/billing'),
                      child: const Text('View Billing & Invoices'),
                    ),
                ],
              ),
            ),
    );
  }
}

class _BillingTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _BillingTab({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final int price;
  final String interval;
  final bool isCurrent;
  final VoidCallback onSelect;

  const _PlanCard({
    required this.plan,
    required this.price,
    required this.interval,
    required this.isCurrent,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isCurrent ? 4 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isCurrent
              ? Theme.of(context).primaryColor
              : Colors.grey[300]!,
          width: isCurrent ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  plan.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (isCurrent)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'CURRENT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              plan.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // Price
            if (!plan.isFree) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${(price / 100).toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      '/$interval',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ] else ...[
              Text(
                'Free',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            // Features
            ...plan.features.map((feature) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(feature),
                    ),
                  ],
                ),
              );
            }).toList(),

            const SizedBox(height: 20),

            // Action Button
            SizedBox(
              width: double.infinity,
              child: isCurrent
                  ? OutlinedButton(
                      onPressed: null,
                      child: const Text('Current Plan'),
                    )
                  : ElevatedButton(
                      onPressed: onSelect,
                      child: Text(plan.isFree ? 'Downgrade' : 'Upgrade'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
