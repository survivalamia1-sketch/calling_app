import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/subscription_plan.dart';

part 'subscriptions_state.freezed.dart';

@freezed
class SubscriptionsState with _$SubscriptionsState {
  const factory SubscriptionsState.initial() = _Initial;

  const factory SubscriptionsState.loading() = _Loading;

  const factory SubscriptionsState.plansLoaded({
    required List<SubscriptionPlan> plans,
    UserSubscription? currentSubscription,
  }) = _PlansLoaded;

  const factory SubscriptionsState.checkoutUrlGenerated({
    required String checkoutUrl,
  }) = _CheckoutUrlGenerated;

  const factory SubscriptionsState.subscriptionUpdated({
    required UserSubscription subscription,
  }) = _SubscriptionUpdated;

  const factory SubscriptionsState.subscriptionCanceled() =
      _SubscriptionCanceled;

  const factory SubscriptionsState.error(Failure failure) = _Error;
}
