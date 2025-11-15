import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../meetings/domain/entities/meeting.dart';
import '../../domain/entities/dashboard_stats.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DashboardRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DashboardStats>> getDashboardStats() async {
    if (await networkInfo.isConnected) {
      try {
        final stats = await remoteDataSource.getDashboardStats();
        return Right(stats.toDomain());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  @override
  Future<Either<Failure, List<Meeting>>> getUpcomingMeetings({
    int limit = 5,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final meetings =
            await remoteDataSource.getUpcomingMeetings(limit: limit);
        return Right(meetings.map((model) => model.toDomain()).toList());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }
}
