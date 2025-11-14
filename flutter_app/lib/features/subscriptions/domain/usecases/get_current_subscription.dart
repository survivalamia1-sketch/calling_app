import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/subscription_plan.dart';
import '../repositories/subscriptions_repository.dart';

class GetCurrentSubscription
    implements UseCase<UserSubscription, NoParams> {
  final SubscriptionsRepository repository;

  GetCurrentSubscription(this.repository);

  @override
  Future<Either<Failure, UserSubscription>> call(NoParams params) async {
    return await repository.getCurrentSubscription();
  }
}
