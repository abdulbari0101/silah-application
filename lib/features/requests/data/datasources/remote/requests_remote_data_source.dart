import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/base/data_response_wrapper.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';

import 'requests_service.dart';

abstract class RequestsRemoteDataSource {
  Future<BaseApiResponse<DataRespWrapper>> request(PostRequestModel request);
}

class RequestsRemoteDataSourceImpl implements RequestsRemoteDataSource {
  final RequestsService requestsService;
  final AppLogger logger;

  RequestsRemoteDataSourceImpl({required this.requestsService, required this.logger});

  @override
  Future<BaseApiResponse<DataRespWrapper>> request(PostRequestModel request) =>
      handleBaseApiResponse<DataRespWrapper>(
        method: 'request',
        logger: logger,
        call: () => requestsService.request(request),
      );
}
