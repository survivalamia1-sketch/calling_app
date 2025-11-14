import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isActive;
  final bool isVerified;
  final String planType;
  final DateTime createdAt;
  final DateTime? emailVerifiedAt;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.isVerified,
    required this.planType,
    required this.createdAt,
    this.emailVerifiedAt,
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
        isActive,
        isVerified,
        planType,
        createdAt,
        emailVerifiedAt,
      ];
}
