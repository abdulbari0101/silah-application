import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';

part 'ai_classification_result_entity.mapper.dart';

@MappableClass()
class AiClassificationResultEntity with AiClassificationResultEntityMappable {
  final LegalSpecializationEntity? specialization;
  final String? specializationName;
  final double? confidence;
  final List<String>? keywords;

  const AiClassificationResultEntity({
    this.specialization,
    this.specializationName,
    this.confidence,
    this.keywords,
  });
}
