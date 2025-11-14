class Subscription {
  final String id;
  final String userId;
  final String planType;
  final String status;
  final DateTime currentPeriodStart;
  final DateTime currentPeriodEnd;
  final bool cancelAtPeriodEnd;
  final String? stripeSubscriptionId;
  final DateTime createdAt;

  Subscription({
    required this.id,
    required this.userId,
    required this.planType,
    required this.status,
    required this.currentPeriodStart,
    required this.currentPeriodEnd,
    required this.cancelAtPeriodEnd,
    this.stripeSubscriptionId,
    required this.createdAt,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'],
      userId: json['user_id'],
      planType: json['plan_type'],
      status: json['status'],
      currentPeriodStart: DateTime.parse(json['current_period_start']),
      currentPeriodEnd: DateTime.parse(json['current_period_end']),
      cancelAtPeriodEnd: json['cancel_at_period_end'] ?? false,
      stripeSubscriptionId: json['stripe_subscription_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  bool get isActive => status == 'active';
  bool get isTrialing => status == 'trialing';
  bool get isCanceled => status == 'canceled';
  bool get isPastDue => status == 'past_due';

  bool get isExpiringSoon {
    final daysUntilExpiry = currentPeriodEnd.difference(DateTime.now()).inDays;
    return daysUntilExpiry <= 7;
  }
}

class SubscriptionPlan {
  final String id;
  final String type;
  final String name;
  final String description;
  final int priceMonthly;
  final int priceYearly;
  final int maxParticipants;
  final int maxDuration; // in minutes, 0 = unlimited
  final bool recordingEnabled;
  final bool screenSharingEnabled;
  final List<String> features;

  SubscriptionPlan({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.priceMonthly,
    required this.priceYearly,
    required this.maxParticipants,
    required this.maxDuration,
    required this.recordingEnabled,
    required this.screenSharingEnabled,
    required this.features,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      description: json['description'],
      priceMonthly: json['price_monthly'],
      priceYearly: json['price_yearly'],
      maxParticipants: json['max_participants'],
      maxDuration: json['max_duration'] ?? 0,
      recordingEnabled: json['recording_enabled'] ?? false,
      screenSharingEnabled: json['screen_sharing_enabled'] ?? true,
      features: List<String>.from(json['features'] ?? []),
    );
  }

  String get formattedPriceMonthly {
    return '\$${(priceMonthly / 100).toStringAsFixed(2)}';
  }

  String get formattedPriceYearly {
    return '\$${(priceYearly / 100).toStringAsFixed(2)}';
  }

  bool get isFree => type == 'free';
}
