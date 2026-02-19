import 'package:dart_mappable/dart_mappable.dart';

part 'ai_classification_result_entity.mapper.dart';

@MappableClass()
class AiClassificationResultEntity with AiClassificationResultEntityMappable {
  final String? specializationId;
  final String? specializationName;
  final double? confidence;
  final List<String>? keywords;

  const AiClassificationResultEntity({
    this.specializationId,
    this.specializationName,
    this.confidence,
    this.keywords,
  });
}
