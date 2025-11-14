import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/meeting.dart';
import '../../domain/repositories/meetings_repository.dart';
import '../datasources/meetings_remote_data_source.dart';

class MeetingsRepositoryImpl implements MeetingsRepository {
  final MeetingsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MeetingsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Meeting>>> getMeetings({
    String? status,
    int? limit,
    int? offset,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final meetings = await remoteDataSource.getMeetings(
          status: status,
          limit: limit,
          offset: offset,
        );
        return Right(meetings.map((model) => model.toDomain()).toList());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Meeting>> getMeetingById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final meeting = await remoteDataSource.getMeetingById(id);
        return Right(meeting.toDomain());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Meeting>> getMeetingByCode(String code) async {
    if (await networkInfo.isConnected) {
      try {
        final meeting = await remoteDataSource.getMeetingByCode(code);
        return Right(meeting.toDomain());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Meeting>> createMeeting({
    required String title,
    required String description,
    required DateTime scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final meeting = await remoteDataSource.createMeeting(
          title: title,
          description: description,
          scheduledAt: scheduledAt,
          duration: duration,
          maxParticipants: maxParticipants,
          requiresApproval: requiresApproval,
        );
        return Right(meeting.toDomain());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Meeting>> updateMeeting({
    required String id,
    String? title,
    String? description,
    DateTime? scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final meeting = await remoteDataSource.updateMeeting(
          id: id,
          title: title,
          description: description,
          scheduledAt: scheduledAt,
          duration: duration,
          maxParticipants: maxParticipants,
          requiresApproval: requiresApproval,
        );
        return Right(meeting.toDomain());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteMeeting(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteMeeting(id);
        return const Right(null);
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, String>> joinMeeting(String roomCode) async {
    if (await networkInfo.isConnected) {
      try {
        final roomId = await remoteDataSource.joinMeeting(roomCode);
        return Right(roomId);
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> leaveMeeting(String roomId) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.leaveMeeting(roomId);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
