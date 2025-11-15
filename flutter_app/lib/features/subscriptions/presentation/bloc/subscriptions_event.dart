import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscriptions_event.freezed.dart';

@freezed
class SubscriptionsEvent with _$SubscriptionsEvent {
  const factory SubscriptionsEvent.loadPlans() = LoadPlans;

  const factory SubscriptionsEvent.loadCurrentSubscription() =
      LoadCurrentSubscription;

  const factory SubscriptionsEvent.subscribe({
    required String planId,
    required String billingCycle,
  }) = Subscribe;

  const factory SubscriptionsEvent.cancelSubscription() = CancelSubscription;

  const factory SubscriptionsEvent.updateSubscription({
    required String planId,
    required String billingCycle,
  }) = UpdateSubscription;
}
