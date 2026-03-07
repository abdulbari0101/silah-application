import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';
import 'package:silah_app/features/discovery/data/models/ai_models.dart';

part 'specifications_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class SpecificationsService {
  factory SpecificationsService(Dio dio, {String? baseUrl}) = _SpecificationsService;

  @POST('/ai/recommend')
  Future<BaseApiResponse<AiRecommendResponseModel>> recommend(
    @Body() AiRecommendRequestModel request,
  );
}
