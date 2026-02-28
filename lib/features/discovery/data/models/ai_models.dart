import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';
import 'package:silah_app/features/discovery/data/models/legal_specialization_model.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_result_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_recommendation_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';

part 'ai_models.mapper.dart';

@MappableClass(ignoreNull: true)
class AiClassifyRequestModel with AiClassifyRequestModelMappable {
  final String caseText;
  final String? lang;

  const AiClassifyRequestModel({required this.caseText, this.lang});

  factory AiClassifyRequestModel.fromEntity(AiClassificationRequestEntity entity) {
    return AiClassifyRequestModel(caseText: entity.prompt, lang: entity.languageCode);
  }
}

@MappableClass(ignoreNull: true)
class AiClassifyResponseModel extends BaseRespWrapper with AiClassifyResponseModelMappable {
  final LegalSpecializationModel? specialization;
  final String? specializationId;
  final double? confidence;
  final String? reason;

  const AiClassifyResponseModel({
    required super.result,
    this.specialization,
    this.specializationId,
    this.confidence,
    this.reason,
  });

  AiClassificationResultEntity toEntity() {
    final specializationEntity = specialization?.toEntity() ??
        (specializationId != null
            ? LegalSpecializationEntity(id: specializationId)
            : null);
    return AiClassificationResultEntity(
      specialization: specializationEntity,
      specializationName: specializationEntity?.name,
      confidence: confidence,
      keywords: reason == null ? null : [reason!],
    );
  }
}

@MappableClass(ignoreNull: true)
class AiRecommendRequestModel with AiRecommendRequestModelMappable {
  final String caseText;
  final AiRecommendFiltersModel? filters;

  const AiRecommendRequestModel({required this.caseText, this.filters});

  factory AiRecommendRequestModel.fromEntity(AiClassificationRequestEntity entity) {
    return AiRecommendRequestModel(caseText: entity.prompt);
  }
}

@MappableClass(ignoreNull: true)
class AiRecommendFiltersModel with AiRecommendFiltersModelMappable {
  final String? city;
  final String? availability;

  const AiRecommendFiltersModel({this.city, this.availability});
}

@MappableClass(ignoreNull: true)
class AiRecommendResponseModel extends BaseRespWrapper with AiRecommendResponseModelMappable {
  final LegalSpecializationModel? specialization;
  final String? specializationId;
  final List<String>? lawyerIds;

  const AiRecommendResponseModel({
    required super.result,
    this.specialization,
    this.specializationId,
    this.lawyerIds,
  });

  AiRecommendationEntity toEntity() {
    final specializationEntity = specialization?.toEntity() ??
        (specializationId != null
            ? LegalSpecializationEntity(id: specializationId)
            : null);
    return AiRecommendationEntity(specialization: specializationEntity, lawyers: []);
  }
}
