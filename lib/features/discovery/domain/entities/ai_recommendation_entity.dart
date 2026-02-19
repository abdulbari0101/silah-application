import 'package:dart_mappable/dart_mappable.dart';

part 'ai_recommendation_entity.mapper.dart';

@MappableClass()
class AiRecommendationEntity with AiRecommendationEntityMappable {
  final String? specialization;
  final List<String>? lawyerIds;

  const AiRecommendationEntity({
    this.specialization,
    this.lawyerIds,
  });
}
