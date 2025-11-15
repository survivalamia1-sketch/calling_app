import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/bug_report.dart';
import '../../domain/entities/faq.dart';
import '../../domain/usecases/get_faqs.dart';
import '../../domain/usecases/submit_bug_report.dart' as submit_bug_report;

part 'support_bloc.freezed.dart';
part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final GetFAQs getFAQs;
  final submit_bug_report.SubmitBugReport submitBugReport;

  SupportBloc({
    required this.getFAQs,
    required this.submitBugReport,
  }) : super(const SupportState.initial()) {
    on<LoadFAQs>(_onLoadFAQs);
    on<SubmitBugReport>(_onSubmitBugReport);
  }

  Future<void> _onLoadFAQs(
    LoadFAQs event,
    Emitter<SupportState> emit,
  ) async {
    emit(const SupportState.loading());

    final result = await getFAQs(const GetFAQsParams());

    result.fold(
      (failure) => emit(SupportState.error(
        message: failure.message,
      )),
      (faqs) => emit(SupportState.faqsLoaded(faqs: faqs)),
    );
  }

  Future<void> _onSubmitBugReport(
    SubmitBugReport event,
    Emitter<SupportState> emit,
  ) async {
    emit(const SupportState.loading());

    final result = await submitBugReport(
      submit_bug_report.SubmitBugReportParams(bugReport: event.bugReport),
    );

    result.fold(
      (failure) => emit(SupportState.error(
        message: failure.message,
      )),
      (_) => emit(const SupportState.bugReportSubmitted()),
    );
  }
}
