import 'package:dart_mappable/dart_mappable.dart';

part 'user_setting_entity.mapper.dart';

@MappableClass()
class UserSettingEntity with UserSettingEntityMappable {

  final bool notification;

  const UserSettingEntity({

    this.notification = true,
  });


}
