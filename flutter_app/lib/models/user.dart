class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isActive;
  final bool isVerified;
  final String planType;
  final DateTime createdAt;
  final DateTime? emailVerifiedAt;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      isActive: json['is_active'] ?? true,
      isVerified: json['is_verified'] ?? false,
      planType: json['plan_type'] ?? 'free',
      createdAt: DateTime.parse(json['created_at']),
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'is_active': isActive,
      'is_verified': isVerified,
      'plan_type': planType,
      'created_at': createdAt.toIso8601String(),
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
    };
  }

  String get fullName => '$firstName $lastName'.trim();

  bool get isFree => planType == 'free';
  bool get isPro => planType == 'pro';
  bool get isBusiness => planType == 'business';
}
