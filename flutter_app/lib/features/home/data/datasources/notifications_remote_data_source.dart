import 'package:dio/dio.dart';

import '../../domain/entities/notification_item.dart';
import '../models/notification_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationItem>> getNotifications({int limit = 50});
  Future<int> getUnreadCount();
  Future<void> markAsRead(String notificationId);
  Future<void> markAllAsRead();
}

class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
  final Dio dio;

  NotificationsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NotificationItem>> getNotifications({int limit = 50}) async {
    try {
      final response = await dio.get(
        '/notifications',
        queryParameters: {'limit': limit},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List;
        return data.map((json) => NotificationModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<int> getUnreadCount() async {
    try {
      final response = await dio.get('/notifications/unread-count');

      if (response.statusCode == 200) {
        return response.data['unread_count'] as int;
      } else {
        throw Exception('Failed to get unread count');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    try {
      await dio.post('/notifications/$notificationId/read');
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<void> markAllAsRead() async {
    try {
      await dio.post('/notifications/read-all');
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
