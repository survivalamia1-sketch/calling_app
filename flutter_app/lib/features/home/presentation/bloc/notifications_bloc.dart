import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/notification_item.dart';
import '../../domain/repositories/notifications_repository.dart';

part 'notifications_bloc.freezed.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository repository;

  NotificationsBloc({
    required this.repository,
  }) : super(const NotificationsState.initial()) {
    on<_LoadNotifications>(_onLoadNotifications);
    on<_RefreshNotifications>(_onRefreshNotifications);
    on<_MarkAsRead>(_onMarkAsRead);
    on<_MarkAllAsRead>(_onMarkAllAsRead);
  }

  Future<void> _onLoadNotifications(
    _LoadNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsState.loading());
    await _fetchNotifications(emit, event.limit);
  }

  Future<void> _onRefreshNotifications(
    _RefreshNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    await _fetchNotifications(emit, event.limit);
  }

  Future<void> _onMarkAsRead(
    _MarkAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final result = await repository.markAsRead(event.notificationId);

    await result.fold(
      (failure) async {
        // Don't change state on error for marking as read
        // Could add a snackbar notification here
      },
      (_) async {
        // Refresh notifications to update read status
        await _fetchNotifications(emit, 50);
      },
    );
  }

  Future<void> _onMarkAllAsRead(
    _MarkAllAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final result = await repository.markAllAsRead();

    await result.fold(
      (failure) async {
        emit(NotificationsState.error(message: failure.message));
      },
      (_) async {
        // Refresh notifications to update read status
        await _fetchNotifications(emit, 50);
      },
    );
  }

  Future<void> _fetchNotifications(
    Emitter<NotificationsState> emit,
    int limit,
  ) async {
    // Fetch notifications and unread count in parallel
    final notificationsResult = await repository.getNotifications(limit: limit);
    final unreadCountResult = await repository.getUnreadCount();

    // Check if both succeeded
    await notificationsResult.fold(
      (failure) async {
        emit(NotificationsState.error(message: failure.message));
      },
      (notifications) async {
        await unreadCountResult.fold(
          (failure) async {
            // Notifications succeeded but count failed - still show notifications
            emit(NotificationsState.loaded(
              notifications: notifications,
              unreadCount: 0,
            ));
          },
          (count) async {
            emit(NotificationsState.loaded(
              notifications: notifications,
              unreadCount: count,
            ));
          },
        );
      },
    );
  }
}
