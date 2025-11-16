import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/meeting.dart';
import '../../domain/entities/scheduled_meeting.dart';
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
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  @override
  Future<Either<Failure, Meeting>> getMeetingById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final meeting = await remoteDataSource.getMeetingById(id);
        return Right(meeting.toDomain());
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
  Future<Either<Failure, Meeting>> getMeetingByCode(String code) async {
    if (await networkInfo.isConnected) {
      try {
        final meeting = await remoteDataSource.getMeetingByCode(code);
        return Right(meeting.toDomain());
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
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
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
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
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMeeting(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteMeeting(id);
        return const Right(null);
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
  Future<Either<Failure, String>> joinMeeting(String roomCode) async {
    if (await networkInfo.isConnected) {
      try {
        final roomId = await remoteDataSource.joinMeeting(roomCode);
        return Right(roomId);
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
  Future<Either<Failure, void>> leaveMeeting(String roomId) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.leaveMeeting(roomId);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  // Scheduled Meetings Implementation

  @override
  Future<Either<Failure, List<ScheduledMeeting>>> getScheduledMeetings({
    ScheduledMeetingStatus? status,
    int? limit,
    int? offset,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final meetings = await remoteDataSource.getScheduledMeetings(
          status: status,
          limit: limit,
          offset: offset,
        );
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

  @override
  Future<Either<Failure, ScheduledMeeting>> getScheduledMeetingById(
      String id) async {
    if (await networkInfo.isConnected) {
      try {
        final meeting = await remoteDataSource.getScheduledMeetingById(id);
        return Right(meeting.toDomain());
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
  Future<Either<Failure, ScheduledMeeting>> createScheduledMeeting({
    required String title,
    required String description,
    required DateTime scheduledAt,
    required int durationMinutes,
    int? maxParticipants,
    String? password,
    bool requiresApproval = false,
    bool waitingRoomEnabled = false,
    bool allowJoinBeforeHost = true,
    bool muteOnEntry = false,
    List<String> invitedEmails = const [],
    bool isRecurring = false,
    RecurrencePattern? recurrencePattern,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final meeting = await remoteDataSource.createScheduledMeeting(
          title: title,
          description: description,
          scheduledAt: scheduledAt,
          durationMinutes: durationMinutes,
          maxParticipants: maxParticipants,
          password: password,
          requiresApproval: requiresApproval,
          waitingRoomEnabled: waitingRoomEnabled,
          allowJoinBeforeHost: allowJoinBeforeHost,
          muteOnEntry: muteOnEntry,
          invitedEmails: invitedEmails,
          isRecurring: isRecurring,
          recurrencePattern: recurrencePattern,
        );
        return Right(meeting.toDomain());
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
  Future<Either<Failure, ScheduledMeeting>> updateScheduledMeeting({
    required String id,
    String? title,
    String? description,
    DateTime? scheduledAt,
    int? durationMinutes,
    int? maxParticipants,
    String? password,
    bool? requiresApproval,
    bool? waitingRoomEnabled,
    bool? allowJoinBeforeHost,
    bool? muteOnEntry,
    List<String>? invitedEmails,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final meeting = await remoteDataSource.updateScheduledMeeting(
          id: id,
          title: title,
          description: description,
          scheduledAt: scheduledAt,
          durationMinutes: durationMinutes,
          maxParticipants: maxParticipants,
          password: password,
          requiresApproval: requiresApproval,
          waitingRoomEnabled: waitingRoomEnabled,
          allowJoinBeforeHost: allowJoinBeforeHost,
          muteOnEntry: muteOnEntry,
          invitedEmails: invitedEmails,
        );
        return Right(meeting.toDomain());
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
  Future<Either<Failure, void>> deleteScheduledMeeting(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteScheduledMeeting(id);
        return const Right(null);
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
  Future<Either<Failure, String>> startScheduledMeeting(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final roomId = await remoteDataSource.startScheduledMeeting(id);
        return Right(roomId);
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
  Future<Either<Failure, List<ScheduledMeeting>>>
      getUpcomingScheduledMeetings({
    int? limit,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final meetings = await remoteDataSource.getUpcomingScheduledMeetings(
          limit: limit,
        );
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
