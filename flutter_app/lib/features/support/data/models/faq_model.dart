import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/faq.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FAQModel extends FAQ {
  const FAQModel({
    required super.id,
    required super.question,
    required super.answer,
    required super.category,
    required super.orderIndex,
    required super.createdAt,
  });

  factory FAQModel.fromJson(Map<String, dynamic> json) =>
      _$FAQModelFromJson(json);

  Map<String, dynamic> toJson() => _$FAQModelToJson(this);

  FAQ toDomain() => FAQ(
        id: id,
        question: question,
        answer: answer,
        category: category,
        orderIndex: orderIndex,
        createdAt: createdAt,
      );

  factory FAQModel.fromDomain(FAQ faq) => FAQModel(
        id: faq.id,
        question: faq.question,
        answer: faq.answer,
        category: faq.category,
        orderIndex: faq.orderIndex,
        createdAt: faq.createdAt,
      );
}
