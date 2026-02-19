import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/features/discovery/data/datasources/remote/ai_service.dart';
import 'package:silah_app/features/discovery/data/models/ai_models.dart';

abstract class AiRemoteDataSource {
  Future<BaseApiResponse<AiClassifyResponseModel>> classify(AiClassifyRequestModel request);
  Future<BaseApiResponse<AiRecommendResponseModel>> recommend(AiRecommendRequestModel request);
}

class AiRemoteDataSourceImpl implements AiRemoteDataSource {
  final AiService service;
  final AppLogger logger;

  AiRemoteDataSourceImpl({required this.service, required this.logger});

  @override
  Future<BaseApiResponse<AiClassifyResponseModel>> classify(AiClassifyRequestModel request) =>
      handleBaseApiResponse<AiClassifyResponseModel>(
        method: 'AiRemoteDataSource.classify',
        logger: logger,
        call: () => service.classify(request),
      );

  @override
  Future<BaseApiResponse<AiRecommendResponseModel>> recommend(AiRecommendRequestModel request) =>
      handleBaseApiResponse<AiRecommendResponseModel>(
        method: 'AiRemoteDataSource.recommend',
        logger: logger,
        call: () => service.recommend(request),
      );
}
