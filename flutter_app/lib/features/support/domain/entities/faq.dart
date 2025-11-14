import 'package:equatable/equatable.dart';

class FAQ extends Equatable {
  final String id;
  final String question;
  final String answer;
  final String category;
  final int orderIndex;
  final DateTime createdAt;

  const FAQ({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
    required this.orderIndex,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        answer,
        category,
        orderIndex,
        createdAt,
      ];
}
