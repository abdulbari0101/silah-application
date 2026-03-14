import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';
import 'package:silah_app/features/verification/data/models/verification_models.dart';

part 'verification_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class VerificationService {
  factory VerificationService(Dio dio, {String? baseUrl}) =
      _VerificationService;

  @POST('/verification/request')
  Future<BaseApiResponse<VerificationResponseModel>> requestVerification(
    @Body() VerificationRequestModel request,
  );

  @POST('/verification/review')
  Future<BaseApiResponse<VerificationResponseModel>> reviewVerification(
    @Body() Map<String, dynamic> request,
  );
}
