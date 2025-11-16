import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/notification_item.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_remote_data_source.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NotificationsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<NotificationItem>>> getNotifications(
      {int limit = 50}) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }

    try {
      final notifications =
          await remoteDataSource.getNotifications(limit: limit);
      return Right(notifications);
    } catch (e) {
      return Left(ServerFailure(
          message: 'Failed to load notifications: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadCount() async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }

    try {
      final count = await remoteDataSource.getUnreadCount();
      return Right(count);
    } catch (e) {
      return Left(ServerFailure(
          message: 'Failed to get unread count: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(String notificationId) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }

    try {
      await remoteDataSource.markAsRead(notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(
          message: 'Failed to mark notification as read: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> markAllAsRead() async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }

    try {
      await remoteDataSource.markAllAsRead();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(
          message:
              'Failed to mark all notifications as read: ${e.toString()}'));
    }
  }
}
