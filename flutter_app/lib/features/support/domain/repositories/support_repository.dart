import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/bug_report.dart';
import '../entities/faq.dart';

abstract class SupportRepository {
  Future<Either<Failure, List<FAQ>>> getFAQs({String? category});
  Future<Either<Failure, Unit>> submitBugReport(BugReport bugReport);
}
