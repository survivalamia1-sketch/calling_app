import 'package:flutter/material.dart';
import '../models/meeting.dart';
import '../services/api_service.dart';

class MeetingProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Meeting> _upcomingMeetings = [];
  List<Meeting> _pastMeetings = [];
  Meeting? _currentMeeting;
  bool _isLoading = false;
  String? _error;

  List<Meeting> get upcomingMeetings => _upcomingMeetings;
  List<Meeting> get pastMeetings => _pastMeetings;
  Meeting? get currentMeeting => _currentMeeting;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUpcomingMeetings({int limit = 5}) async {
    try {
      _isLoading = true;
      notifyListeners();

      _upcomingMeetings = await _apiService.getUpcomingMeetings(limit: limit);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMyMeetings(String status) async {
    try {
      _isLoading = true;
      notifyListeners();

      final meetings = await _apiService.getMyMeetings(status: status);

      if (status == 'upcoming' || status == 'scheduled') {
        _upcomingMeetings = meetings;
      } else if (status == 'past' || status == 'ended') {
        _pastMeetings = meetings;
      }

      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Meeting?> createMeeting({
    required String name,
    DateTime? scheduledAt,
    String? password,
    int? maxParticipants,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      final meeting = await _apiService.createMeeting(
        name: name,
        scheduledAt: scheduledAt,
        password: password,
        maxParticipants: maxParticipants,
      );

      _currentMeeting = meeting;
      _error = null;

      _isLoading = false;
      notifyListeners();

      return meeting;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<Meeting?> joinMeetingByCode(String code, {String? password}) async {
    try {
      _isLoading = true;
      notifyListeners();

      final meeting = await _apiService.joinMeetingByCode(code, password: password);
      _currentMeeting = meeting;
      _error = null;

      _isLoading = false;
      notifyListeners();

      return meeting;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<bool> deleteMeeting(String meetingId) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _apiService.deleteMeeting(meetingId);

      _upcomingMeetings.removeWhere((m) => m.id == meetingId);
      _error = null;

      _isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void setCurrentMeeting(Meeting? meeting) {
    _currentMeeting = meeting;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
