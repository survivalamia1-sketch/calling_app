import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? avatar;
  final bool isActive;
  final bool isVerified;
  final String planType;
  final DateTime createdAt;
  final DateTime? emailVerifiedAt;
  final DateTime? lastLoginAt;

  const User({
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

  String get fullName => '$firstName $lastName'.trim();

  bool get isFree => planType == 'free';
  bool get isPro => planType == 'pro';
  bool get isBusiness => planType == 'business';

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
        isActive,
        isVerified,
        planType,
        createdAt,
        emailVerifiedAt,
        lastLoginAt,
      ];
}
