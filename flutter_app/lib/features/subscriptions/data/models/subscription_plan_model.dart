import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/subscription_plan.dart';

part 'subscription_plan_model.g.dart';

@JsonSerializable()
class SubscriptionPlanModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'monthly_price')
  final double monthlyPrice;

  @JsonKey(name: 'yearly_price')
  final double yearlyPrice;

  @JsonKey(name: 'max_participants')
  final int maxParticipants;

  @JsonKey(name: 'max_meeting_duration')
  final int maxMeetingDuration;

  @JsonKey(name: 'max_monthly_meetings')
  final int maxMonthlyMeetings;

  @JsonKey(name: 'has_recording')
  final bool hasRecording;

  @JsonKey(name: 'has_screen_share')
  final bool hasScreenShare;

  @JsonKey(name: 'has_waiting_room')
  final bool hasWaitingRoom;

  @JsonKey(name: 'has_custom_branding')
  final bool hasCustomBranding;

  @JsonKey(name: 'priority')
  final String priority;

  @JsonKey(name: 'features')
  final List<String> features;

  const SubscriptionPlanModel({
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

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionPlanModelToJson(this);

  SubscriptionPlan toDomain() {
    return SubscriptionPlan(
      id: id,
      name: name,
      description: description,
      monthlyPrice: monthlyPrice,
      yearlyPrice: yearlyPrice,
      maxParticipants: maxParticipants,
      maxMeetingDuration: maxMeetingDuration,
      maxMonthlyMeetings: maxMonthlyMeetings,
      hasRecording: hasRecording,
      hasScreenShare: hasScreenShare,
      hasWaitingRoom: hasWaitingRoom,
      hasCustomBranding: hasCustomBranding,
      priority: priority,
      features: features,
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
  final String billingCycle;

  @JsonKey(name: 'current_period_start')
  final String currentPeriodStart;

  @JsonKey(name: 'current_period_end')
  final String currentPeriodEnd;

  @JsonKey(name: 'cancel_at_period_end')
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
    required this.billingCycle,
    required this.currentPeriodStart,
    required this.currentPeriodEnd,
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
      billingCycle: billingCycle,
      currentPeriodStart: DateTime.parse(currentPeriodStart),
      currentPeriodEnd: DateTime.parse(currentPeriodEnd),
      cancelAtPeriodEnd: cancelAtPeriodEnd,
      canceledAt: canceledAt != null ? DateTime.parse(canceledAt!) : null,
      createdAt: DateTime.parse(createdAt),
    );
  }
}
