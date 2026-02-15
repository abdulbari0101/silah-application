import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/base/data_response_wrapper.dart';
import 'package:silah_app/core/data/model/api/data_model.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';

part 'chats_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class ChatsService {
  factory ChatsService(Dio dio, {String? baseUrl}) = _ChatsService;

  @POST('Chat')
  Future<BaseApiResponse<DataRespWrapper>> chat(@Body() PostRequestModel request);
}
