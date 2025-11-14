import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../meetings/domain/entities/meeting.dart';
import '../entities/dashboard_stats.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardStats>> getDashboardStats();
  Future<Either<Failure, List<Meeting>>> getUpcomingMeetings({
    int limit = 5,
  });
}
