import 'package:dartz/dartz.dart';
import 'package:silah_app/core/data/model/local/app_setting_model.dart';
import 'package:silah_app/core/domain/entities/local/setting/app_setting_entity.dart';
import 'package:silah_app/core/domain/repositories/app_setting_repo.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/platform/device_info_helper.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';

import '../datasources/local/settings_cache_data_source.dart';
import '../datasources/remote/settings_remote_data_source.dart';

class AppSettingsRepoImpl implements AppSettingsRepo {
  final SettingsRemoteDataSource remoteDS;
  final SettingsCacheDataSource cacheDS;
  final DeviceInfoHelper deviceInfoHelper;
  final Executor executor;

  AppSettingsRepoImpl({
    required this.remoteDS,
    required this.cacheDS,
    required this.executor,
    required this.deviceInfoHelper,
  });

  @override
  Future<Either<Failure, AppSettingEntity>> setting() async {
    return executor.runOffline(() async {
      final local = await cacheDS.appSetting();
      return local.toEntity();
    }, from: "AppSettingsRepoImpl.setting");
  }

  @override
  Future<Either<Failure, bool>> updateSetting(AppSettingEntity setting) async {
    return executor.runOffline(() async {
      final local = await cacheDS.updateAppSetting(
        AppSettingModel.fromEntity(setting),
      );
      return local;
    }, from: "AppSettingsRepoImpl.updateSetting");
  }

  @override
  Stream<AppSettingEntity> watchSetting() {
    return cacheDS.watchAppSetting().map((setting) => setting.toEntity());
  }
}
