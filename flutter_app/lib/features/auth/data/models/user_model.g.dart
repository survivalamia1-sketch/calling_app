// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatar: json['avatar'] as String?,
      isActive: json['is_active'] as bool,
      isVerified: json['email_verified'] as bool? ?? false,
      planType: json['subscription_plan'] as String,
      createdAt: json['created_at'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      lastLoginAt: json['last_login_at'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
      'is_active': instance.isActive,
      'email_verified': instance.isVerified,
      'subscription_plan': instance.planType,
      'created_at': instance.createdAt,
      'email_verified_at': instance.emailVerifiedAt,
      'last_login_at': instance.lastLoginAt,
    };
