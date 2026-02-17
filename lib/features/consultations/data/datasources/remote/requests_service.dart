import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/base/data_response_wrapper.dart';
import 'package:silah_app/core/data/model/api/data_model.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';

part 'requests_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class RequestsService {
  factory RequestsService(Dio dio, {String? baseUrl}) = _RequestsService;

  @POST('Request')
  Future<BaseApiResponse<DataRespWrapper>> request(@Body() PostRequestModel request);
}
