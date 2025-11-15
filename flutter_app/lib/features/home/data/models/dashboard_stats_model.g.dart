// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardStatsModel _$DashboardStatsModelFromJson(Map<String, dynamic> json) =>
    DashboardStatsModel(
      totalMeetings: (json['totalMeetings'] as num).toInt(),
      upcomingMeetings: (json['upcomingMeetings'] as num).toInt(),
      totalHours: (json['totalHours'] as num).toDouble(),
      totalParticipants: (json['totalParticipants'] as num).toInt(),
      meetingsThisMonth: (json['meetingsThisMonth'] as num).toInt(),
      meetingsThisWeek: (json['meetingsThisWeek'] as num).toInt(),
      meetingsToday: (json['meetingsToday'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardStatsModelToJson(
        DashboardStatsModel instance) =>
    <String, dynamic>{
      'totalMeetings': instance.totalMeetings,
      'upcomingMeetings': instance.upcomingMeetings,
      'totalHours': instance.totalHours,
      'totalParticipants': instance.totalParticipants,
      'meetingsThisMonth': instance.meetingsThisMonth,
      'meetingsThisWeek': instance.meetingsThisWeek,
      'meetingsToday': instance.meetingsToday,
    };
