import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/create_checkout_session.dart';
import '../../domain/usecases/get_current_subscription.dart';
import '../../domain/usecases/get_plans.dart';
import 'subscriptions_event.dart';
import 'subscriptions_state.dart';

class SubscriptionsBloc extends Bloc<SubscriptionsEvent, SubscriptionsState> {
  final GetPlans getPlansUseCase;
  final GetCurrentSubscription getCurrentSubscriptionUseCase;
  final CreateCheckoutSession createCheckoutSessionUseCase;

  SubscriptionsBloc({
    required this.getPlansUseCase,
    required this.getCurrentSubscriptionUseCase,
    required this.createCheckoutSessionUseCase,
  }) : super(const SubscriptionsState.initial()) {
    on<_LoadPlans>(_onLoadPlans);
    on<_LoadCurrentSubscription>(_onLoadCurrentSubscription);
    on<_Subscribe>(_onSubscribe);
  }

  Future<void> _onLoadPlans(
    _LoadPlans event,
    Emitter<SubscriptionsState> emit,
  ) async {
    emit(const SubscriptionsState.loading());

    final plansResult = await getPlansUseCase(NoParams());

    await plansResult.fold(
      (failure) async => emit(SubscriptionsState.error(failure)),
      (plans) async {
        // Try to load current subscription as well
        final subscriptionResult =
            await getCurrentSubscriptionUseCase(NoParams());

        subscriptionResult.fold(
          (_) => emit(SubscriptionsState.plansLoaded(plans: plans)),
          (subscription) => emit(SubscriptionsState.plansLoaded(
            plans: plans,
            currentSubscription: subscription,
          )),
        );
      },
    );
  }

  Future<void> _onLoadCurrentSubscription(
    _LoadCurrentSubscription event,
    Emitter<SubscriptionsState> emit,
  ) async {
    emit(const SubscriptionsState.loading());

    final result = await getCurrentSubscriptionUseCase(NoParams());

    result.fold(
      (failure) => emit(SubscriptionsState.error(failure)),
      (subscription) =>
          emit(SubscriptionsState.subscriptionUpdated(subscription: subscription)),
    );
  }

  Future<void> _onSubscribe(
    _Subscribe event,
    Emitter<SubscriptionsState> emit,
  ) async {
    emit(const SubscriptionsState.loading());

    final result = await createCheckoutSessionUseCase(CheckoutParams(
      planId: event.planId,
      billingCycle: event.billingCycle,
    ));

    result.fold(
      (failure) => emit(SubscriptionsState.error(failure)),
      (checkoutUrl) =>
          emit(SubscriptionsState.checkoutUrlGenerated(checkoutUrl: checkoutUrl)),
    );
  }
}
