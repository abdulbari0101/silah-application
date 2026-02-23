import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/consultations_service.dart';
import 'package:silah_app/features/consultations/data/models/consultation_models.dart';

abstract class ConsultationsRemoteDataSource {
  Future<BaseApiResponse<ConsultationCreateResponseModel>> createConsultation(
    ConsultationCreateRequestModel request,
  );

  Future<BaseApiResponse<ConsultationStatusUpdateResponseModel>> updateStatus(
    String consultationId,
    ConsultationStatusUpdateRequestModel request,
  );
}

class ConsultationsRemoteDataSourceImpl implements ConsultationsRemoteDataSource {
  final ConsultationsService service;
  final AppLogger logger;

  ConsultationsRemoteDataSourceImpl({
    required this.service,
    required this.logger,
  });

  @override
  Future<BaseApiResponse<ConsultationCreateResponseModel>> createConsultation(
    ConsultationCreateRequestModel request,
  ) =>
      handleBaseApiResponse<ConsultationCreateResponseModel>(
        method: 'ConsultationsRemoteDataSource.createConsultation',
        logger: logger,
        call: () => service.createConsultation(request),
      );

  @override
  Future<BaseApiResponse<ConsultationStatusUpdateResponseModel>> updateStatus(
    String consultationId,
    ConsultationStatusUpdateRequestModel request,
  ) =>
      handleBaseApiResponse<ConsultationStatusUpdateResponseModel>(
        method: 'ConsultationsRemoteDataSource.updateStatus',
        logger: logger,
        call: () => service.updateStatus(consultationId, request),
      );
}
