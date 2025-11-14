import 'package:equatable/equatable.dart';

class ProfileUpdate extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? avatarUrl;

  const ProfileUpdate({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [firstName, lastName, phoneNumber, avatarUrl];
}

class PasswordChange extends Equatable {
  final String currentPassword;
  final String newPassword;

  const PasswordChange({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
