import '../../domain/entities/notification_item.dart';

class NotificationModel extends NotificationItem {
  const NotificationModel({
    required super.id,
    required super.title,
    required super.message,
    required super.type,
    required super.timestamp,
    required super.isRead,
    super.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: _parseNotificationType(json['type'] as String),
      timestamp: DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool? ?? false,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': _notificationTypeToString(type),
      'created_at': timestamp.toIso8601String(),
      'is_read': isRead,
      'data': data,
    };
  }

  static NotificationType _parseNotificationType(String type) {
    switch (type) {
      case 'meeting_invite':
        return NotificationType.meetingInvite;
      case 'meeting_started':
        return NotificationType.meetingStarted;
      case 'meeting_ended':
        return NotificationType.meetingEnded;
      case 'recording_available':
        return NotificationType.recordingAvailable;
      case 'participant_joined':
        return NotificationType.participantJoined;
      case 'participant_left':
        return NotificationType.participantLeft;
      case 'chat_message':
        return NotificationType.chatMessage;
      case 'system':
      default:
        return NotificationType.system;
    }
  }

  static String _notificationTypeToString(NotificationType type) {
    switch (type) {
      case NotificationType.meetingInvite:
        return 'meeting_invite';
      case NotificationType.meetingStarted:
        return 'meeting_started';
      case NotificationType.meetingEnded:
        return 'meeting_ended';
      case NotificationType.recordingAvailable:
        return 'recording_available';
      case NotificationType.participantJoined:
        return 'participant_joined';
      case NotificationType.participantLeft:
        return 'participant_left';
      case NotificationType.chatMessage:
        return 'chat_message';
      case NotificationType.system:
        return 'system';
    }
  }
}
