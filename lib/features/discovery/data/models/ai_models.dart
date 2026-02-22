import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_result_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_recommendation_entity.dart';

part 'ai_models.mapper.dart';

@MappableClass(ignoreNull: true)
class AiClassifyRequestModel with AiClassifyRequestModelMappable {
  final String caseText;
  final String? lang;

  const AiClassifyRequestModel({
    required this.caseText,
    this.lang,
  });

  factory AiClassifyRequestModel.fromEntity(AiClassificationRequestEntity entity) {
    return AiClassifyRequestModel(
      caseText: entity.prompt,
      lang: entity.languageCode,
    );
  }

}

@MappableClass(ignoreNull: true)
class AiClassifyResponseModel extends BaseRespWrapper with AiClassifyResponseModelMappable {
  final String? specialization;
  final double? confidence;
  final String? reason;

  const AiClassifyResponseModel({
    required super.result,
    this.specialization,
    this.confidence,
    this.reason,
  });

  AiClassificationResultEntity toEntity() => AiClassificationResultEntity(
        specializationId: specialization,
        specializationName: specialization,
        confidence: confidence,
        keywords: reason == null ? null : [reason!],
      );
}

@MappableClass(ignoreNull: true)
class AiRecommendRequestModel with AiRecommendRequestModelMappable {
  final String caseText;
  final AiRecommendFiltersModel? filters;

  const AiRecommendRequestModel({
    required this.caseText,
    this.filters,
  });

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
  final String? specialization;
  final List<String>? lawyerIds;

  const AiRecommendResponseModel({
    required super.result,
    this.specialization,
    this.lawyerIds,
  });

  AiRecommendationEntity toEntity() => AiRecommendationEntity(
        specialization: specialization,
        lawyerIds: lawyerIds ?? const [],
      );
}
