import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/dashboard_stats.dart';

part 'dashboard_stats_model.g.dart';

@JsonSerializable()
class DashboardStatsModel extends DashboardStats {
  const DashboardStatsModel({
    required super.totalMeetings,
    required super.upcomingMeetings,
    required super.totalHours,
    required super.totalParticipants,
    required super.meetingsThisMonth,
    required super.meetingsThisWeek,
    required super.meetingsToday,
  });

  factory DashboardStatsModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardStatsModelToJson(this);

  DashboardStats toDomain() => DashboardStats(
        totalMeetings: totalMeetings,
        upcomingMeetings: upcomingMeetings,
        totalHours: totalHours,
        totalParticipants: totalParticipants,
        meetingsThisMonth: meetingsThisMonth,
        meetingsThisWeek: meetingsThisWeek,
        meetingsToday: meetingsToday,
      );

  factory DashboardStatsModel.fromDomain(DashboardStats stats) =>
      DashboardStatsModel(
        totalMeetings: stats.totalMeetings,
        upcomingMeetings: stats.upcomingMeetings,
        totalHours: stats.totalHours,
        totalParticipants: stats.totalParticipants,
        meetingsThisMonth: stats.meetingsThisMonth,
        meetingsThisWeek: stats.meetingsThisWeek,
        meetingsToday: stats.meetingsToday,
      );
}
