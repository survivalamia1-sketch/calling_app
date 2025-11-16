part of 'notifications_bloc.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.loadNotifications({@Default(50) int limit}) = _LoadNotifications;
  const factory NotificationsEvent.refreshNotifications({@Default(50) int limit}) = _RefreshNotifications;
  const factory NotificationsEvent.markAsRead(String notificationId) = _MarkAsRead;
  const factory NotificationsEvent.markAllAsRead() = _MarkAllAsRead;
}
