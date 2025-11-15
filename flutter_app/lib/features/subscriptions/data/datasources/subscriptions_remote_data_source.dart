import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/subscription_plan_model.dart';

abstract class SubscriptionsRemoteDataSource {
  Future<List<SubscriptionPlanModel>> getPlans();
  Future<UserSubscriptionModel> getCurrentSubscription();
  Future<String> createCheckoutSession({
    required String planId,
    required String billingCycle,
  });
  Future<void> cancelSubscription();
  Future<UserSubscriptionModel> updateSubscription({
    required String planId,
    required String billingCycle,
  });
}

class SubscriptionsRemoteDataSourceImpl
    implements SubscriptionsRemoteDataSource {
  final Dio client;

  SubscriptionsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SubscriptionPlanModel>> getPlans() async {
    try {
      final response = await client.get(ApiConstants.subscriptionsPlans);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['plans'] ?? response.data;
        return data
            .map((json) => SubscriptionPlanModel.fromJson(json))
            .toList();
      } else {
        throw const ServerException(message: 'Failed to get plans');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<UserSubscriptionModel> getCurrentSubscription() async {
    try {
      final response = await client.get(ApiConstants.subscriptionsCurrent);

      if (response.statusCode == 200) {
        return UserSubscriptionModel.fromJson(response.data['subscription']);
      } else {
        throw const ServerException(message: 'Failed to get subscription');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      if (e.response?.statusCode == 404) {
        throw const ServerException(message: 'No active subscription');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<String> createCheckoutSession({
    required String planId,
    required String billingCycle,
  }) async {
    try {
      final response = await client.post(
        ApiConstants.subscriptionsCheckout,
        data: {
          'plan_id': planId,
          'billing_cycle': billingCycle,
        },
      );

      if (response.statusCode == 200) {
        return response.data['checkout_url'] as String;
      } else {
        throw const ServerException(
            message: 'Failed to create checkout session');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<void> cancelSubscription() async {
    try {
      final response = await client.post(ApiConstants.subscriptionsCancel);

      if (response.statusCode != 200) {
        throw const ServerException(message: 'Failed to cancel subscription');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<UserSubscriptionModel> updateSubscription({
    required String planId,
    required String billingCycle,
  }) async {
    try {
      // Note: Direct subscription update not available - use checkout endpoint
      final response = await client.post(
        ApiConstants.subscriptionsCheckout,
        data: {
          'plan_id': planId,
        },
      );

      if (response.statusCode == 200) {
        return UserSubscriptionModel.fromJson(response.data['subscription']);
      } else {
        throw const ServerException(message: 'Failed to update subscription');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }
}
