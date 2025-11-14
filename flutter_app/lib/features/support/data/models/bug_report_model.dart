import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/bug_report.dart';

part 'bug_report_model.g.dart';

@JsonSerializable()
class BugReportModel {
  final String title;
  final String description;
  @JsonKey(name: 'contact_email')
  final String? contactEmail;
  @JsonKey(name: 'device_info')
  final String? deviceInfo;
  @JsonKey(name: 'app_version')
  final String? appVersion;

  const BugReportModel({
    required this.title,
    required this.description,
    this.contactEmail,
    this.deviceInfo,
    this.appVersion,
  });

  factory BugReportModel.fromJson(Map<String, dynamic> json) =>
      _$BugReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$BugReportModelToJson(this);

  factory BugReportModel.fromDomain(BugReport bugReport) => BugReportModel(
        title: bugReport.title,
        description: bugReport.description,
        contactEmail: bugReport.contactEmail,
        deviceInfo: bugReport.deviceInfo,
        appVersion: bugReport.appVersion,
      );
}
