import 'package:equatable/equatable.dart';

class BugReport extends Equatable {
  final String title;
  final String description;
  final String? contactEmail;
  final String? deviceInfo;
  final String? appVersion;

  const BugReport({
    required this.title,
    required this.description,
    this.contactEmail,
    this.deviceInfo,
    this.appVersion,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        contactEmail,
        deviceInfo,
        appVersion,
      ];
}
