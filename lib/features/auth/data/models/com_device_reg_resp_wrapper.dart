import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';

import 'device_token_model.dart';

part 'com_device_reg_resp_wrapper.mapper.dart';

@MappableClass(ignoreNull: true)
class ComDeviceRegRespWrapper extends BaseRespWrapper with ComDeviceRegRespWrapperMappable {
  @MappableField(key: 'TOKEN')
  final DeviceTokenModel? token;

  ComDeviceRegRespWrapper({super.result, this.token});
}


