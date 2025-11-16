import 'package:equatable/equatable.dart';

enum NotificationType {
  meetingInvite,
  meetingStarted,
  meetingEnded,
  recordingAvailable,
  participantJoined,
  participantLeft,
  chatMessage,
  system,
}

class NotificationItem extends Equatable {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime timestamp;
  final bool isRead;
  final String? data; // JSON data

  const NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
    required this.isRead,
    this.data,
  });

  @override
  List<Object?> get props => [id, title, message, type, timestamp, isRead, data];
}
