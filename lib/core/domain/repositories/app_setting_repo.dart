import 'package:dartz/dartz.dart';

import '../../infrastructure/errors/failures.dart';
import '../entities/local/setting/app_setting_entity.dart';

abstract class AppSettingsRepo {
  Future<Either<Failure, AppSettingEntity>> setting();
  Future<Either<Failure, bool>> updateSetting(AppSettingEntity setting);
  Stream<AppSettingEntity> watchSetting();
}
