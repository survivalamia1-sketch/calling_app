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
      throw ServerException(
          message: e.response?.data?['error'] ?? 'Server error occurred');
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
      throw ServerException(
        message: e.response?.data?['error'] ?? 'Server error occurred',
      );
    } catch (e) {
      throw const ServerException(message: 'Unexpected error occurred');
    }
  }
}
