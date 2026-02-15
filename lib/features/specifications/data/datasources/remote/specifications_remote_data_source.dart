import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/base/data_response_wrapper.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';

import 'specifications_service.dart';

abstract class SpecificationsRemoteDataSource {
  

  Future<BaseApiResponse<DataRespWrapper>> specification(PostRequestModel request);


}

class SpecificationsRemoteDataSourceImpl implements SpecificationsRemoteDataSource {
  final SpecificationsService specificationsService;
  final AppLogger logger;

  SpecificationsRemoteDataSourceImpl({
    required this.specificationsService,
    required this.logger,
  });

  @override
  Future<BaseApiResponse<DataRespWrapper>> specification(PostRequestModel request) =>
      handleBaseApiResponse<DataRespWrapper>(
        method: 'specification',
        logger: logger,
        call: () => specificationsService.specification(request),
      );

 

}
