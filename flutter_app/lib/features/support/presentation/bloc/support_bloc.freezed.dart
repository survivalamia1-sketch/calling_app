// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SupportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFAQs,
    required TResult Function(BugReport bugReport) submitBugReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFAQs,
    TResult? Function(BugReport bugReport)? submitBugReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFAQs,
    TResult Function(BugReport bugReport)? submitBugReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFAQs value) loadFAQs,
    required TResult Function(SubmitBugReport value) submitBugReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFAQs value)? loadFAQs,
    TResult? Function(SubmitBugReport value)? submitBugReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFAQs value)? loadFAQs,
    TResult Function(SubmitBugReport value)? submitBugReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportEventCopyWith<$Res> {
  factory $SupportEventCopyWith(
          SupportEvent value, $Res Function(SupportEvent) then) =
      _$SupportEventCopyWithImpl<$Res, SupportEvent>;
}

/// @nodoc
class _$SupportEventCopyWithImpl<$Res, $Val extends SupportEvent>
    implements $SupportEventCopyWith<$Res> {
  _$SupportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadFAQsImplCopyWith<$Res> {
  factory _$$LoadFAQsImplCopyWith(
          _$LoadFAQsImpl value, $Res Function(_$LoadFAQsImpl) then) =
      __$$LoadFAQsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFAQsImplCopyWithImpl<$Res>
    extends _$SupportEventCopyWithImpl<$Res, _$LoadFAQsImpl>
    implements _$$LoadFAQsImplCopyWith<$Res> {
  __$$LoadFAQsImplCopyWithImpl(
      _$LoadFAQsImpl _value, $Res Function(_$LoadFAQsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFAQsImpl implements LoadFAQs {
  const _$LoadFAQsImpl();

  @override
  String toString() {
    return 'SupportEvent.loadFAQs()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFAQsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFAQs,
    required TResult Function(BugReport bugReport) submitBugReport,
  }) {
    return loadFAQs();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFAQs,
    TResult? Function(BugReport bugReport)? submitBugReport,
  }) {
    return loadFAQs?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFAQs,
    TResult Function(BugReport bugReport)? submitBugReport,
    required TResult orElse(),
  }) {
    if (loadFAQs != null) {
      return loadFAQs();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFAQs value) loadFAQs,
    required TResult Function(SubmitBugReport value) submitBugReport,
  }) {
    return loadFAQs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFAQs value)? loadFAQs,
    TResult? Function(SubmitBugReport value)? submitBugReport,
  }) {
    return loadFAQs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFAQs value)? loadFAQs,
    TResult Function(SubmitBugReport value)? submitBugReport,
    required TResult orElse(),
  }) {
    if (loadFAQs != null) {
      return loadFAQs(this);
    }
    return orElse();
  }
}

abstract class LoadFAQs implements SupportEvent {
  const factory LoadFAQs() = _$LoadFAQsImpl;
}

/// @nodoc
abstract class _$$SubmitBugReportImplCopyWith<$Res> {
  factory _$$SubmitBugReportImplCopyWith(_$SubmitBugReportImpl value,
          $Res Function(_$SubmitBugReportImpl) then) =
      __$$SubmitBugReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BugReport bugReport});
}

/// @nodoc
class __$$SubmitBugReportImplCopyWithImpl<$Res>
    extends _$SupportEventCopyWithImpl<$Res, _$SubmitBugReportImpl>
    implements _$$SubmitBugReportImplCopyWith<$Res> {
  __$$SubmitBugReportImplCopyWithImpl(
      _$SubmitBugReportImpl _value, $Res Function(_$SubmitBugReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bugReport = null,
  }) {
    return _then(_$SubmitBugReportImpl(
      bugReport: null == bugReport
          ? _value.bugReport
          : bugReport // ignore: cast_nullable_to_non_nullable
              as BugReport,
    ));
  }
}

/// @nodoc

class _$SubmitBugReportImpl implements SubmitBugReport {
  const _$SubmitBugReportImpl({required this.bugReport});

  @override
  final BugReport bugReport;

  @override
  String toString() {
    return 'SupportEvent.submitBugReport(bugReport: $bugReport)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitBugReportImpl &&
            (identical(other.bugReport, bugReport) ||
                other.bugReport == bugReport));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bugReport);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitBugReportImplCopyWith<_$SubmitBugReportImpl> get copyWith =>
      __$$SubmitBugReportImplCopyWithImpl<_$SubmitBugReportImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFAQs,
    required TResult Function(BugReport bugReport) submitBugReport,
  }) {
    return submitBugReport(bugReport);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFAQs,
    TResult? Function(BugReport bugReport)? submitBugReport,
  }) {
    return submitBugReport?.call(bugReport);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFAQs,
    TResult Function(BugReport bugReport)? submitBugReport,
    required TResult orElse(),
  }) {
    if (submitBugReport != null) {
      return submitBugReport(bugReport);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFAQs value) loadFAQs,
    required TResult Function(SubmitBugReport value) submitBugReport,
  }) {
    return submitBugReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFAQs value)? loadFAQs,
    TResult? Function(SubmitBugReport value)? submitBugReport,
  }) {
    return submitBugReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFAQs value)? loadFAQs,
    TResult Function(SubmitBugReport value)? submitBugReport,
    required TResult orElse(),
  }) {
    if (submitBugReport != null) {
      return submitBugReport(this);
    }
    return orElse();
  }
}

abstract class SubmitBugReport implements SupportEvent {
  const factory SubmitBugReport({required final BugReport bugReport}) =
      _$SubmitBugReportImpl;

  BugReport get bugReport;
  @JsonKey(ignore: true)
  _$$SubmitBugReportImplCopyWith<_$SubmitBugReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SupportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FAQ> faqs) faqsLoaded,
    required TResult Function() bugReportSubmitted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FAQ> faqs)? faqsLoaded,
    TResult? Function()? bugReportSubmitted,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FAQ> faqs)? faqsLoaded,
    TResult Function()? bugReportSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(FAQsLoaded value) faqsLoaded,
    required TResult Function(BugReportSubmitted value) bugReportSubmitted,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FAQsLoaded value)? faqsLoaded,
    TResult? Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FAQsLoaded value)? faqsLoaded,
    TResult Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportStateCopyWith<$Res> {
  factory $SupportStateCopyWith(
          SupportState value, $Res Function(SupportState) then) =
      _$SupportStateCopyWithImpl<$Res, SupportState>;
}

/// @nodoc
class _$SupportStateCopyWithImpl<$Res, $Val extends SupportState>
    implements $SupportStateCopyWith<$Res> {
  _$SupportStateCopyWithImpl(this._value, this._then);

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
    extends _$SupportStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SupportState.initial()';
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
    required TResult Function(List<FAQ> faqs) faqsLoaded,
    required TResult Function() bugReportSubmitted,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FAQ> faqs)? faqsLoaded,
    TResult? Function()? bugReportSubmitted,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FAQ> faqs)? faqsLoaded,
    TResult Function()? bugReportSubmitted,
    TResult Function(String message)? error,
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
    required TResult Function(FAQsLoaded value) faqsLoaded,
    required TResult Function(BugReportSubmitted value) bugReportSubmitted,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FAQsLoaded value)? faqsLoaded,
    TResult? Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FAQsLoaded value)? faqsLoaded,
    TResult Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SupportState {
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
    extends _$SupportStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'SupportState.loading()';
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
    required TResult Function(List<FAQ> faqs) faqsLoaded,
    required TResult Function() bugReportSubmitted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FAQ> faqs)? faqsLoaded,
    TResult? Function()? bugReportSubmitted,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FAQ> faqs)? faqsLoaded,
    TResult Function()? bugReportSubmitted,
    TResult Function(String message)? error,
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
    required TResult Function(FAQsLoaded value) faqsLoaded,
    required TResult Function(BugReportSubmitted value) bugReportSubmitted,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FAQsLoaded value)? faqsLoaded,
    TResult? Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FAQsLoaded value)? faqsLoaded,
    TResult Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SupportState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FAQsLoadedImplCopyWith<$Res> {
  factory _$$FAQsLoadedImplCopyWith(
          _$FAQsLoadedImpl value, $Res Function(_$FAQsLoadedImpl) then) =
      __$$FAQsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FAQ> faqs});
}

/// @nodoc
class __$$FAQsLoadedImplCopyWithImpl<$Res>
    extends _$SupportStateCopyWithImpl<$Res, _$FAQsLoadedImpl>
    implements _$$FAQsLoadedImplCopyWith<$Res> {
  __$$FAQsLoadedImplCopyWithImpl(
      _$FAQsLoadedImpl _value, $Res Function(_$FAQsLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faqs = null,
  }) {
    return _then(_$FAQsLoadedImpl(
      faqs: null == faqs
          ? _value._faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<FAQ>,
    ));
  }
}

/// @nodoc

class _$FAQsLoadedImpl implements FAQsLoaded {
  const _$FAQsLoadedImpl({required final List<FAQ> faqs}) : _faqs = faqs;

  final List<FAQ> _faqs;
  @override
  List<FAQ> get faqs {
    if (_faqs is EqualUnmodifiableListView) return _faqs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqs);
  }

  @override
  String toString() {
    return 'SupportState.faqsLoaded(faqs: $faqs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAQsLoadedImpl &&
            const DeepCollectionEquality().equals(other._faqs, _faqs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_faqs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAQsLoadedImplCopyWith<_$FAQsLoadedImpl> get copyWith =>
      __$$FAQsLoadedImplCopyWithImpl<_$FAQsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FAQ> faqs) faqsLoaded,
    required TResult Function() bugReportSubmitted,
    required TResult Function(String message) error,
  }) {
    return faqsLoaded(faqs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FAQ> faqs)? faqsLoaded,
    TResult? Function()? bugReportSubmitted,
    TResult? Function(String message)? error,
  }) {
    return faqsLoaded?.call(faqs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FAQ> faqs)? faqsLoaded,
    TResult Function()? bugReportSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (faqsLoaded != null) {
      return faqsLoaded(faqs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(FAQsLoaded value) faqsLoaded,
    required TResult Function(BugReportSubmitted value) bugReportSubmitted,
    required TResult Function(Error value) error,
  }) {
    return faqsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FAQsLoaded value)? faqsLoaded,
    TResult? Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult? Function(Error value)? error,
  }) {
    return faqsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FAQsLoaded value)? faqsLoaded,
    TResult Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (faqsLoaded != null) {
      return faqsLoaded(this);
    }
    return orElse();
  }
}

abstract class FAQsLoaded implements SupportState {
  const factory FAQsLoaded({required final List<FAQ> faqs}) = _$FAQsLoadedImpl;

  List<FAQ> get faqs;
  @JsonKey(ignore: true)
  _$$FAQsLoadedImplCopyWith<_$FAQsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BugReportSubmittedImplCopyWith<$Res> {
  factory _$$BugReportSubmittedImplCopyWith(_$BugReportSubmittedImpl value,
          $Res Function(_$BugReportSubmittedImpl) then) =
      __$$BugReportSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BugReportSubmittedImplCopyWithImpl<$Res>
    extends _$SupportStateCopyWithImpl<$Res, _$BugReportSubmittedImpl>
    implements _$$BugReportSubmittedImplCopyWith<$Res> {
  __$$BugReportSubmittedImplCopyWithImpl(_$BugReportSubmittedImpl _value,
      $Res Function(_$BugReportSubmittedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BugReportSubmittedImpl implements BugReportSubmitted {
  const _$BugReportSubmittedImpl();

  @override
  String toString() {
    return 'SupportState.bugReportSubmitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BugReportSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FAQ> faqs) faqsLoaded,
    required TResult Function() bugReportSubmitted,
    required TResult Function(String message) error,
  }) {
    return bugReportSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FAQ> faqs)? faqsLoaded,
    TResult? Function()? bugReportSubmitted,
    TResult? Function(String message)? error,
  }) {
    return bugReportSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FAQ> faqs)? faqsLoaded,
    TResult Function()? bugReportSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (bugReportSubmitted != null) {
      return bugReportSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(FAQsLoaded value) faqsLoaded,
    required TResult Function(BugReportSubmitted value) bugReportSubmitted,
    required TResult Function(Error value) error,
  }) {
    return bugReportSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FAQsLoaded value)? faqsLoaded,
    TResult? Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult? Function(Error value)? error,
  }) {
    return bugReportSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FAQsLoaded value)? faqsLoaded,
    TResult Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (bugReportSubmitted != null) {
      return bugReportSubmitted(this);
    }
    return orElse();
  }
}

abstract class BugReportSubmitted implements SupportState {
  const factory BugReportSubmitted() = _$BugReportSubmittedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SupportStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SupportState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

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
    required TResult Function(List<FAQ> faqs) faqsLoaded,
    required TResult Function() bugReportSubmitted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FAQ> faqs)? faqsLoaded,
    TResult? Function()? bugReportSubmitted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FAQ> faqs)? faqsLoaded,
    TResult Function()? bugReportSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(FAQsLoaded value) faqsLoaded,
    required TResult Function(BugReportSubmitted value) bugReportSubmitted,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FAQsLoaded value)? faqsLoaded,
    TResult? Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FAQsLoaded value)? faqsLoaded,
    TResult Function(BugReportSubmitted value)? bugReportSubmitted,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements SupportState {
  const factory Error({required final String message}) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
