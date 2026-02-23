import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/features/training/data/datasources/remote/training_service.dart';
import 'package:silah_app/features/training/data/models/training_models.dart';

abstract class TrainingRemoteDataSource {
  Future<BaseApiResponse<TrainingApplicationCreateResponseModel>> createApplication(
    TrainingApplicationCreateRequestModel request,
  );

  Future<BaseApiResponse<TrainingApplicationStatusUpdateResponseModel>> updateStatus(
    String applicationId,
    TrainingApplicationStatusUpdateRequestModel request,
  );
}

class TrainingRemoteDataSourceImpl implements TrainingRemoteDataSource {
  final TrainingService service;
  final AppLogger logger;

  TrainingRemoteDataSourceImpl({required this.service, required this.logger});

  @override
  Future<BaseApiResponse<TrainingApplicationCreateResponseModel>> createApplication(
    TrainingApplicationCreateRequestModel request,
  ) =>
      handleBaseApiResponse<TrainingApplicationCreateResponseModel>(
        method: 'TrainingRemoteDataSource.createApplication',
        logger: logger,
        call: () => service.createApplication(request),
      );

  @override
  Future<BaseApiResponse<TrainingApplicationStatusUpdateResponseModel>> updateStatus(
    String applicationId,
    TrainingApplicationStatusUpdateRequestModel request,
  ) =>
      handleBaseApiResponse<TrainingApplicationStatusUpdateResponseModel>(
        method: 'TrainingRemoteDataSource.updateStatus',
        logger: logger,
        call: () => service.updateStatus(applicationId, request),
      );
}
