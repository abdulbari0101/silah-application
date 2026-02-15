import 'package:dartz/dartz.dart';
import 'package:silah_app/core/domain/entities/local/setting/user_setting_entity.dart';

import '../../../../core/infrastructure/errors/failures.dart';

abstract class UserSettingsRepo {
  Future<Either<Failure, UserSettingEntity>> setting();
  Future<Either<Failure, bool>> updateSetting(UserSettingEntity setting);
  Stream<UserSettingEntity> watchSetting();
}
