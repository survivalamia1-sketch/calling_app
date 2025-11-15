import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/subscription_plan.dart';
import '../../domain/repositories/subscriptions_repository.dart';
import '../datasources/subscriptions_remote_data_source.dart';

class SubscriptionsRepositoryImpl implements SubscriptionsRepository {
  final SubscriptionsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SubscriptionsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<SubscriptionPlan>>> getPlans() async {
    if (await networkInfo.isConnected) {
      try {
        final plans = await remoteDataSource.getPlans();
        return Right(plans.map((model) => model.toDomain()).toList());
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  @override
  Future<Either<Failure, UserSubscription>> getCurrentSubscription() async {
    if (await networkInfo.isConnected) {
      try {
        final subscription = await remoteDataSource.getCurrentSubscription();
        return Right(subscription.toDomain());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  @override
  Future<Either<Failure, String>> createCheckoutSession({
    required String planId,
    required String billingCycle,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final url = await remoteDataSource.createCheckoutSession(
          planId: planId,
          billingCycle: billingCycle,
        );
        return Right(url);
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  @override
  Future<Either<Failure, void>> cancelSubscription() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.cancelSubscription();
        return const Right(null);
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  @override
  Future<Either<Failure, UserSubscription>> updateSubscription({
    required String planId,
    required String billingCycle,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final subscription = await remoteDataSource.updateSubscription(
          planId: planId,
          billingCycle: billingCycle,
        );
        return Right(subscription.toDomain());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }
}
