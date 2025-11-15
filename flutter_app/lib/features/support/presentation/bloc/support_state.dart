part of 'support_bloc.dart';

@freezed
class SupportState with _$SupportState {
  const factory SupportState.initial() = Initial;
  const factory SupportState.loading() = Loading;
  const factory SupportState.faqsLoaded({
    required List<FAQ> faqs,
  }) = FAQsLoaded;
  const factory SupportState.bugReportSubmitted() = BugReportSubmitted;
  const factory SupportState.error({
    required String message,
  }) = Error;
}
