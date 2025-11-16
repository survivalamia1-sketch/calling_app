import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/meeting.dart';
import '../entities/scheduled_meeting.dart';

abstract class MeetingsRepository {
  // Regular Meetings (Instant/Rooms)
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

  // Scheduled Meetings (CRUD)

  /// Get all scheduled meetings
  Future<Either<Failure, List<ScheduledMeeting>>> getScheduledMeetings({
    ScheduledMeetingStatus? status,
    int? limit,
    int? offset,
  });

  /// Get scheduled meeting by ID
  Future<Either<Failure, ScheduledMeeting>> getScheduledMeetingById(String id);

  /// Create a scheduled meeting
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
  });

  /// Update scheduled meeting
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
  });

  /// Delete/Cancel scheduled meeting
  Future<Either<Failure, void>> deleteScheduledMeeting(String id);

  /// Start scheduled meeting (creates room and updates status)
  Future<Either<Failure, String>> startScheduledMeeting(String id);

  /// Get upcoming scheduled meetings (within next 7 days)
  Future<Either<Failure, List<ScheduledMeeting>>> getUpcomingScheduledMeetings({
    int? limit,
  });
}
