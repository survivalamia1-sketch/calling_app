import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/subscriptions_repository.dart';

class CreateCheckoutSession implements UseCase<String, CheckoutParams> {
  final SubscriptionsRepository repository;

  CreateCheckoutSession(this.repository);

  @override
  Future<Either<Failure, String>> call(CheckoutParams params) async {
    return await repository.createCheckoutSession(
      planId: params.planId,
      billingCycle: params.billingCycle,
    );
  }
}

class CheckoutParams extends Equatable {
  final String planId;
  final String billingCycle;

  const CheckoutParams({
    required this.planId,
    required this.billingCycle,
  });

  @override
  List<Object?> get props => [planId, billingCycle];
}
