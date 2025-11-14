import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscriptions_event.freezed.dart';

@freezed
class SubscriptionsEvent with _$SubscriptionsEvent {
  const factory SubscriptionsEvent.loadPlans() = _LoadPlans;

  const factory SubscriptionsEvent.loadCurrentSubscription() =
      _LoadCurrentSubscription;

  const factory SubscriptionsEvent.subscribe({
    required String planId,
    required String billingCycle,
  }) = _Subscribe;

  const factory SubscriptionsEvent.cancelSubscription() = _CancelSubscription;

  const factory SubscriptionsEvent.updateSubscription({
    required String planId,
    required String billingCycle,
  }) = _UpdateSubscription;
}
