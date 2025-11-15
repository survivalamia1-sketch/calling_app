// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionPlanModel _$SubscriptionPlanModelFromJson(
        Map<String, dynamic> json) =>
    SubscriptionPlanModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      monthlyPrice: (json['monthly_price'] as num).toDouble(),
      yearlyPrice: (json['yearly_price'] as num).toDouble(),
      maxParticipants: (json['max_participants'] as num).toInt(),
      maxMeetingDuration: (json['max_meeting_duration'] as num).toInt(),
      maxMonthlyMeetings: (json['max_monthly_meetings'] as num).toInt(),
      hasRecording: json['has_recording'] as bool,
      hasScreenShare: json['has_screen_share'] as bool,
      hasWaitingRoom: json['has_waiting_room'] as bool,
      hasCustomBranding: json['has_custom_branding'] as bool,
      priority: json['priority'] as String,
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SubscriptionPlanModelToJson(
        SubscriptionPlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'monthly_price': instance.monthlyPrice,
      'yearly_price': instance.yearlyPrice,
      'max_participants': instance.maxParticipants,
      'max_meeting_duration': instance.maxMeetingDuration,
      'max_monthly_meetings': instance.maxMonthlyMeetings,
      'has_recording': instance.hasRecording,
      'has_screen_share': instance.hasScreenShare,
      'has_waiting_room': instance.hasWaitingRoom,
      'has_custom_branding': instance.hasCustomBranding,
      'priority': instance.priority,
      'features': instance.features,
    };

UserSubscriptionModel _$UserSubscriptionModelFromJson(
        Map<String, dynamic> json) =>
    UserSubscriptionModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      planId: json['plan_id'] as String,
      status: json['status'] as String,
      billingCycle: json['billing_cycle'] as String,
      currentPeriodStart: json['current_period_start'] as String,
      currentPeriodEnd: json['current_period_end'] as String,
      cancelAtPeriodEnd: json['cancel_at_period_end'] as bool,
      canceledAt: json['canceled_at'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$UserSubscriptionModelToJson(
        UserSubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'plan_id': instance.planId,
      'status': instance.status,
      'billing_cycle': instance.billingCycle,
      'current_period_start': instance.currentPeriodStart,
      'current_period_end': instance.currentPeriodEnd,
      'cancel_at_period_end': instance.cancelAtPeriodEnd,
      'canceled_at': instance.canceledAt,
      'created_at': instance.createdAt,
    };
