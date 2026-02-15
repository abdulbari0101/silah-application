import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';

import '../../models/settings_response_wrapper.dart';

part 'settings_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class SettingsService {
  factory SettingsService(Dio dio, {String? baseUrl}) = _SettingsService;

  @POST('Client/doSomething')
  Future<BaseApiResponse<SettingsRespWrapper>> doSomething(@Body() PostRequestModel request);
}
