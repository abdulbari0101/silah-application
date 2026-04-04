import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';
import 'package:silah_app/features/consultations/data/models/consultation_models.dart';

part 'consultations_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class ConsultationsService {
  factory ConsultationsService(Dio dio, {String? baseUrl}) =
      _ConsultationsService;

  @POST('/consultations')
  Future<BaseApiResponse<ConsultationCreateResponseModel>> createConsultation(
    @Body() ConsultationCreateRequestModel request,
  );

  @PATCH('/consultations/{consultationId}')
  Future<BaseApiResponse<ConsultationStatusUpdateResponseModel>> updateStatus(
    @Path('consultationId') String consultationId,
    @Body() ConsultationStatusUpdateRequestModel request,
  );
}
