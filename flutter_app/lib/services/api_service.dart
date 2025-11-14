import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';
import '../models/user.dart';
import '../models/subscription.dart';
import '../models/meeting.dart';
import 'auth_service.dart';

class ApiService {
  final AuthService _authService = AuthService();

  Future<Map<String, String>> _getHeaders() async {
    final token = await _authService.getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<http.Response> _get(String endpoint) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$endpoint');
    final headers = await _getHeaders();
    return await http.get(url, headers: headers).timeout(AppConfig.apiTimeout);
  }

  Future<http.Response> _post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$endpoint');
    final headers = await _getHeaders();
    return await http
        .post(url, headers: headers, body: jsonEncode(body))
        .timeout(AppConfig.apiTimeout);
  }

  Future<http.Response> _put(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$endpoint');
    final headers = await _getHeaders();
    return await http
        .put(url, headers: headers, body: jsonEncode(body))
        .timeout(AppConfig.apiTimeout);
  }

  Future<http.Response> _delete(String endpoint) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$endpoint');
    final headers = await _getHeaders();
    return await http.delete(url, headers: headers).timeout(AppConfig.apiTimeout);
  }

  // Auth APIs
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _post('/auth/login', {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw _handleError(response);
    }
  }

  Future<Map<String, dynamic>> register(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    final response = await _post('/auth/register', {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
    });

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw _handleError(response);
    }
  }

  Future<void> forgotPassword(String email) async {
    final response = await _post('/auth/forgot-password', {'email': email});

    if (response.statusCode != 200) {
      throw _handleError(response);
    }
  }

  Future<void> resetPassword(String token, String newPassword) async {
    final response = await _post('/auth/reset-password', {
      'token': token,
      'new_password': newPassword,
    });

    if (response.statusCode != 200) {
      throw _handleError(response);
    }
  }

  Future<void> resendVerificationEmail() async {
    final response = await _post('/auth/resend-verification', {});

    if (response.statusCode != 200) {
      throw _handleError(response);
    }
  }

  Future<User> getMe() async {
    final response = await _get('/auth/me');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data['user']);
    } else {
      throw _handleError(response);
    }
  }

  Future<void> updateProfile(Map<String, dynamic> updates) async {
    final response = await _put('/users/me', updates);

    if (response.statusCode != 200) {
      throw _handleError(response);
    }
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    final response = await _post('/auth/change-password', {
      'old_password': oldPassword,
      'new_password': newPassword,
    });

    if (response.statusCode != 200) {
      throw _handleError(response);
    }
  }

  // Subscription APIs
  Future<Subscription> getMySubscription() async {
    final response = await _get('/users/me/subscription');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Subscription.fromJson(data['subscription']);
    } else {
      throw _handleError(response);
    }
  }

  Future<List<SubscriptionPlan>> getPlans() async {
    final response = await _get('/subscriptions/plans');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['plans'] as List)
          .map((plan) => SubscriptionPlan.fromJson(plan))
          .toList();
    } else {
      throw _handleError(response);
    }
  }

  Future<String> createCheckoutSession(String planType, String interval) async {
    final response = await _post('/subscriptions/create-checkout-session', {
      'plan_type': planType,
      'interval': interval,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['checkout_url'];
    } else {
      throw _handleError(response);
    }
  }

  Future<void> cancelSubscription() async {
    final response = await _post('/subscriptions/cancel', {});

    if (response.statusCode != 200) {
      throw _handleError(response);
    }
  }

  // Meeting APIs
  Future<List<Meeting>> getMyMeetings({String? status}) async {
    String endpoint = '/rooms/mine';
    if (status != null) {
      endpoint += '?status=$status';
    }

    final response = await _get(endpoint);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['rooms'] as List)
          .map((room) => Meeting.fromJson(room))
          .toList();
    } else {
      throw _handleError(response);
    }
  }

  Future<List<Meeting>> getUpcomingMeetings({int limit = 5}) async {
    final response = await _get('/rooms/upcoming?limit=$limit');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['rooms'] as List)
          .map((room) => Meeting.fromJson(room))
          .toList();
    } else {
      throw _handleError(response);
    }
  }

  Future<Meeting> createMeeting({
    required String name,
    DateTime? scheduledAt,
    String? password,
    int? maxParticipants,
  }) async {
    final response = await _post('/rooms', {
      'name': name,
      if (scheduledAt != null) 'scheduled_at': scheduledAt.toIso8601String(),
      if (password != null) 'password': password,
      if (maxParticipants != null) 'max_participants': maxParticipants,
    });

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return Meeting.fromJson(data['room']);
    } else {
      throw _handleError(response);
    }
  }

  Future<Meeting> getMeeting(String meetingId) async {
    final response = await _get('/rooms/$meetingId');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Meeting.fromJson(data['room']);
    } else {
      throw _handleError(response);
    }
  }

  Future<Map<String, dynamic>> joinMeeting(String meetingId, {String? password}) async {
    final response = await _post('/rooms/$meetingId/join', {
      if (password != null) 'password': password,
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw _handleError(response);
    }
  }

  Future<Meeting> joinMeetingByCode(String code, {String? password}) async {
    final response = await _post('/rooms/join-by-code', {
      'code': code,
      if (password != null) 'password': password,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Meeting.fromJson(data['room']);
    } else {
      throw _handleError(response);
    }
  }

  Future<void> deleteMeeting(String meetingId) async {
    final response = await _delete('/rooms/$meetingId');

    if (response.statusCode != 200) {
      throw _handleError(response);
    }
  }

  // Support APIs
  Future<void> submitSupportTicket({
    required String subject,
    required String message,
  }) async {
    final response = await _post('/support/tickets', {
      'subject': subject,
      'message': message,
    });

    if (response.statusCode != 201) {
      throw _handleError(response);
    }
  }

  ApiException _handleError(http.Response response) {
    try {
      final data = jsonDecode(response.body);
      return ApiException(
        statusCode: response.statusCode,
        errorCode: data['error_code'] ?? 'UNKNOWN_ERROR',
        message: data['message'] ?? 'An error occurred',
      );
    } catch (e) {
      return ApiException(
        statusCode: response.statusCode,
        errorCode: 'UNKNOWN_ERROR',
        message: 'An unexpected error occurred',
      );
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String errorCode;
  final String message;

  ApiException({
    required this.statusCode,
    required this.errorCode,
    required this.message,
  });

  @override
  String toString() => message;
}
