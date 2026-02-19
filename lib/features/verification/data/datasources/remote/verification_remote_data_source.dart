import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/features/verification/data/datasources/remote/verification_service.dart';
import 'package:silah_app/features/verification/data/models/verification_models.dart';

abstract class VerificationRemoteDataSource {
  Future<BaseApiResponse<VerificationResponseModel>> requestVerification(
    VerificationRequestModel request,
  );
}

class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {
  final VerificationService service;
  final AppLogger logger;

  VerificationRemoteDataSourceImpl({required this.service, required this.logger});

  @override
  Future<BaseApiResponse<VerificationResponseModel>> requestVerification(
    VerificationRequestModel request,
  ) =>
      handleBaseApiResponse<VerificationResponseModel>(
        method: 'VerificationRemoteDataSource.requestVerification',
        logger: logger,
        call: () => service.requestVerification(request),
      );
}
