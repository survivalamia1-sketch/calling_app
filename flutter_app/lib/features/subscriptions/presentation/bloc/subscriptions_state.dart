import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/subscription_plan.dart';

part 'subscriptions_state.freezed.dart';

@freezed
class SubscriptionsState with _$SubscriptionsState {
  const factory SubscriptionsState.initial() = Initial;

  const factory SubscriptionsState.loading() = Loading;

  const factory SubscriptionsState.plansLoaded({
    required List<SubscriptionPlan> plans,
    UserSubscription? currentSubscription,
  }) = PlansLoaded;

  const factory SubscriptionsState.checkoutUrlGenerated({
    required String checkoutUrl,
  }) = CheckoutUrlGenerated;

  const factory SubscriptionsState.subscriptionUpdated({
    required UserSubscription subscription,
  }) = SubscriptionUpdated;

  const factory SubscriptionsState.subscriptionCanceled() =
      SubscriptionCanceled;

  const factory SubscriptionsState.error(Failure failure) = Error;
}
