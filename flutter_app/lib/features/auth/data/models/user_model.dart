import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'is_active')
  final bool isActive;

  @JsonKey(name: 'email_verified', defaultValue: false)
  final bool isVerified;

  @JsonKey(name: 'subscription_plan')
  final String planType;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;

  @JsonKey(name: 'last_login_at')
  final String? lastLoginAt;

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.avatar,
    required this.isActive,
    required this.isVerified,
    required this.planType,
    required this.createdAt,
    this.emailVerifiedAt,
    this.lastLoginAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toDomain() {
    return User(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
      isActive: isActive,
      isVerified: isVerified,
      planType: planType,
      createdAt: DateTime.parse(createdAt),
      emailVerifiedAt:
          emailVerifiedAt != null ? DateTime.parse(emailVerifiedAt!) : null,
      lastLoginAt: lastLoginAt != null ? DateTime.parse(lastLoginAt!) : null,
    );
  }

  factory UserModel.fromDomain(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      avatar: user.avatar,
      isActive: user.isActive,
      isVerified: user.isVerified,
      planType: user.planType,
      createdAt: user.createdAt.toIso8601String(),
      emailVerifiedAt: user.emailVerifiedAt?.toIso8601String(),
      lastLoginAt: user.lastLoginAt?.toIso8601String(),
    );
  }
}
