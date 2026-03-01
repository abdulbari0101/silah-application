import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/features/notifications/data/datasources/remote/device_token_service.dart';
import 'package:silah_app/features/notifications/data/models/device_token_models.dart';

abstract class DeviceTokenRemoteDataSource {
  Future<BaseApiResponse<DeviceTokenResponseModel>> registerDeviceToken(
    DeviceTokenRequestModel request,
  );
}

class DeviceTokenRemoteDataSourceImpl implements DeviceTokenRemoteDataSource {
  final DeviceTokenService service;
  final AppLogger logger;

  DeviceTokenRemoteDataSourceImpl({
    required this.service,
    required this.logger,
  });

  @override
  Future<BaseApiResponse<DeviceTokenResponseModel>> registerDeviceToken(
    DeviceTokenRequestModel request,
  ) => handleBaseApiResponse<DeviceTokenResponseModel>(
    method: 'DeviceTokenRemoteDataSource.registerDeviceToken',
    logger: logger,
    call: () => service.registerDeviceToken(request),
  );
}
