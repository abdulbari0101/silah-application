import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/domain/entities/local/setting/user_setting_entity.dart';

part 'user_setting_model.mapper.dart';

@MappableClass(ignoreNull: true)
class UserSettingModel with UserSettingModelMappable {
  final bool notification;

  const UserSettingModel({this.notification = true});

  /// Convert to domain entity
  UserSettingEntity toEntity() {
    return UserSettingEntity(notification: notification);
  }

  /// Convert from domain entity
  factory UserSettingModel.fromEntity(UserSettingEntity entity) {
    return UserSettingModel(notification: entity.notification);
  }

  factory UserSettingModel.defaultSetting() {
    return UserSettingModel(notification: true);
  }
}
