import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/notification_item.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationItem>>> getNotifications({int limit = 50});
  Future<Either<Failure, int>> getUnreadCount();
  Future<Either<Failure, void>> markAsRead(String notificationId);
  Future<Either<Failure, void>> markAllAsRead();
}
