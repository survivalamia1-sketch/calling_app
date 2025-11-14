import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/bug_report.dart';
import '../repositories/support_repository.dart';

class SubmitBugReport implements UseCase<Unit, SubmitBugReportParams> {
  final SupportRepository repository;

  SubmitBugReport(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SubmitBugReportParams params) async {
    return await repository.submitBugReport(params.bugReport);
  }
}

class SubmitBugReportParams extends Equatable {
  final BugReport bugReport;

  const SubmitBugReportParams({required this.bugReport});

  @override
  List<Object?> get props => [bugReport];
}
