import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/subscription_plan.dart';
import '../repositories/subscriptions_repository.dart';

class GetPlans implements UseCase<List<SubscriptionPlan>, NoParams> {
  final SubscriptionsRepository repository;

  GetPlans(this.repository);

  @override
  Future<Either<Failure, List<SubscriptionPlan>>> call(NoParams params) async {
    return await repository.getPlans();
  }
}
