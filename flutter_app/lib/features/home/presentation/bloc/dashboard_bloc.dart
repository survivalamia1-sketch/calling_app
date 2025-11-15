import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../meetings/domain/entities/meeting.dart';
import '../../domain/entities/dashboard_stats.dart';
import '../../domain/usecases/get_dashboard_stats.dart';
import '../../domain/usecases/get_upcoming_meetings.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardStats getDashboardStats;
  final GetUpcomingMeetings getUpcomingMeetings;

  DashboardBloc({
    required this.getDashboardStats,
    required this.getUpcomingMeetings,
  }) : super(const DashboardState.initial()) {
    on<_LoadDashboard>(_onLoadDashboard);
    on<_RefreshDashboard>(_onRefreshDashboard);
  }

  Future<void> _onLoadDashboard(
    _LoadDashboard event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    await _fetchDashboardData(emit);
  }

  Future<void> _onRefreshDashboard(
    _RefreshDashboard event,
    Emitter<DashboardState> emit,
  ) async {
    // Keep current state while refreshing, then update
    await _fetchDashboardData(emit);
  }

  Future<void> _fetchDashboardData(Emitter<DashboardState> emit) async {
    // Fetch stats and upcoming meetings in parallel
    final statsResult = await getDashboardStats(NoParams());
    final meetingsResult =
        await getUpcomingMeetings(const GetUpcomingMeetingsParams(limit: 5));

    // Check if both succeeded
    await statsResult.fold(
      (failure) async {
        emit(DashboardState.error(
          message: failure.message,
        ));
      },
      (stats) async {
        await meetingsResult.fold(
          (failure) async {
            // Stats succeeded but meetings failed - still show stats with empty meetings
            emit(DashboardState.loaded(
              stats: stats,
              upcomingMeetings: [],
            ));
          },
          (meetings) async {
            emit(DashboardState.loaded(
              stats: stats,
              upcomingMeetings: meetings,
            ));
          },
        );
      },
    );
  }
}
