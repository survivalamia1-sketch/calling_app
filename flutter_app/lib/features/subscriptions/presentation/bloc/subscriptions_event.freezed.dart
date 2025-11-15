// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscriptions_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPlans,
    required TResult Function() loadCurrentSubscription,
    required TResult Function(String planId, String billingCycle) subscribe,
    required TResult Function() cancelSubscription,
    required TResult Function(String planId, String billingCycle)
        updateSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPlans,
    TResult? Function()? loadCurrentSubscription,
    TResult? Function(String planId, String billingCycle)? subscribe,
    TResult? Function()? cancelSubscription,
    TResult? Function(String planId, String billingCycle)? updateSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPlans,
    TResult Function()? loadCurrentSubscription,
    TResult Function(String planId, String billingCycle)? subscribe,
    TResult Function()? cancelSubscription,
    TResult Function(String planId, String billingCycle)? updateSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPlans value) loadPlans,
    required TResult Function(LoadCurrentSubscription value)
        loadCurrentSubscription,
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(CancelSubscription value) cancelSubscription,
    required TResult Function(UpdateSubscription value) updateSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPlans value)? loadPlans,
    TResult? Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(CancelSubscription value)? cancelSubscription,
    TResult? Function(UpdateSubscription value)? updateSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPlans value)? loadPlans,
    TResult Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult Function(Subscribe value)? subscribe,
    TResult Function(CancelSubscription value)? cancelSubscription,
    TResult Function(UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionsEventCopyWith<$Res> {
  factory $SubscriptionsEventCopyWith(
          SubscriptionsEvent value, $Res Function(SubscriptionsEvent) then) =
      _$SubscriptionsEventCopyWithImpl<$Res, SubscriptionsEvent>;
}

/// @nodoc
class _$SubscriptionsEventCopyWithImpl<$Res, $Val extends SubscriptionsEvent>
    implements $SubscriptionsEventCopyWith<$Res> {
  _$SubscriptionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadPlansImplCopyWith<$Res> {
  factory _$$LoadPlansImplCopyWith(
          _$LoadPlansImpl value, $Res Function(_$LoadPlansImpl) then) =
      __$$LoadPlansImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPlansImplCopyWithImpl<$Res>
    extends _$SubscriptionsEventCopyWithImpl<$Res, _$LoadPlansImpl>
    implements _$$LoadPlansImplCopyWith<$Res> {
  __$$LoadPlansImplCopyWithImpl(
      _$LoadPlansImpl _value, $Res Function(_$LoadPlansImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadPlansImpl implements LoadPlans {
  const _$LoadPlansImpl();

  @override
  String toString() {
    return 'SubscriptionsEvent.loadPlans()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadPlansImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPlans,
    required TResult Function() loadCurrentSubscription,
    required TResult Function(String planId, String billingCycle) subscribe,
    required TResult Function() cancelSubscription,
    required TResult Function(String planId, String billingCycle)
        updateSubscription,
  }) {
    return loadPlans();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPlans,
    TResult? Function()? loadCurrentSubscription,
    TResult? Function(String planId, String billingCycle)? subscribe,
    TResult? Function()? cancelSubscription,
    TResult? Function(String planId, String billingCycle)? updateSubscription,
  }) {
    return loadPlans?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPlans,
    TResult Function()? loadCurrentSubscription,
    TResult Function(String planId, String billingCycle)? subscribe,
    TResult Function()? cancelSubscription,
    TResult Function(String planId, String billingCycle)? updateSubscription,
    required TResult orElse(),
  }) {
    if (loadPlans != null) {
      return loadPlans();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPlans value) loadPlans,
    required TResult Function(LoadCurrentSubscription value)
        loadCurrentSubscription,
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(CancelSubscription value) cancelSubscription,
    required TResult Function(UpdateSubscription value) updateSubscription,
  }) {
    return loadPlans(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPlans value)? loadPlans,
    TResult? Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(CancelSubscription value)? cancelSubscription,
    TResult? Function(UpdateSubscription value)? updateSubscription,
  }) {
    return loadPlans?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPlans value)? loadPlans,
    TResult Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult Function(Subscribe value)? subscribe,
    TResult Function(CancelSubscription value)? cancelSubscription,
    TResult Function(UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (loadPlans != null) {
      return loadPlans(this);
    }
    return orElse();
  }
}

abstract class LoadPlans implements SubscriptionsEvent {
  const factory LoadPlans() = _$LoadPlansImpl;
}

/// @nodoc
abstract class _$$LoadCurrentSubscriptionImplCopyWith<$Res> {
  factory _$$LoadCurrentSubscriptionImplCopyWith(
          _$LoadCurrentSubscriptionImpl value,
          $Res Function(_$LoadCurrentSubscriptionImpl) then) =
      __$$LoadCurrentSubscriptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCurrentSubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionsEventCopyWithImpl<$Res,
        _$LoadCurrentSubscriptionImpl>
    implements _$$LoadCurrentSubscriptionImplCopyWith<$Res> {
  __$$LoadCurrentSubscriptionImplCopyWithImpl(
      _$LoadCurrentSubscriptionImpl _value,
      $Res Function(_$LoadCurrentSubscriptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadCurrentSubscriptionImpl implements LoadCurrentSubscription {
  const _$LoadCurrentSubscriptionImpl();

  @override
  String toString() {
    return 'SubscriptionsEvent.loadCurrentSubscription()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCurrentSubscriptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPlans,
    required TResult Function() loadCurrentSubscription,
    required TResult Function(String planId, String billingCycle) subscribe,
    required TResult Function() cancelSubscription,
    required TResult Function(String planId, String billingCycle)
        updateSubscription,
  }) {
    return loadCurrentSubscription();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPlans,
    TResult? Function()? loadCurrentSubscription,
    TResult? Function(String planId, String billingCycle)? subscribe,
    TResult? Function()? cancelSubscription,
    TResult? Function(String planId, String billingCycle)? updateSubscription,
  }) {
    return loadCurrentSubscription?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPlans,
    TResult Function()? loadCurrentSubscription,
    TResult Function(String planId, String billingCycle)? subscribe,
    TResult Function()? cancelSubscription,
    TResult Function(String planId, String billingCycle)? updateSubscription,
    required TResult orElse(),
  }) {
    if (loadCurrentSubscription != null) {
      return loadCurrentSubscription();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPlans value) loadPlans,
    required TResult Function(LoadCurrentSubscription value)
        loadCurrentSubscription,
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(CancelSubscription value) cancelSubscription,
    required TResult Function(UpdateSubscription value) updateSubscription,
  }) {
    return loadCurrentSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPlans value)? loadPlans,
    TResult? Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(CancelSubscription value)? cancelSubscription,
    TResult? Function(UpdateSubscription value)? updateSubscription,
  }) {
    return loadCurrentSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPlans value)? loadPlans,
    TResult Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult Function(Subscribe value)? subscribe,
    TResult Function(CancelSubscription value)? cancelSubscription,
    TResult Function(UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (loadCurrentSubscription != null) {
      return loadCurrentSubscription(this);
    }
    return orElse();
  }
}

abstract class LoadCurrentSubscription implements SubscriptionsEvent {
  const factory LoadCurrentSubscription() = _$LoadCurrentSubscriptionImpl;
}

/// @nodoc
abstract class _$$SubscribeImplCopyWith<$Res> {
  factory _$$SubscribeImplCopyWith(
          _$SubscribeImpl value, $Res Function(_$SubscribeImpl) then) =
      __$$SubscribeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String planId, String billingCycle});
}

/// @nodoc
class __$$SubscribeImplCopyWithImpl<$Res>
    extends _$SubscriptionsEventCopyWithImpl<$Res, _$SubscribeImpl>
    implements _$$SubscribeImplCopyWith<$Res> {
  __$$SubscribeImplCopyWithImpl(
      _$SubscribeImpl _value, $Res Function(_$SubscribeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? billingCycle = null,
  }) {
    return _then(_$SubscribeImpl(
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      billingCycle: null == billingCycle
          ? _value.billingCycle
          : billingCycle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubscribeImpl implements Subscribe {
  const _$SubscribeImpl({required this.planId, required this.billingCycle});

  @override
  final String planId;
  @override
  final String billingCycle;

  @override
  String toString() {
    return 'SubscriptionsEvent.subscribe(planId: $planId, billingCycle: $billingCycle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.billingCycle, billingCycle) ||
                other.billingCycle == billingCycle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, planId, billingCycle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeImplCopyWith<_$SubscribeImpl> get copyWith =>
      __$$SubscribeImplCopyWithImpl<_$SubscribeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPlans,
    required TResult Function() loadCurrentSubscription,
    required TResult Function(String planId, String billingCycle) subscribe,
    required TResult Function() cancelSubscription,
    required TResult Function(String planId, String billingCycle)
        updateSubscription,
  }) {
    return subscribe(planId, billingCycle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPlans,
    TResult? Function()? loadCurrentSubscription,
    TResult? Function(String planId, String billingCycle)? subscribe,
    TResult? Function()? cancelSubscription,
    TResult? Function(String planId, String billingCycle)? updateSubscription,
  }) {
    return subscribe?.call(planId, billingCycle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPlans,
    TResult Function()? loadCurrentSubscription,
    TResult Function(String planId, String billingCycle)? subscribe,
    TResult Function()? cancelSubscription,
    TResult Function(String planId, String billingCycle)? updateSubscription,
    required TResult orElse(),
  }) {
    if (subscribe != null) {
      return subscribe(planId, billingCycle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPlans value) loadPlans,
    required TResult Function(LoadCurrentSubscription value)
        loadCurrentSubscription,
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(CancelSubscription value) cancelSubscription,
    required TResult Function(UpdateSubscription value) updateSubscription,
  }) {
    return subscribe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPlans value)? loadPlans,
    TResult? Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(CancelSubscription value)? cancelSubscription,
    TResult? Function(UpdateSubscription value)? updateSubscription,
  }) {
    return subscribe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPlans value)? loadPlans,
    TResult Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult Function(Subscribe value)? subscribe,
    TResult Function(CancelSubscription value)? cancelSubscription,
    TResult Function(UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (subscribe != null) {
      return subscribe(this);
    }
    return orElse();
  }
}

abstract class Subscribe implements SubscriptionsEvent {
  const factory Subscribe(
      {required final String planId,
      required final String billingCycle}) = _$SubscribeImpl;

  String get planId;
  String get billingCycle;
  @JsonKey(ignore: true)
  _$$SubscribeImplCopyWith<_$SubscribeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelSubscriptionImplCopyWith<$Res> {
  factory _$$CancelSubscriptionImplCopyWith(_$CancelSubscriptionImpl value,
          $Res Function(_$CancelSubscriptionImpl) then) =
      __$$CancelSubscriptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelSubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionsEventCopyWithImpl<$Res, _$CancelSubscriptionImpl>
    implements _$$CancelSubscriptionImplCopyWith<$Res> {
  __$$CancelSubscriptionImplCopyWithImpl(_$CancelSubscriptionImpl _value,
      $Res Function(_$CancelSubscriptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelSubscriptionImpl implements CancelSubscription {
  const _$CancelSubscriptionImpl();

  @override
  String toString() {
    return 'SubscriptionsEvent.cancelSubscription()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelSubscriptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPlans,
    required TResult Function() loadCurrentSubscription,
    required TResult Function(String planId, String billingCycle) subscribe,
    required TResult Function() cancelSubscription,
    required TResult Function(String planId, String billingCycle)
        updateSubscription,
  }) {
    return cancelSubscription();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPlans,
    TResult? Function()? loadCurrentSubscription,
    TResult? Function(String planId, String billingCycle)? subscribe,
    TResult? Function()? cancelSubscription,
    TResult? Function(String planId, String billingCycle)? updateSubscription,
  }) {
    return cancelSubscription?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPlans,
    TResult Function()? loadCurrentSubscription,
    TResult Function(String planId, String billingCycle)? subscribe,
    TResult Function()? cancelSubscription,
    TResult Function(String planId, String billingCycle)? updateSubscription,
    required TResult orElse(),
  }) {
    if (cancelSubscription != null) {
      return cancelSubscription();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPlans value) loadPlans,
    required TResult Function(LoadCurrentSubscription value)
        loadCurrentSubscription,
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(CancelSubscription value) cancelSubscription,
    required TResult Function(UpdateSubscription value) updateSubscription,
  }) {
    return cancelSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPlans value)? loadPlans,
    TResult? Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(CancelSubscription value)? cancelSubscription,
    TResult? Function(UpdateSubscription value)? updateSubscription,
  }) {
    return cancelSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPlans value)? loadPlans,
    TResult Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult Function(Subscribe value)? subscribe,
    TResult Function(CancelSubscription value)? cancelSubscription,
    TResult Function(UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (cancelSubscription != null) {
      return cancelSubscription(this);
    }
    return orElse();
  }
}

abstract class CancelSubscription implements SubscriptionsEvent {
  const factory CancelSubscription() = _$CancelSubscriptionImpl;
}

/// @nodoc
abstract class _$$UpdateSubscriptionImplCopyWith<$Res> {
  factory _$$UpdateSubscriptionImplCopyWith(_$UpdateSubscriptionImpl value,
          $Res Function(_$UpdateSubscriptionImpl) then) =
      __$$UpdateSubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String planId, String billingCycle});
}

/// @nodoc
class __$$UpdateSubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionsEventCopyWithImpl<$Res, _$UpdateSubscriptionImpl>
    implements _$$UpdateSubscriptionImplCopyWith<$Res> {
  __$$UpdateSubscriptionImplCopyWithImpl(_$UpdateSubscriptionImpl _value,
      $Res Function(_$UpdateSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? billingCycle = null,
  }) {
    return _then(_$UpdateSubscriptionImpl(
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      billingCycle: null == billingCycle
          ? _value.billingCycle
          : billingCycle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateSubscriptionImpl implements UpdateSubscription {
  const _$UpdateSubscriptionImpl(
      {required this.planId, required this.billingCycle});

  @override
  final String planId;
  @override
  final String billingCycle;

  @override
  String toString() {
    return 'SubscriptionsEvent.updateSubscription(planId: $planId, billingCycle: $billingCycle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSubscriptionImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.billingCycle, billingCycle) ||
                other.billingCycle == billingCycle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, planId, billingCycle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSubscriptionImplCopyWith<_$UpdateSubscriptionImpl> get copyWith =>
      __$$UpdateSubscriptionImplCopyWithImpl<_$UpdateSubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPlans,
    required TResult Function() loadCurrentSubscription,
    required TResult Function(String planId, String billingCycle) subscribe,
    required TResult Function() cancelSubscription,
    required TResult Function(String planId, String billingCycle)
        updateSubscription,
  }) {
    return updateSubscription(planId, billingCycle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPlans,
    TResult? Function()? loadCurrentSubscription,
    TResult? Function(String planId, String billingCycle)? subscribe,
    TResult? Function()? cancelSubscription,
    TResult? Function(String planId, String billingCycle)? updateSubscription,
  }) {
    return updateSubscription?.call(planId, billingCycle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPlans,
    TResult Function()? loadCurrentSubscription,
    TResult Function(String planId, String billingCycle)? subscribe,
    TResult Function()? cancelSubscription,
    TResult Function(String planId, String billingCycle)? updateSubscription,
    required TResult orElse(),
  }) {
    if (updateSubscription != null) {
      return updateSubscription(planId, billingCycle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPlans value) loadPlans,
    required TResult Function(LoadCurrentSubscription value)
        loadCurrentSubscription,
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(CancelSubscription value) cancelSubscription,
    required TResult Function(UpdateSubscription value) updateSubscription,
  }) {
    return updateSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPlans value)? loadPlans,
    TResult? Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(CancelSubscription value)? cancelSubscription,
    TResult? Function(UpdateSubscription value)? updateSubscription,
  }) {
    return updateSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPlans value)? loadPlans,
    TResult Function(LoadCurrentSubscription value)? loadCurrentSubscription,
    TResult Function(Subscribe value)? subscribe,
    TResult Function(CancelSubscription value)? cancelSubscription,
    TResult Function(UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (updateSubscription != null) {
      return updateSubscription(this);
    }
    return orElse();
  }
}

abstract class UpdateSubscription implements SubscriptionsEvent {
  const factory UpdateSubscription(
      {required final String planId,
      required final String billingCycle}) = _$UpdateSubscriptionImpl;

  String get planId;
  String get billingCycle;
  @JsonKey(ignore: true)
  _$$UpdateSubscriptionImplCopyWith<_$UpdateSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
