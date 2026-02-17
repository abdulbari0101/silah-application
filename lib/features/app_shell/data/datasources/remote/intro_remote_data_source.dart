import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';

import '../../../../../core/data/model/api/request/post_request_model.dart';
import '../../models/intro_response_wrapper.dart';
import 'intro_service.dart';

abstract class IntroRemoteDataSource {
  Future<BaseApiResponse<IntroRespWrapper>> doSomething(PostRequestModel request);
}

class IntroRemoteDataSourceImpl implements IntroRemoteDataSource {
  final IntroService introService;
  final AppLogger logger;

  IntroRemoteDataSourceImpl({required this.introService, required this.logger});

  @override
  Future<BaseApiResponse<IntroRespWrapper>> doSomething(PostRequestModel request) =>
      handleBaseApiResponse<IntroRespWrapper>(
        method: 'doSomething',
        logger: logger,
        call: () => introService.doSomething(request),
      );
}
