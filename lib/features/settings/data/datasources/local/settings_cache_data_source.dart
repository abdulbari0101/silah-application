import 'dart:convert';

import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/data/local/cache/base/key_value_store_ex.dart';
import 'package:silah_app/core/data/local/cache/prefs/prefs_key.dart';
import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/data/local/cache/readers/setting_reader.dart';
import 'package:silah_app/core/data/local/cache/secure/secure_key.dart';
import 'package:silah_app/core/data/model/local/app_setting_model.dart';
import 'package:silah_app/core/data/model/local/user_setting_model.dart';

import '../../../../../core/infrastructure/analytics/logger/app_logger.dart';

abstract class SettingsCacheDataSource implements SettingReader {
  Future<bool> updateAppSetting(AppSettingModel setting);
  Future<bool> updateUserSetting(UserSettingModel setting);
  Future<void> saveFCMToken(String fcmToken); // for notification
}

class SettingsCacheDataSourceImpl extends SettingsCacheDataSource {
  final AppCache appCache;
  final AppLogger logger;

  final IdentityReader identityReader;

  SettingsCacheDataSourceImpl({
    required this.appCache,
    required this.logger,
    required this.identityReader,
  });

  @override
  Future<bool> updateAppSetting(AppSettingModel setting) async {
    return await appCache.prefs.writeObject(
      key: PrefsKey.appSetting,
      object: setting,
      toJson: (value) => value.toJson(),
    );
  }

  @override
  Future<bool> updateUserSetting(UserSettingModel setting) async {
    final userId = await identityReader.userId();
    return await appCache.prefs.writeObject(
      key: PrefsKey.userSetting,
      userId: userId,
      object: setting,
      toJson: (value) => value.toJson(),
    );
  }

  @override
  Future<AppSettingModel> appSetting() async {
    return await appCache.prefs.readObjectOr<AppSettingModel>(
      key: PrefsKey.appSetting,
      fromJson: (json) => AppSettingModelMapper.fromJson(json),
      fallback: AppSettingModel.defaultSetting(),
    );
  }

  @override
  Future<UserSettingModel> userSetting() async {
    final userId = await identityReader.userId();
    return await appCache.prefs.readObjectOr<UserSettingModel>(
      key: PrefsKey.userSetting,
      userId: userId,
      fromJson: (json) => UserSettingModelMapper.fromJson(json),
      fallback: UserSettingModel.defaultSetting(),
    );
  }

  @override
  Stream<AppSettingModel> watchAppSetting() => appCache.prefs
      .watch(key: PrefsKey.appSetting)
      .map(
        (jsonStr) => jsonStr == null
            ? AppSettingModel.defaultSetting()
            : AppSettingModelMapper.fromJson(json.decode(jsonStr)),
      );

  @override
  Stream<UserSettingModel> watchUserSetting() {
    return Stream.fromFuture(identityReader.userId()).asyncExpand((id) {
      return appCache.prefs
          .watch(key: PrefsKey.userSetting, userId: id)
          .map(
            (jsonStr) => jsonStr == null
                ? UserSettingModel.defaultSetting()
                : UserSettingModelMapper.fromJson(json.decode(jsonStr)),
          );
    });
  }

  @override
  Future<String?> fcmToken() async {
    return await appCache.secure.read(key: SecureKey.fcmToken);
  }

  // single values
  @override
  Future<void> saveFCMToken(String fcmToken) async {
    await appCache.secure.write(key: SecureKey.fcmToken, value: fcmToken);
  }
}
