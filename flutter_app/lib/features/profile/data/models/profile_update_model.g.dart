// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUpdateModel _$ProfileUpdateModelFromJson(Map<String, dynamic> json) =>
    ProfileUpdateModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$ProfileUpdateModelToJson(ProfileUpdateModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'avatar_url': instance.avatarUrl,
    };

PasswordChangeModel _$PasswordChangeModelFromJson(Map<String, dynamic> json) =>
    PasswordChangeModel(
      currentPassword: json['old_password'] as String,
      newPassword: json['new_password'] as String,
    );

Map<String, dynamic> _$PasswordChangeModelToJson(
        PasswordChangeModel instance) =>
    <String, dynamic>{
      'old_password': instance.currentPassword,
      'new_password': instance.newPassword,
    };
