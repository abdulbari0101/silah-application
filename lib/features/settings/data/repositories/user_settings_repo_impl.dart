import 'package:dartz/dartz.dart';
import 'package:silah_app/core/data/model/local/user_setting_model.dart';
import 'package:silah_app/core/domain/entities/local/setting/user_setting_entity.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/platform/device_info_helper.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/settings/domain/repositories/user_setting_repo.dart';

import '../datasources/local/settings_cache_data_source.dart';
import '../datasources/remote/settings_remote_data_source.dart';

class UserSettingsRepoImpl implements UserSettingsRepo {
  final SettingsRemoteDataSource remoteDS;
  final SettingsCacheDataSource cacheDS;
  final DeviceInfoHelper deviceInfoHelper;
  final Executor executor;

  UserSettingsRepoImpl({
    required this.remoteDS,
    required this.cacheDS,
    required this.executor,
    required this.deviceInfoHelper,
  });

  @override
  Future<Either<Failure, UserSettingEntity>> setting() async {
    return executor.runOffline(() async {
      final local = await cacheDS.userSetting();
      return local.toEntity();
    }, from: "UserSettingsRepoImpl.setting");
  }

  @override
  Future<Either<Failure, bool>> updateSetting(UserSettingEntity setting) async {
    return executor.runOffline(() async {
      final local = await cacheDS.updateUserSetting(UserSettingModel.fromEntity(setting));
      return local;
    }, from: "UserSettingsRepoImpl.updateSetting");
  }

  @override
  Stream<UserSettingEntity> watchSetting() {
    return cacheDS.watchUserSetting().map((setting) => setting.toEntity());
  }
}
