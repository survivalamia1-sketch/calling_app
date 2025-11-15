part of 'support_bloc.dart';

@freezed
class SupportEvent with _$SupportEvent {
  const factory SupportEvent.loadFAQs() = LoadFAQs;
  const factory SupportEvent.submitBugReport({
    required BugReport bugReport,
  }) = SubmitBugReport;
}
