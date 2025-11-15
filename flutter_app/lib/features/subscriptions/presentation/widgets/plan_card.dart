import 'package:flutter/material.dart';

import '../../domain/entities/subscription_plan.dart';

class PlanCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isYearly;
  final bool isCurrentPlan;
  final VoidCallback onSubscribe;

  const PlanCard({
    super.key,
    required this.plan,
    required this.isYearly,
    required this.isCurrentPlan,
    required this.onSubscribe,
  });

  Color _getPlanColor(BuildContext context) {
    if (plan.isFree) return Colors.grey;
    if (plan.isPro) return Colors.blue;
    if (plan.isBusiness) return Colors.purple;
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    // Backend sends price in cents, convert to dollars
    final priceInDollars = plan.priceInDollars;
    final planColor = _getPlanColor(context);

    return Card(
      elevation: plan.isPro ? 8 : 0,
      child: Container(
        decoration: BoxDecoration(
          border: plan.isPro ? Border.all(color: planColor, width: 2) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plan Name & Badge
              Row(
                children: [
                  Text(
                    plan.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (plan.isPro) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: planColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'POPULAR',
                        style: TextStyle(
                          color: planColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 8),

              // Description
              Text(
                plan.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.6),
                    ),
              ),
              const SizedBox(height: 24),

              // Price
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${priceInDollars.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: planColor,
                        ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      '/month',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.6),
                          ),
                    ),
                  ),
                ],
              ),
              if (plan.price > 0) ...[
                const SizedBox(height: 4),
                Text(
                  'Billed \$${(priceInDollars * 12).toStringAsFixed(2)} yearly',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.6),
                      ),
                ),
              ],
              const SizedBox(height: 24),

              // Subscribe Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isCurrentPlan ? null : onSubscribe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCurrentPlan ? Colors.grey : planColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    isCurrentPlan ? 'Current Plan' : 'Subscribe',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Features (built from plan properties)
              if (plan.canRecord)
                _buildFeatureItem(context, planColor, 'Recording'),
              if (plan.canScreenShare)
                _buildFeatureItem(context, planColor, 'Screen Sharing'),
              if (plan.canCustomBrand)
                _buildFeatureItem(context, planColor, 'Custom Branding'),
              if (plan.hasApiAccess)
                _buildFeatureItem(context, planColor, 'API Access'),
              if (plan.hasPrioritySupport)
                _buildFeatureItem(context, planColor, 'Priority Support'),
              if (plan.cloudStorageGB > 0)
                _buildFeatureItem(
                  context,
                  planColor,
                  '${plan.cloudStorageGB} GB Cloud Storage',
                ),

              // Technical Limits
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              _buildLimitItem(
                context,
                Icons.people,
                'Up to ${plan.maxParticipants} participants',
              ),
              const SizedBox(height: 8),
              _buildLimitItem(
                context,
                Icons.access_time,
                plan.maxMeetingDuration > 0
                    ? '${plan.maxMeetingDuration} min meeting duration'
                    : 'Unlimited meeting duration',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    Color color,
    String feature,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            size: 20,
            color: color,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              feature,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLimitItem(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.6),
              ),
        ),
      ],
    );
  }
}
