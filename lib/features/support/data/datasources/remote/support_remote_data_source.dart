import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/base/data_response_wrapper.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';

import 'support_service.dart';

abstract class SupportRemoteDataSource {
  

  Future<BaseApiResponse<DataRespWrapper>> support(PostRequestModel request);


}

class SupportRemoteDataSourceImpl implements SupportRemoteDataSource {
  final SupportService supportService;
  final AppLogger logger;

  SupportRemoteDataSourceImpl({
    required this.supportService,
    required this.logger,
  });

  @override
  Future<BaseApiResponse<DataRespWrapper>> support(PostRequestModel request) =>
      handleBaseApiResponse<DataRespWrapper>(
        method: 'support',
        logger: logger,
        call: () => supportService.support(request),
      );

 

}
