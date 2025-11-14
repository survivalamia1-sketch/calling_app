import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/bug_report.dart';
import '../../domain/entities/faq.dart';
import '../../domain/usecases/get_faqs.dart';
import '../../domain/usecases/submit_bug_report.dart';

part 'support_event.dart';
part 'support_state.dart';
part 'support_bloc.freezed.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final GetFAQs getFAQs;
  final SubmitBugReport submitBugReport;

  SupportBloc({
    required this.getFAQs,
    required this.submitBugReport,
  }) : super(const SupportState.initial()) {
    on<_LoadFAQs>(_onLoadFAQs);
    on<_SubmitBugReport>(_onSubmitBugReport);
  }

  Future<void> _onLoadFAQs(
    _LoadFAQs event,
    Emitter<SupportState> emit,
  ) async {
    emit(const SupportState.loading());

    final result = await getFAQs(const GetFAQsParams());

    result.fold(
      (failure) => emit(SupportState.error(
        message: failure.message ?? 'Failed to load FAQs',
      )),
      (faqs) => emit(SupportState.faqsLoaded(faqs: faqs)),
    );
  }

  Future<void> _onSubmitBugReport(
    _SubmitBugReport event,
    Emitter<SupportState> emit,
  ) async {
    emit(const SupportState.loading());

    final result = await submitBugReport(
      SubmitBugReportParams(bugReport: event.bugReport),
    );

    result.fold(
      (failure) => emit(SupportState.error(
        message: failure.message ?? 'Failed to submit bug report',
      )),
      (_) => emit(const SupportState.bugReportSubmitted()),
    );
  }
}
