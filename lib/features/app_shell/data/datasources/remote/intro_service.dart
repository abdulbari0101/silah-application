import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';

import '../../models/intro_response_wrapper.dart';

part 'intro_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class IntroService {
  factory IntroService(Dio dio, {String? baseUrl}) = _IntroService;

  @POST('Client/doSomething')
  Future<BaseApiResponse<IntroRespWrapper>> doSomething(@Body() PostRequestModel request);
}
