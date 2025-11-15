// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bug_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BugReportModel _$BugReportModelFromJson(Map<String, dynamic> json) =>
    BugReportModel(
      title: json['title'] as String,
      description: json['description'] as String,
      contactEmail: json['contact_email'] as String?,
      deviceInfo: json['device_info'] as String?,
      appVersion: json['app_version'] as String?,
    );

Map<String, dynamic> _$BugReportModelToJson(BugReportModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'contact_email': instance.contactEmail,
      'device_info': instance.deviceInfo,
      'app_version': instance.appVersion,
    };
