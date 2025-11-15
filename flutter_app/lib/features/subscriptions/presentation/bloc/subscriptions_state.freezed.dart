// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscriptions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<SubscriptionPlan> plans, UserSubscription? currentSubscription)
        plansLoaded,
    required TResult Function(String checkoutUrl) checkoutUrlGenerated,
    required TResult Function(UserSubscription subscription)
        subscriptionUpdated,
    required TResult Function() subscriptionCanceled,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult? Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult? Function(UserSubscription subscription)? subscriptionUpdated,
    TResult? Function()? subscriptionCanceled,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult Function(UserSubscription subscription)? subscriptionUpdated,
    TResult Function()? subscriptionCanceled,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(PlansLoaded value) plansLoaded,
    required TResult Function(CheckoutUrlGenerated value) checkoutUrlGenerated,
    required TResult Function(SubscriptionUpdated value) subscriptionUpdated,
    required TResult Function(SubscriptionCanceled value) subscriptionCanceled,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(PlansLoaded value)? plansLoaded,
    TResult? Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult? Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult? Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(PlansLoaded value)? plansLoaded,
    TResult Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionsStateCopyWith<$Res> {
  factory $SubscriptionsStateCopyWith(
          SubscriptionsState value, $Res Function(SubscriptionsState) then) =
      _$SubscriptionsStateCopyWithImpl<$Res, SubscriptionsState>;
}

/// @nodoc
class _$SubscriptionsStateCopyWithImpl<$Res, $Val extends SubscriptionsState>
    implements $SubscriptionsStateCopyWith<$Res> {
  _$SubscriptionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SubscriptionsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SubscriptionsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<SubscriptionPlan> plans, UserSubscription? currentSubscription)
        plansLoaded,
    required TResult Function(String checkoutUrl) checkoutUrlGenerated,
    required TResult Function(UserSubscription subscription)
        subscriptionUpdated,
    required TResult Function() subscriptionCanceled,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult? Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult? Function(UserSubscription subscription)? subscriptionUpdated,
    TResult? Function()? subscriptionCanceled,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult Function(UserSubscription subscription)? subscriptionUpdated,
    TResult Function()? subscriptionCanceled,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(PlansLoaded value) plansLoaded,
    required TResult Function(CheckoutUrlGenerated value) checkoutUrlGenerated,
    required TResult Function(SubscriptionUpdated value) subscriptionUpdated,
    required TResult Function(SubscriptionCanceled value) subscriptionCanceled,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(PlansLoaded value)? plansLoaded,
    TResult? Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult? Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult? Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(PlansLoaded value)? plansLoaded,
    TResult Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SubscriptionsState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SubscriptionsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SubscriptionsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<SubscriptionPlan> plans, UserSubscription? currentSubscription)
        plansLoaded,
    required TResult Function(String checkoutUrl) checkoutUrlGenerated,
    required TResult Function(UserSubscription subscription)
        subscriptionUpdated,
    required TResult Function() subscriptionCanceled,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult? Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult? Function(UserSubscription subscription)? subscriptionUpdated,
    TResult? Function()? subscriptionCanceled,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult Function(UserSubscription subscription)? subscriptionUpdated,
    TResult Function()? subscriptionCanceled,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(PlansLoaded value) plansLoaded,
    required TResult Function(CheckoutUrlGenerated value) checkoutUrlGenerated,
    required TResult Function(SubscriptionUpdated value) subscriptionUpdated,
    required TResult Function(SubscriptionCanceled value) subscriptionCanceled,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(PlansLoaded value)? plansLoaded,
    TResult? Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult? Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult? Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(PlansLoaded value)? plansLoaded,
    TResult Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SubscriptionsState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$PlansLoadedImplCopyWith<$Res> {
  factory _$$PlansLoadedImplCopyWith(
          _$PlansLoadedImpl value, $Res Function(_$PlansLoadedImpl) then) =
      __$$PlansLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<SubscriptionPlan> plans, UserSubscription? currentSubscription});
}

/// @nodoc
class __$$PlansLoadedImplCopyWithImpl<$Res>
    extends _$SubscriptionsStateCopyWithImpl<$Res, _$PlansLoadedImpl>
    implements _$$PlansLoadedImplCopyWith<$Res> {
  __$$PlansLoadedImplCopyWithImpl(
      _$PlansLoadedImpl _value, $Res Function(_$PlansLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plans = null,
    Object? currentSubscription = freezed,
  }) {
    return _then(_$PlansLoadedImpl(
      plans: null == plans
          ? _value._plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionPlan>,
      currentSubscription: freezed == currentSubscription
          ? _value.currentSubscription
          : currentSubscription // ignore: cast_nullable_to_non_nullable
              as UserSubscription?,
    ));
  }
}

/// @nodoc

class _$PlansLoadedImpl implements PlansLoaded {
  const _$PlansLoadedImpl(
      {required final List<SubscriptionPlan> plans, this.currentSubscription})
      : _plans = plans;

  final List<SubscriptionPlan> _plans;
  @override
  List<SubscriptionPlan> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  @override
  final UserSubscription? currentSubscription;

  @override
  String toString() {
    return 'SubscriptionsState.plansLoaded(plans: $plans, currentSubscription: $currentSubscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlansLoadedImpl &&
            const DeepCollectionEquality().equals(other._plans, _plans) &&
            (identical(other.currentSubscription, currentSubscription) ||
                other.currentSubscription == currentSubscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_plans), currentSubscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlansLoadedImplCopyWith<_$PlansLoadedImpl> get copyWith =>
      __$$PlansLoadedImplCopyWithImpl<_$PlansLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<SubscriptionPlan> plans, UserSubscription? currentSubscription)
        plansLoaded,
    required TResult Function(String checkoutUrl) checkoutUrlGenerated,
    required TResult Function(UserSubscription subscription)
        subscriptionUpdated,
    required TResult Function() subscriptionCanceled,
    required TResult Function(Failure failure) error,
  }) {
    return plansLoaded(plans, currentSubscription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult? Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult? Function(UserSubscription subscription)? subscriptionUpdated,
    TResult? Function()? subscriptionCanceled,
    TResult? Function(Failure failure)? error,
  }) {
    return plansLoaded?.call(plans, currentSubscription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult Function(UserSubscription subscription)? subscriptionUpdated,
    TResult Function()? subscriptionCanceled,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (plansLoaded != null) {
      return plansLoaded(plans, currentSubscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(PlansLoaded value) plansLoaded,
    required TResult Function(CheckoutUrlGenerated value) checkoutUrlGenerated,
    required TResult Function(SubscriptionUpdated value) subscriptionUpdated,
    required TResult Function(SubscriptionCanceled value) subscriptionCanceled,
    required TResult Function(Error value) error,
  }) {
    return plansLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(PlansLoaded value)? plansLoaded,
    TResult? Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult? Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult? Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult? Function(Error value)? error,
  }) {
    return plansLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(PlansLoaded value)? plansLoaded,
    TResult Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (plansLoaded != null) {
      return plansLoaded(this);
    }
    return orElse();
  }
}

abstract class PlansLoaded implements SubscriptionsState {
  const factory PlansLoaded(
      {required final List<SubscriptionPlan> plans,
      final UserSubscription? currentSubscription}) = _$PlansLoadedImpl;

  List<SubscriptionPlan> get plans;
  UserSubscription? get currentSubscription;
  @JsonKey(ignore: true)
  _$$PlansLoadedImplCopyWith<_$PlansLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutUrlGeneratedImplCopyWith<$Res> {
  factory _$$CheckoutUrlGeneratedImplCopyWith(_$CheckoutUrlGeneratedImpl value,
          $Res Function(_$CheckoutUrlGeneratedImpl) then) =
      __$$CheckoutUrlGeneratedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String checkoutUrl});
}

/// @nodoc
class __$$CheckoutUrlGeneratedImplCopyWithImpl<$Res>
    extends _$SubscriptionsStateCopyWithImpl<$Res, _$CheckoutUrlGeneratedImpl>
    implements _$$CheckoutUrlGeneratedImplCopyWith<$Res> {
  __$$CheckoutUrlGeneratedImplCopyWithImpl(_$CheckoutUrlGeneratedImpl _value,
      $Res Function(_$CheckoutUrlGeneratedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkoutUrl = null,
  }) {
    return _then(_$CheckoutUrlGeneratedImpl(
      checkoutUrl: null == checkoutUrl
          ? _value.checkoutUrl
          : checkoutUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckoutUrlGeneratedImpl implements CheckoutUrlGenerated {
  const _$CheckoutUrlGeneratedImpl({required this.checkoutUrl});

  @override
  final String checkoutUrl;

  @override
  String toString() {
    return 'SubscriptionsState.checkoutUrlGenerated(checkoutUrl: $checkoutUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutUrlGeneratedImpl &&
            (identical(other.checkoutUrl, checkoutUrl) ||
                other.checkoutUrl == checkoutUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkoutUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutUrlGeneratedImplCopyWith<_$CheckoutUrlGeneratedImpl>
      get copyWith =>
          __$$CheckoutUrlGeneratedImplCopyWithImpl<_$CheckoutUrlGeneratedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<SubscriptionPlan> plans, UserSubscription? currentSubscription)
        plansLoaded,
    required TResult Function(String checkoutUrl) checkoutUrlGenerated,
    required TResult Function(UserSubscription subscription)
        subscriptionUpdated,
    required TResult Function() subscriptionCanceled,
    required TResult Function(Failure failure) error,
  }) {
    return checkoutUrlGenerated(checkoutUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult? Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult? Function(UserSubscription subscription)? subscriptionUpdated,
    TResult? Function()? subscriptionCanceled,
    TResult? Function(Failure failure)? error,
  }) {
    return checkoutUrlGenerated?.call(checkoutUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult Function(UserSubscription subscription)? subscriptionUpdated,
    TResult Function()? subscriptionCanceled,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (checkoutUrlGenerated != null) {
      return checkoutUrlGenerated(checkoutUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(PlansLoaded value) plansLoaded,
    required TResult Function(CheckoutUrlGenerated value) checkoutUrlGenerated,
    required TResult Function(SubscriptionUpdated value) subscriptionUpdated,
    required TResult Function(SubscriptionCanceled value) subscriptionCanceled,
    required TResult Function(Error value) error,
  }) {
    return checkoutUrlGenerated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(PlansLoaded value)? plansLoaded,
    TResult? Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult? Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult? Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult? Function(Error value)? error,
  }) {
    return checkoutUrlGenerated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(PlansLoaded value)? plansLoaded,
    TResult Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (checkoutUrlGenerated != null) {
      return checkoutUrlGenerated(this);
    }
    return orElse();
  }
}

abstract class CheckoutUrlGenerated implements SubscriptionsState {
  const factory CheckoutUrlGenerated({required final String checkoutUrl}) =
      _$CheckoutUrlGeneratedImpl;

  String get checkoutUrl;
  @JsonKey(ignore: true)
  _$$CheckoutUrlGeneratedImplCopyWith<_$CheckoutUrlGeneratedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubscriptionUpdatedImplCopyWith<$Res> {
  factory _$$SubscriptionUpdatedImplCopyWith(_$SubscriptionUpdatedImpl value,
          $Res Function(_$SubscriptionUpdatedImpl) then) =
      __$$SubscriptionUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserSubscription subscription});
}

/// @nodoc
class __$$SubscriptionUpdatedImplCopyWithImpl<$Res>
    extends _$SubscriptionsStateCopyWithImpl<$Res, _$SubscriptionUpdatedImpl>
    implements _$$SubscriptionUpdatedImplCopyWith<$Res> {
  __$$SubscriptionUpdatedImplCopyWithImpl(_$SubscriptionUpdatedImpl _value,
      $Res Function(_$SubscriptionUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = null,
  }) {
    return _then(_$SubscriptionUpdatedImpl(
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as UserSubscription,
    ));
  }
}

/// @nodoc

class _$SubscriptionUpdatedImpl implements SubscriptionUpdated {
  const _$SubscriptionUpdatedImpl({required this.subscription});

  @override
  final UserSubscription subscription;

  @override
  String toString() {
    return 'SubscriptionsState.subscriptionUpdated(subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionUpdatedImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionUpdatedImplCopyWith<_$SubscriptionUpdatedImpl> get copyWith =>
      __$$SubscriptionUpdatedImplCopyWithImpl<_$SubscriptionUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<SubscriptionPlan> plans, UserSubscription? currentSubscription)
        plansLoaded,
    required TResult Function(String checkoutUrl) checkoutUrlGenerated,
    required TResult Function(UserSubscription subscription)
        subscriptionUpdated,
    required TResult Function() subscriptionCanceled,
    required TResult Function(Failure failure) error,
  }) {
    return subscriptionUpdated(subscription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult? Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult? Function(UserSubscription subscription)? subscriptionUpdated,
    TResult? Function()? subscriptionCanceled,
    TResult? Function(Failure failure)? error,
  }) {
    return subscriptionUpdated?.call(subscription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult Function(UserSubscription subscription)? subscriptionUpdated,
    TResult Function()? subscriptionCanceled,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (subscriptionUpdated != null) {
      return subscriptionUpdated(subscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(PlansLoaded value) plansLoaded,
    required TResult Function(CheckoutUrlGenerated value) checkoutUrlGenerated,
    required TResult Function(SubscriptionUpdated value) subscriptionUpdated,
    required TResult Function(SubscriptionCanceled value) subscriptionCanceled,
    required TResult Function(Error value) error,
  }) {
    return subscriptionUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(PlansLoaded value)? plansLoaded,
    TResult? Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult? Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult? Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult? Function(Error value)? error,
  }) {
    return subscriptionUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(PlansLoaded value)? plansLoaded,
    TResult Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (subscriptionUpdated != null) {
      return subscriptionUpdated(this);
    }
    return orElse();
  }
}

abstract class SubscriptionUpdated implements SubscriptionsState {
  const factory SubscriptionUpdated(
          {required final UserSubscription subscription}) =
      _$SubscriptionUpdatedImpl;

  UserSubscription get subscription;
  @JsonKey(ignore: true)
  _$$SubscriptionUpdatedImplCopyWith<_$SubscriptionUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubscriptionCanceledImplCopyWith<$Res> {
  factory _$$SubscriptionCanceledImplCopyWith(_$SubscriptionCanceledImpl value,
          $Res Function(_$SubscriptionCanceledImpl) then) =
      __$$SubscriptionCanceledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubscriptionCanceledImplCopyWithImpl<$Res>
    extends _$SubscriptionsStateCopyWithImpl<$Res, _$SubscriptionCanceledImpl>
    implements _$$SubscriptionCanceledImplCopyWith<$Res> {
  __$$SubscriptionCanceledImplCopyWithImpl(_$SubscriptionCanceledImpl _value,
      $Res Function(_$SubscriptionCanceledImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubscriptionCanceledImpl implements SubscriptionCanceled {
  const _$SubscriptionCanceledImpl();

  @override
  String toString() {
    return 'SubscriptionsState.subscriptionCanceled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionCanceledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<SubscriptionPlan> plans, UserSubscription? currentSubscription)
        plansLoaded,
    required TResult Function(String checkoutUrl) checkoutUrlGenerated,
    required TResult Function(UserSubscription subscription)
        subscriptionUpdated,
    required TResult Function() subscriptionCanceled,
    required TResult Function(Failure failure) error,
  }) {
    return subscriptionCanceled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult? Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult? Function(UserSubscription subscription)? subscriptionUpdated,
    TResult? Function()? subscriptionCanceled,
    TResult? Function(Failure failure)? error,
  }) {
    return subscriptionCanceled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult Function(UserSubscription subscription)? subscriptionUpdated,
    TResult Function()? subscriptionCanceled,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (subscriptionCanceled != null) {
      return subscriptionCanceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(PlansLoaded value) plansLoaded,
    required TResult Function(CheckoutUrlGenerated value) checkoutUrlGenerated,
    required TResult Function(SubscriptionUpdated value) subscriptionUpdated,
    required TResult Function(SubscriptionCanceled value) subscriptionCanceled,
    required TResult Function(Error value) error,
  }) {
    return subscriptionCanceled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(PlansLoaded value)? plansLoaded,
    TResult? Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult? Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult? Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult? Function(Error value)? error,
  }) {
    return subscriptionCanceled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(PlansLoaded value)? plansLoaded,
    TResult Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (subscriptionCanceled != null) {
      return subscriptionCanceled(this);
    }
    return orElse();
  }
}

abstract class SubscriptionCanceled implements SubscriptionsState {
  const factory SubscriptionCanceled() = _$SubscriptionCanceledImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SubscriptionsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'SubscriptionsState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<SubscriptionPlan> plans, UserSubscription? currentSubscription)
        plansLoaded,
    required TResult Function(String checkoutUrl) checkoutUrlGenerated,
    required TResult Function(UserSubscription subscription)
        subscriptionUpdated,
    required TResult Function() subscriptionCanceled,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult? Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult? Function(UserSubscription subscription)? subscriptionUpdated,
    TResult? Function()? subscriptionCanceled,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubscriptionPlan> plans,
            UserSubscription? currentSubscription)?
        plansLoaded,
    TResult Function(String checkoutUrl)? checkoutUrlGenerated,
    TResult Function(UserSubscription subscription)? subscriptionUpdated,
    TResult Function()? subscriptionCanceled,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(PlansLoaded value) plansLoaded,
    required TResult Function(CheckoutUrlGenerated value) checkoutUrlGenerated,
    required TResult Function(SubscriptionUpdated value) subscriptionUpdated,
    required TResult Function(SubscriptionCanceled value) subscriptionCanceled,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(PlansLoaded value)? plansLoaded,
    TResult? Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult? Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult? Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(PlansLoaded value)? plansLoaded,
    TResult Function(CheckoutUrlGenerated value)? checkoutUrlGenerated,
    TResult Function(SubscriptionUpdated value)? subscriptionUpdated,
    TResult Function(SubscriptionCanceled value)? subscriptionCanceled,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements SubscriptionsState {
  const factory Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
