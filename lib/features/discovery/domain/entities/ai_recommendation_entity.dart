import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

part 'ai_recommendation_entity.mapper.dart';

@MappableClass()
class AiRecommendationEntity with AiRecommendationEntityMappable {
  final LegalSpecializationEntity? specialization;
  final List<LawyerProfileEntity>? lawyers;

  const AiRecommendationEntity({this.specialization, this.lawyers});
}
