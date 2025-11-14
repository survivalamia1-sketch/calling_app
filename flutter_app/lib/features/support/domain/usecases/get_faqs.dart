import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/faq.dart';
import '../repositories/support_repository.dart';

class GetFAQs implements UseCase<List<FAQ>, GetFAQsParams> {
  final SupportRepository repository;

  GetFAQs(this.repository);

  @override
  Future<Either<Failure, List<FAQ>>> call(GetFAQsParams params) async {
    return await repository.getFAQs(category: params.category);
  }
}

class GetFAQsParams extends Equatable {
  final String? category;

  const GetFAQsParams({this.category});

  @override
  List<Object?> get props => [category];
}
