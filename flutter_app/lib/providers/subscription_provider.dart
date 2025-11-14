import 'package:flutter/material.dart';
import '../models/subscription.dart';
import '../services/api_service.dart';

class SubscriptionProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  Subscription? _subscription;
  List<SubscriptionPlan> _plans = [];
  bool _isLoading = false;
  String? _error;

  Subscription? get subscription => _subscription;
  List<SubscriptionPlan> get plans => _plans;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadSubscription() async {
    try {
      _isLoading = true;
      notifyListeners();

      _subscription = await _apiService.getMySubscription();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadPlans() async {
    try {
      _isLoading = true;
      notifyListeners();

      _plans = await _apiService.getPlans();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> createCheckoutSession(String planType, String interval) async {
    try {
      _isLoading = true;
      notifyListeners();

      final checkoutUrl = await _apiService.createCheckoutSession(planType, interval);

      _isLoading = false;
      notifyListeners();

      return checkoutUrl;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<bool> cancelSubscription() async {
    try {
      _isLoading = true;
      notifyListeners();

      await _apiService.cancelSubscription();
      await loadSubscription();

      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
