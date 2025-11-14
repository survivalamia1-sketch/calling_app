import 'package:equatable/equatable.dart';

class DashboardStats extends Equatable {
  final int totalMeetings;
  final int upcomingMeetings;
  final double totalHours;
  final int totalParticipants;
  final int meetingsThisMonth;
  final int meetingsThisWeek;
  final int meetingsToday;

  const DashboardStats({
    required this.totalMeetings,
    required this.upcomingMeetings,
    required this.totalHours,
    required this.totalParticipants,
    required this.meetingsThisMonth,
    required this.meetingsThisWeek,
    required this.meetingsToday,
  });

  @override
  List<Object?> get props => [
        totalMeetings,
        upcomingMeetings,
        totalHours,
        totalParticipants,
        meetingsThisMonth,
        meetingsThisWeek,
        meetingsToday,
      ];
}
