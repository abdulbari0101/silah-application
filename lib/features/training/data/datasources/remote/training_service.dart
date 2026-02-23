import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';
import 'package:silah_app/features/training/data/models/training_models.dart';

part 'training_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class TrainingService {
  factory TrainingService(Dio dio, {String? baseUrl}) = _TrainingService;

  @POST('/training/applications')
  Future<BaseApiResponse<TrainingApplicationCreateResponseModel>> createApplication(
    @Body() TrainingApplicationCreateRequestModel request,
  );

  @PATCH('/training/applications/{applicationId}')
  Future<BaseApiResponse<TrainingApplicationStatusUpdateResponseModel>> updateStatus(
    @Path('applicationId') String applicationId,
    @Body() TrainingApplicationStatusUpdateRequestModel request,
  );
}
