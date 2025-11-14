import 'package:equatable/equatable.dart';

class Meeting extends Equatable {
  final String id;
  final String title;
  final String description;
  final String roomCode;
  final String hostId;
  final DateTime scheduledAt;
  final int? duration; // in minutes
  final int maxParticipants;
  final bool isActive;
  final bool requiresApproval;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? endedAt;

  const Meeting({
    required this.id,
    required this.title,
    required this.description,
    required this.roomCode,
    required this.hostId,
    required this.scheduledAt,
    this.duration,
    required this.maxParticipants,
    required this.isActive,
    required this.requiresApproval,
    required this.createdAt,
    this.startedAt,
    this.endedAt,
  });

  bool get isScheduled => scheduledAt.isAfter(DateTime.now());
  bool get isOngoing => startedAt != null && endedAt == null;
  bool get isCompleted => endedAt != null;
  bool get isStartingSoon {
    final now = DateTime.now();
    final difference = scheduledAt.difference(now);
    return difference.inMinutes <= 15 && difference.inMinutes > 0;
  }

  String get status {
    if (isCompleted) return 'Completed';
    if (isOngoing) return 'Ongoing';
    if (isStartingSoon) return 'Starting Soon';
    if (isScheduled) return 'Scheduled';
    return 'Unknown';
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        roomCode,
        hostId,
        scheduledAt,
        duration,
        maxParticipants,
        isActive,
        requiresApproval,
        createdAt,
        startedAt,
        endedAt,
      ];
}
