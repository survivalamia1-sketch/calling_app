part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.loadDashboard() = _LoadDashboard;
  const factory DashboardEvent.refreshDashboard() = _RefreshDashboard;
}
