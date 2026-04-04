import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';
import 'package:silah_app/core/data/model/local/app_setting_model.dart';

part 'settings_response_wrapper.mapper.dart';

@MappableClass(ignoreNull: true)
class SettingsRespWrapper extends BaseRespWrapper
    with SettingsRespWrapperMappable {
  @MappableField(key: 'Settings')
  final List<AppSettingModel>? settings;

  const SettingsRespWrapper({this.settings, super.result});
}
