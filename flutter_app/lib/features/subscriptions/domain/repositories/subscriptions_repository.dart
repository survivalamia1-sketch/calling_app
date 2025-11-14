import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/subscription_plan.dart';

abstract class SubscriptionsRepository {
  Future<Either<Failure, List<SubscriptionPlan>>> getPlans();

  Future<Either<Failure, UserSubscription>> getCurrentSubscription();

  Future<Either<Failure, String>> createCheckoutSession({
    required String planId,
    required String billingCycle,
  });

  Future<Either<Failure, void>> cancelSubscription();

  Future<Either<Failure, UserSubscription>> updateSubscription({
    required String planId,
    required String billingCycle,
  });
}
