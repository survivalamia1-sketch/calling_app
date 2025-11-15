// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionPlanModel _$SubscriptionPlanModelFromJson(
        Map<String, dynamic> json) =>
    SubscriptionPlanModel(
      id: json['id'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num?)?.toInt() ?? 0,
      currency: json['currency'] as String? ?? 'usd',
      stripePriceId: json['stripe_price_id'] as String?,
      maxMeetingDuration: (json['max_meeting_duration'] as num?)?.toInt() ?? 0,
      maxParticipants: (json['max_participants'] as num?)?.toInt() ?? 0,
      canRecord: json['can_record'] as bool? ?? false,
      canScreenShare: json['can_screen_share'] as bool? ?? false,
      cloudStorageGB: (json['cloud_storage_gb'] as num?)?.toInt() ?? 0,
      canCustomBrand: json['can_custom_brand'] as bool? ?? false,
      hasApiAccess: json['has_api_access'] as bool? ?? false,
      hasPrioritySupport: json['has_priority_support'] as bool? ?? false,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$SubscriptionPlanModelToJson(
        SubscriptionPlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'stripe_price_id': instance.stripePriceId,
      'max_meeting_duration': instance.maxMeetingDuration,
      'max_participants': instance.maxParticipants,
      'can_record': instance.canRecord,
      'can_screen_share': instance.canScreenShare,
      'cloud_storage_gb': instance.cloudStorageGB,
      'can_custom_brand': instance.canCustomBrand,
      'has_api_access': instance.hasApiAccess,
      'has_priority_support': instance.hasPrioritySupport,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

UserSubscriptionModel _$UserSubscriptionModelFromJson(
        Map<String, dynamic> json) =>
    UserSubscriptionModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      planId: json['plan_id'] as String,
      status: json['status'] as String,
      billingCycle: json['billing_cycle'] as String?,
      currentPeriodStart: json['current_period_start'] as String?,
      currentPeriodEnd: json['current_period_end'] as String?,
      cancelAtPeriodEnd: json['cancel_at_period_end'] as bool? ?? false,
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
