import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';

import '../../../../../core/data/model/api/request/post_request_model.dart';
import '../../models/settings_response_wrapper.dart';
import 'settings_service.dart';

abstract class SettingsRemoteDataSource {
  Future<BaseApiResponse<SettingsRespWrapper>> doSomething(
    PostRequestModel request,
  );
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final SettingsService settingsService;
  final AppLogger logger;

  SettingsRemoteDataSourceImpl({
    required this.settingsService,
    required this.logger,
  });

  @override
  Future<BaseApiResponse<SettingsRespWrapper>> doSomething(
    PostRequestModel request,
  ) => handleBaseApiResponse<SettingsRespWrapper>(
    method: 'SettingsRemoteDataSource.doSomething',
    logger: logger,
    call: () => settingsService.doSomething(request),
  );
}
