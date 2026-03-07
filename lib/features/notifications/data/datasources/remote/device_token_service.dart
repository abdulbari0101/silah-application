import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';
import 'package:silah_app/features/notifications/data/models/device_token_models.dart';

part 'device_token_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class DeviceTokenService {
  factory DeviceTokenService(Dio dio, {String? baseUrl}) = _DeviceTokenService;

  @POST('/devices/fcm_token')
  Future<BaseApiResponse<DeviceTokenResponseModel>> registerDeviceFcmToken(
    @Body() DeviceTokenRequestModel request,
  );
}
