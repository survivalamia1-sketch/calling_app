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
    if (plan.isEnterprise) return Colors.purple;
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    final price = isYearly ? plan.yearlyPriceMonthly : plan.monthlyPrice;
    final totalPrice = isYearly ? plan.yearlyPrice : plan.monthlyPrice;
    final planColor = _getPlanColor(context);

    return Card(
      elevation: plan.isPro ? 8 : 0,
      child: Container(
        decoration: BoxDecoration(
          border: plan.isPro
              ? Border.all(color: planColor, width: 2)
              : null,
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
                        color: planColor.withOpacity(0.1),
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
                          .withOpacity(0.6),
                    ),
              ),
              const SizedBox(height: 24),

              // Price
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${price.toStringAsFixed(0)}',
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
                                .withOpacity(0.6),
                          ),
                    ),
                  ),
                ],
              ),
              if (isYearly) ...[
                const SizedBox(height: 4),
                Text(
                  'Billed \$${totalPrice.toStringAsFixed(0)} yearly',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                ),
                Text(
                  'Save \$${plan.monthlySavings.toStringAsFixed(0)} per year',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
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
                    backgroundColor:
                        isCurrentPlan ? Colors.grey : planColor,
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

              // Features
              ...plan.features.map((feature) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: planColor,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    height: 1.5,
                                  ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),

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
                '${plan.maxMeetingDuration} min meeting duration',
              ),
              if (plan.maxMonthlyMeetings > 0) ...[
                const SizedBox(height: 8),
                _buildLimitItem(
                  context,
                  Icons.event,
                  '${plan.maxMonthlyMeetings} meetings/month',
                ),
              ] else ...[
                const SizedBox(height: 8),
                _buildLimitItem(
                  context,
                  Icons.event,
                  'Unlimited meetings',
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLimitItem(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
        ),
      ],
    );
  }
}
