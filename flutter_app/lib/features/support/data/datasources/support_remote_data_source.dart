import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/bug_report_model.dart';
import '../models/faq_model.dart';

abstract class SupportRemoteDataSource {
  /// Fetches FAQs from the API
  ///
  /// Throws [ServerException] if the request fails
  /// Throws [UnauthorizedException] if not authenticated
  Future<List<FAQModel>> getFAQs({String? category});

  /// Submits a bug report to the API
  ///
  /// Throws [ServerException] if the request fails
  /// Throws [UnauthorizedException] if not authenticated
  Future<void> submitBugReport(BugReportModel bugReport);
}

class SupportRemoteDataSourceImpl implements SupportRemoteDataSource {
  final Dio client;

  SupportRemoteDataSourceImpl({required this.client});

  @override
  Future<List<FAQModel>> getFAQs({String? category}) async {
    try {
      final response = await client.get('/api/v1/support/faqs', queryParameters: {
        'category': category,
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['faqs'] ?? [];
        return data.map((json) => FAQModel.fromJson(json)).toList();
      } else {
        throw const ServerException(
          message: 'Failed to load FAQs',
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(
          message: 'Authentication required',
        );
      }
      throw ServerException(
        message: e.message ?? 'Failed to load FAQs',
      );
    }
  }

  @override
  Future<void> submitBugReport(BugReportModel bugReport) async {
    try {
      final response = await client.post(
        '/api/v1/support/bug-reports',
        data: bugReport.toJson(),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw const ServerException(
          message: 'Failed to submit bug report',
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(
          message: 'Authentication required',
        );
      }
      throw ServerException(
        message: e.message ?? 'Failed to submit bug report',
      );
    }
  }
}
