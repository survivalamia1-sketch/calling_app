import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/profile_update.dart';

part 'profile_update_model.g.dart';

@JsonSerializable()
class ProfileUpdateModel {
  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  const ProfileUpdateModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.avatarUrl,
  });

  factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUpdateModelToJson(this);

  factory ProfileUpdateModel.fromDomain(ProfileUpdate profileUpdate) =>
      ProfileUpdateModel(
        firstName: profileUpdate.firstName,
        lastName: profileUpdate.lastName,
        phoneNumber: profileUpdate.phoneNumber,
        avatarUrl: profileUpdate.avatarUrl,
      );
}

@JsonSerializable()
class PasswordChangeModel {
  @JsonKey(name: 'old_password')
  final String currentPassword;

  @JsonKey(name: 'new_password')
  final String newPassword;

  const PasswordChangeModel({
    required this.currentPassword,
    required this.newPassword,
  });

  factory PasswordChangeModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordChangeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordChangeModelToJson(this);

  factory PasswordChangeModel.fromDomain(PasswordChange passwordChange) =>
      PasswordChangeModel(
        currentPassword: passwordChange.currentPassword,
        newPassword: passwordChange.newPassword,
      );
}
