import 'package:equatable/equatable.dart';

/// Scheduled Meeting Entity
///
/// Represents a scheduled meeting in the domain layer.
/// This is separate from the regular Meeting entity to handle
/// scheduling-specific fields and logic.
///
/// NO MOCK DATA - Pure domain entity
class ScheduledMeeting extends Equatable {
  /// Unique identifier
  final String id;

  /// Meeting title
  final String title;

  /// Meeting description
  final String description;

  /// Host user ID
  final String hostId;

  /// Host user name
  final String hostName;

  /// Scheduled start time
  final DateTime scheduledAt;

  /// Meeting duration in minutes
  final int durationMinutes;

  /// Maximum participants allowed
  final int? maxParticipants;

  /// Meeting password (optional)
  final String? password;

  /// Whether guests need approval to join
  final bool requiresApproval;

  /// Whether waiting room is enabled
  final bool waitingRoomEnabled;

  /// Allow participants to join before host
  final bool allowJoinBeforeHost;

  /// Mute participants on entry
  final bool muteOnEntry;

  /// Room ID (when meeting is started)
  final String? roomId;

  /// Meeting status
  final ScheduledMeetingStatus status;

  /// Created at timestamp
  final DateTime createdAt;

  /// Updated at timestamp
  final DateTime? updatedAt;

  /// List of invited participant emails
  final List<String> invitedEmails;

  /// Meeting URL/Link
  final String? meetingLink;

  /// Is recurring meeting
  final bool isRecurring;

  /// Recurrence pattern (if recurring)
  final RecurrencePattern? recurrencePattern;

  const ScheduledMeeting({
    required this.id,
    required this.title,
    required this.description,
    required this.hostId,
    required this.hostName,
    required this.scheduledAt,
    required this.durationMinutes,
    this.maxParticipants,
    this.password,
    this.requiresApproval = false,
    this.waitingRoomEnabled = false,
    this.allowJoinBeforeHost = true,
    this.muteOnEntry = false,
    this.roomId,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.invitedEmails = const [],
    this.meetingLink,
    this.isRecurring = false,
    this.recurrencePattern,
  });

  /// Check if meeting can be joined now
  bool get canJoinNow {
    if (status != ScheduledMeetingStatus.scheduled) {
      return false;
    }

    final now = DateTime.now();
    final joinableTime = scheduledAt.subtract(const Duration(minutes: 15));
    final endTime = scheduledAt.add(Duration(minutes: durationMinutes));

    return now.isAfter(joinableTime) && now.isBefore(endTime);
  }

  /// Check if meeting is in the past
  bool get isPast {
    final endTime = scheduledAt.add(Duration(minutes: durationMinutes));
    return DateTime.now().isAfter(endTime);
  }

  /// Check if meeting is upcoming (within 24 hours)
  bool get isUpcoming {
    final now = DateTime.now();
    final upcoming = now.add(const Duration(hours: 24));
    return scheduledAt.isAfter(now) && scheduledAt.isBefore(upcoming);
  }

  /// Get time until meeting starts
  Duration get timeUntilStart {
    return scheduledAt.difference(DateTime.now());
  }

  /// Get formatted meeting duration
  String get formattedDuration {
    if (durationMinutes < 60) {
      return '$durationMinutes min';
    } else {
      final hours = durationMinutes ~/ 60;
      final minutes = durationMinutes % 60;
      if (minutes == 0) {
        return '$hours ${hours == 1 ? 'hour' : 'hours'}';
      }
      return '$hours${hours == 1 ? 'hr' : 'hrs'} $minutes min';
    }
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        hostId,
        hostName,
        scheduledAt,
        durationMinutes,
        maxParticipants,
        password,
        requiresApproval,
        waitingRoomEnabled,
        allowJoinBeforeHost,
        muteOnEntry,
        roomId,
        status,
        createdAt,
        updatedAt,
        invitedEmails,
        meetingLink,
        isRecurring,
        recurrencePattern,
      ];
}

/// Scheduled Meeting Status
enum ScheduledMeetingStatus {
  /// Meeting is scheduled for future
  scheduled,

  /// Meeting is currently active
  inProgress,

  /// Meeting has ended
  ended,

  /// Meeting was cancelled
  cancelled,
}

/// Recurrence Pattern
class RecurrencePattern extends Equatable {
  /// Recurrence type
  final RecurrenceType type;

  /// Interval (e.g., every 2 weeks)
  final int interval;

  /// Days of week (for weekly recurrence)
  final List<int>? daysOfWeek;

  /// End date for recurrence
  final DateTime? endDate;

  /// Number of occurrences
  final int? occurrences;

  const RecurrencePattern({
    required this.type,
    this.interval = 1,
    this.daysOfWeek,
    this.endDate,
    this.occurrences,
  });

  @override
  List<Object?> get props => [
        type,
        interval,
        daysOfWeek,
        endDate,
        occurrences,
      ];
}

/// Recurrence Type
enum RecurrenceType {
  /// Daily recurrence
  daily,

  /// Weekly recurrence
  weekly,

  /// Monthly recurrence
  monthly,

  /// Yearly recurrence
  yearly,
}
