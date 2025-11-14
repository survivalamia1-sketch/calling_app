import 'package:equatable/equatable.dart';

class SubscriptionPlan extends Equatable {
  final String id;
  final String name;
  final String description;
  final double monthlyPrice;
  final double yearlyPrice;
  final int maxParticipants;
  final int maxMeetingDuration; // in minutes
  final int maxMonthlyMeetings;
  final bool hasRecording;
  final bool hasScreenShare;
  final bool hasWaitingRoom;
  final bool hasCustomBranding;
  final String priority; // 'free', 'pro', 'enterprise'
  final List<String> features;

  const SubscriptionPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.maxParticipants,
    required this.maxMeetingDuration,
    required this.maxMonthlyMeetings,
    required this.hasRecording,
    required this.hasScreenShare,
    required this.hasWaitingRoom,
    required this.hasCustomBranding,
    required this.priority,
    required this.features,
  });

  bool get isFree => priority == 'free';
  bool get isPro => priority == 'pro';
  bool get isEnterprise => priority == 'enterprise';

  double get monthlySavings => (monthlyPrice * 12) - yearlyPrice;
  double get yearlyPriceMonthly => yearlyPrice / 12;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        monthlyPrice,
        yearlyPrice,
        maxParticipants,
        maxMeetingDuration,
        maxMonthlyMeetings,
        hasRecording,
        hasScreenShare,
        hasWaitingRoom,
        hasCustomBranding,
        priority,
        features,
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

  int get daysRemaining =>
      currentPeriodEnd.difference(DateTime.now()).inDays;

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
