import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/meeting.dart';

abstract class MeetingsRepository {
  Future<Either<Failure, List<Meeting>>> getMeetings({
    String? status, // 'upcoming', 'ongoing', 'completed'
    int? limit,
    int? offset,
  });

  Future<Either<Failure, Meeting>> getMeetingById(String id);

  Future<Either<Failure, Meeting>> getMeetingByCode(String code);

  Future<Either<Failure, Meeting>> createMeeting({
    required String title,
    required String description,
    required DateTime scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  });

  Future<Either<Failure, Meeting>> updateMeeting({
    required String id,
    String? title,
    String? description,
    DateTime? scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  });

  Future<Either<Failure, void>> deleteMeeting(String id);

  Future<Either<Failure, String>> joinMeeting(String roomCode);

  Future<Either<Failure, void>> leaveMeeting(String roomId);
}
