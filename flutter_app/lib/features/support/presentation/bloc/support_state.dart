part of 'support_bloc.dart';

@freezed
class SupportState with _$SupportState {
  const factory SupportState.initial() = _Initial;
  const factory SupportState.loading() = _Loading;
  const factory SupportState.faqsLoaded({
    required List<FAQ> faqs,
  }) = _FAQsLoaded;
  const factory SupportState.bugReportSubmitted() = _BugReportSubmitted;
  const factory SupportState.error({
    required String message,
  }) = _Error;
}
