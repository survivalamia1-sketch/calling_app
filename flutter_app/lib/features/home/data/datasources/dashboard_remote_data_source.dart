import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../meetings/data/models/meeting_model.dart';
import '../models/dashboard_stats_model.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardStatsModel> getDashboardStats();
  Future<List<MeetingModel>> getUpcomingMeetings({int limit = 5});
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Dio client;

  DashboardRemoteDataSourceImpl({required this.client});

  @override
  Future<DashboardStatsModel> getDashboardStats() async {
    try {
      final response = await client.get('/dashboard/stats');

      if (response.statusCode == 200) {
        return DashboardStatsModel.fromJson(response.data);
      } else {
        throw const ServerException(message: 'Failed to load dashboard stats');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      // If endpoint doesn't exist (404), return empty stats
      if (e.response?.statusCode == 404) {
        return const DashboardStatsModel(
          totalMeetings: 0,
          upcomingMeetings: 0,
          totalHours: 0.0,
          totalParticipants: 0,
          meetingsThisMonth: 0,
          meetingsThisWeek: 0,
          meetingsToday: 0,
        );
      }
      // Handle case where response.data might be a string
      String errorMessage = 'Server error occurred';
      try {
        if (e.response?.data is Map) {
          errorMessage = e.response?.data?['error'] ?? errorMessage;
        }
      } catch (_) {}
      throw ServerException(message: errorMessage);
    } catch (e) {
      throw const ServerException(message: 'Unexpected error occurred');
    }
  }

  @override
  Future<List<MeetingModel>> getUpcomingMeetings({int limit = 5}) async {
    try {
      final response = await client.get(
        '/dashboard/upcoming-meetings',
        queryParameters: {'limit': limit},
      );

      if (response.statusCode == 200) {
        final List<dynamic> meetingsJson = response.data['meetings'] ?? [];
        return meetingsJson.map((json) => MeetingModel.fromJson(json)).toList();
      } else {
        throw const ServerException(
            message: 'Failed to load upcoming meetings');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      // If endpoint doesn't exist (404), return empty list
      if (e.response?.statusCode == 404) {
        return [];
      }
      // Handle case where response.data might be a string
      String errorMessage = 'Server error occurred';
      try {
        if (e.response?.data is Map) {
          errorMessage = e.response?.data?['error'] ?? errorMessage;
        }
      } catch (_) {}
      throw ServerException(message: errorMessage);
    } catch (e) {
      throw const ServerException(message: 'Unexpected error occurred');
    }
  }
}
