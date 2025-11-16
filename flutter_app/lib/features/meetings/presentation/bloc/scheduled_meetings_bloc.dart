import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_logger.dart';
import '../../domain/entities/scheduled_meeting.dart';
import '../../domain/repositories/meetings_repository.dart';
import 'scheduled_meetings_event.dart';
import 'scheduled_meetings_state.dart';

/// Scheduled Meetings BLoC
///
/// Manages scheduled meetings list and operations
/// NO MOCK DATA - All data from repository
class ScheduledMeetingsBloc
    extends Bloc<ScheduledMeetingsEvent, ScheduledMeetingsState> {
  final MeetingsRepository repository;
  ScheduledMeetingStatus? _currentFilter;

  ScheduledMeetingsBloc({
    required this.repository,
  }) : super(const ScheduledMeetingsState.initial()) {
    on<LoadScheduledMeetings>(_onLoadScheduledMeetings);
    on<RefreshScheduledMeetings>(_onRefreshScheduledMeetings);
    on<DeleteScheduledMeeting>(_onDeleteScheduledMeeting);
    on<StartScheduledMeeting>(_onStartScheduledMeeting);
    on<FilterByStatus>(_onFilterByStatus);
  }

  Future<void> _onLoadScheduledMeetings(
    LoadScheduledMeetings event,
    Emitter<ScheduledMeetingsState> emit,
  ) async {
    emit(const ScheduledMeetingsState.loading());
    _currentFilter = event.status;

    try {
      final result = await repository.getScheduledMeetings(
        status: event.status,
      );

      result.fold(
        (failure) {
          AppLogger.e('Failed to load scheduled meetings', error: failure);
          emit(ScheduledMeetingsState.error(failure.message));
        },
        (meetings) {
          if (meetings.isEmpty) {
            emit(const ScheduledMeetingsState.empty());
          } else {
            emit(ScheduledMeetingsState.loaded(
              meetings: meetings,
              filter: event.status,
            ));
          }
        },
      );
    } catch (e) {
      AppLogger.e('Error loading scheduled meetings', error: e);
      emit(ScheduledMeetingsState.error(e.toString()));
    }
  }

  Future<void> _onRefreshScheduledMeetings(
    RefreshScheduledMeetings event,
    Emitter<ScheduledMeetingsState> emit,
  ) async {
    // Don't show loading state on refresh, keep current state
    try {
      final result = await repository.getScheduledMeetings(
        status: _currentFilter,
      );

      result.fold(
        (failure) {
          AppLogger.e('Failed to refresh scheduled meetings', error: failure);
          // Keep current state on refresh error
        },
        (meetings) {
          if (meetings.isEmpty) {
            emit(const ScheduledMeetingsState.empty());
          } else {
            emit(ScheduledMeetingsState.loaded(
              meetings: meetings,
              filter: _currentFilter,
            ));
          }
        },
      );
    } catch (e) {
      AppLogger.e('Error refreshing scheduled meetings', error: e);
      // Keep current state on refresh error
    }
  }

  Future<void> _onDeleteScheduledMeeting(
    DeleteScheduledMeeting event,
    Emitter<ScheduledMeetingsState> emit,
  ) async {
    final currentState = state;

    emit(ScheduledMeetingsState.deleting(event.id));

    try {
      final result = await repository.deleteScheduledMeeting(event.id);

      await result.fold(
        (failure) async {
          AppLogger.e('Failed to delete scheduled meeting', error: failure);
          // Restore previous state
          emit(currentState);
          emit(ScheduledMeetingsState.error(failure.message));
        },
        (_) async {
          // Reload meetings after deletion
          add(ScheduledMeetingsEvent.loadScheduledMeetings(
            status: _currentFilter,
          ));
        },
      );
    } catch (e) {
      AppLogger.e('Error deleting scheduled meeting', error: e);
      emit(currentState);
      emit(ScheduledMeetingsState.error(e.toString()));
    }
  }

  Future<void> _onStartScheduledMeeting(
    StartScheduledMeeting event,
    Emitter<ScheduledMeetingsState> emit,
  ) async {
    final currentState = state;

    emit(ScheduledMeetingsState.starting(event.id));

    try {
      final result = await repository.startScheduledMeeting(event.id);

      result.fold(
        (failure) {
          AppLogger.e('Failed to start scheduled meeting', error: failure);
          emit(currentState);
          emit(ScheduledMeetingsState.error(failure.message));
        },
        (roomId) {
          // Navigation to call page will be handled in UI
          // Restore state and let UI handle navigation
          emit(currentState);
        },
      );
    } catch (e) {
      AppLogger.e('Error starting scheduled meeting', error: e);
      emit(currentState);
      emit(ScheduledMeetingsState.error(e.toString()));
    }
  }

  Future<void> _onFilterByStatus(
    FilterByStatus event,
    Emitter<ScheduledMeetingsState> emit,
  ) async {
    _currentFilter = event.status;
    add(ScheduledMeetingsEvent.loadScheduledMeetings(
      status: event.status,
    ));
  }
}
