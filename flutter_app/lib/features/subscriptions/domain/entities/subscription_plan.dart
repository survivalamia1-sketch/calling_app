import 'package:equatable/equatable.dart';

class SubscriptionPlan extends Equatable {
  final String id;
  final String type; // 'free', 'pro', 'business'
  final String name;
  final String description;
  final int price; // in cents
  final String currency;
  final String? stripePriceId;
  final int maxMeetingDuration; // in minutes (0 = unlimited)
  final int maxParticipants;
  final bool canRecord;
  final bool canScreenShare;
  final int cloudStorageGB;
  final bool canCustomBrand;
  final bool hasApiAccess;
  final bool hasPrioritySupport;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SubscriptionPlan({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    this.stripePriceId,
    required this.maxMeetingDuration,
    required this.maxParticipants,
    required this.canRecord,
    required this.canScreenShare,
    required this.cloudStorageGB,
    required this.canCustomBrand,
    required this.hasApiAccess,
    required this.hasPrioritySupport,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isFree => type == 'free';
  bool get isPro => type == 'pro';
  bool get isBusiness => type == 'business';

  double get priceInDollars => price / 100.0;

  @override
  List<Object?> get props => [
        id,
        type,
        name,
        description,
        price,
        currency,
        stripePriceId,
        maxMeetingDuration,
        maxParticipants,
        canRecord,
        canScreenShare,
        cloudStorageGB,
        canCustomBrand,
        hasApiAccess,
        hasPrioritySupport,
        createdAt,
        updatedAt,
      ];
}

class UserSubscription extends Equatable {
  final String id;
  final String userId;
  final String planId;
  final String status; // 'active', 'canceled', 'expired', 'trial'
  final String billingCycle; // 'monthly', 'yearly'
  final DateTime currentPeriodStart;
  final DateTime currentPeriodEnd;
  final bool cancelAtPeriodEnd;
  final DateTime? canceledAt;
  final DateTime createdAt;

  const UserSubscription({
    required this.id,
    required this.userId,
    required this.planId,
    required this.status,
    required this.billingCycle,
    required this.currentPeriodStart,
    required this.currentPeriodEnd,
    required this.cancelAtPeriodEnd,
    this.canceledAt,
    required this.createdAt,
  });

  bool get isActive => status == 'active';
  bool get isCanceled => status == 'canceled';
  bool get isExpired => status == 'expired';
  bool get isTrial => status == 'trial';

  int get daysRemaining => currentPeriodEnd.difference(DateTime.now()).inDays;

  @override
  List<Object?> get props => [
        id,
        userId,
        planId,
        status,
        billingCycle,
        currentPeriodStart,
        currentPeriodEnd,
        cancelAtPeriodEnd,
        canceledAt,
        createdAt,
      ];
}
