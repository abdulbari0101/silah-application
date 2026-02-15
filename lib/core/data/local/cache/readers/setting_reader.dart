import 'package:silah_app/core/data/model/local/app_setting_model.dart';
import 'package:silah_app/core/data/model/local/user_setting_model.dart';

abstract class SettingReader {
  // Settings
  Future<AppSettingModel> appSetting();
  Future<UserSettingModel> userSetting();
  Stream<AppSettingModel> watchAppSetting();
  Stream<UserSettingModel> watchUserSetting();

  // notificatoin firebase

  Future<String?> fcmToken();
}
