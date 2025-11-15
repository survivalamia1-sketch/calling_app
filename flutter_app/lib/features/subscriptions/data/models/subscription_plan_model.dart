import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/subscription_plan.dart';

part 'subscription_plan_model.g.dart';

@JsonSerializable()
class SubscriptionPlanModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'price', defaultValue: 0)
  final int price; // in cents

  @JsonKey(name: 'currency', defaultValue: 'usd')
  final String currency;

  @JsonKey(name: 'stripe_price_id')
  final String? stripePriceId;

  @JsonKey(name: 'max_meeting_duration', defaultValue: 0)
  final int maxMeetingDuration; // in minutes (0 = unlimited)

  @JsonKey(name: 'max_participants', defaultValue: 0)
  final int maxParticipants;

  @JsonKey(name: 'can_record', defaultValue: false)
  final bool canRecord;

  @JsonKey(name: 'can_screen_share', defaultValue: false)
  final bool canScreenShare;

  @JsonKey(name: 'cloud_storage_gb', defaultValue: 0)
  final int cloudStorageGB;

  @JsonKey(name: 'can_custom_brand', defaultValue: false)
  final bool canCustomBrand;

  @JsonKey(name: 'has_api_access', defaultValue: false)
  final bool hasApiAccess;

  @JsonKey(name: 'has_priority_support', defaultValue: false)
  final bool hasPrioritySupport;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const SubscriptionPlanModel({
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

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionPlanModelToJson(this);

  SubscriptionPlan toDomain() {
    return SubscriptionPlan(
      id: id,
      type: type,
      name: name,
      description: description,
      price: price,
      currency: currency,
      stripePriceId: stripePriceId,
      maxMeetingDuration: maxMeetingDuration,
      maxParticipants: maxParticipants,
      canRecord: canRecord,
      canScreenShare: canScreenShare,
      cloudStorageGB: cloudStorageGB,
      canCustomBrand: canCustomBrand,
      hasApiAccess: hasApiAccess,
      hasPrioritySupport: hasPrioritySupport,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
    );
  }
}

@JsonSerializable()
class UserSubscriptionModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'plan_id')
  final String planId;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'billing_cycle')
  final String? billingCycle;

  @JsonKey(name: 'current_period_start')
  final String? currentPeriodStart;

  @JsonKey(name: 'current_period_end')
  final String? currentPeriodEnd;

  @JsonKey(name: 'cancel_at_period_end', defaultValue: false)
  final bool cancelAtPeriodEnd;

  @JsonKey(name: 'canceled_at')
  final String? canceledAt;

  @JsonKey(name: 'created_at')
  final String createdAt;

  const UserSubscriptionModel({
    required this.id,
    required this.userId,
    required this.planId,
    required this.status,
    this.billingCycle,
    this.currentPeriodStart,
    this.currentPeriodEnd,
    required this.cancelAtPeriodEnd,
    this.canceledAt,
    required this.createdAt,
  });

  factory UserSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSubscriptionModelToJson(this);

  UserSubscription toDomain() {
    return UserSubscription(
      id: id,
      userId: userId,
      planId: planId,
      status: status,
      billingCycle: billingCycle ?? 'monthly', // Default to monthly if null
      currentPeriodStart: currentPeriodStart != null
          ? DateTime.parse(currentPeriodStart!)
          : DateTime.now(),
      currentPeriodEnd: currentPeriodEnd != null
          ? DateTime.parse(currentPeriodEnd!)
          : DateTime.now().add(const Duration(days: 30)),
      cancelAtPeriodEnd: cancelAtPeriodEnd,
      canceledAt: canceledAt != null ? DateTime.parse(canceledAt!) : null,
      createdAt: DateTime.parse(createdAt),
    );
  }
}
