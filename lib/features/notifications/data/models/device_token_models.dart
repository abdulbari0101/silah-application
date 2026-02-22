import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';

part 'device_token_models.mapper.dart';

@MappableClass(ignoreNull: true)
class DeviceTokenRequestModel with DeviceTokenRequestModelMappable {
  final String deviceToken;
  final String? platform;

  const DeviceTokenRequestModel({
    required this.deviceToken,
    this.platform,
  });

}

@MappableClass(ignoreNull: true)
class DeviceTokenResponseModel extends BaseRespWrapper with DeviceTokenResponseModelMappable {
  final String? status;

  const DeviceTokenResponseModel({
    required super.result,
    this.status,
  });
}
