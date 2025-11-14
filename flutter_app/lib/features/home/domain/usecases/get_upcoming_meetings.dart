import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../meetings/domain/entities/meeting.dart';
import '../repositories/dashboard_repository.dart';

class GetUpcomingMeetings
    implements UseCase<List<Meeting>, GetUpcomingMeetingsParams> {
  final DashboardRepository repository;

  GetUpcomingMeetings(this.repository);

  @override
  Future<Either<Failure, List<Meeting>>> call(
      GetUpcomingMeetingsParams params) async {
    return await repository.getUpcomingMeetings(limit: params.limit);
  }
}

class GetUpcomingMeetingsParams extends Equatable {
  final int limit;

  const GetUpcomingMeetingsParams({this.limit = 5});

  @override
  List<Object?> get props => [limit];
}
