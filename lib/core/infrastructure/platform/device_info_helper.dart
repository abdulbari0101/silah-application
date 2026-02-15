import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/data/local/cache/readers/setting_reader.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/domain/repositories/identity_repo.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';

class DeviceInfoHelper {
  final DeviceInfoPlugin deviceInfo;
  final SesstionReader sesstionReader;
  final IdentityRepo identityRepo;
  final SettingReader settingReaer;
  final AppLogger logger;

  DeviceInfoHelper({
    required this.deviceInfo,
    required this.sesstionReader,
    required this.identityRepo,
    required this.settingReaer,
    required this.logger,
  });

  Future<PostRequestModel> setDeviceInfo(PostRequestModel request) async {
    try {
      late final String devName;
      late final String devVer;

      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        devName = info.model;
        devVer = info.version.release;
      } else if (Platform.isIOS) {
        final info = await deviceInfo.iosInfo;
        devName = info.model;
        devVer = info.systemVersion;
      } else {
        // macOS / Windows / Web
        devName = AppPlatform.platformName();
        devVer = '';
      }

      final settings = await settingReaer.appSetting();

      final devMo = AppPlatform.platformName();
      final langNo = settings.languageNumber.toString();

      return request.copyWith(devName: devName, devType: devMo, devVersion: devVer, langNo: langNo);
    } catch (error, stack) {
      logger.appError(tag: 'setDeviceInfo', error, stack: stack);
      throw AppException('Failed to set device info to request');
    }
  }

  
  Future<String> custIMEI() => identityRepo.generateIMI();
  
  Future<PostRequestModel> buildBaseRequest(PostRequestModel request) async {
    try {
      // 1)  device attributes + language
      var result = await setDeviceInfo(request);



      // 4) IMI (custIMEI)
      final imi = await custIMEI();
      result = result.copyWith(custIMEI: imi);

      return result;
    } catch (e, st) {
      logger.appError(tag: 'buildFullDeviceContext', e, stack: st);
      throw AppException('Failed to prepare request payload');
    }
  }


  Future<PostRequestModel> buildNewDeviceRequest(
    PostRequestModel request, {
    required String? mobile,
  }) async {
    try {
      if (mobile.isNullOrEmpty) {
        throw AppException("mobile number is missing");
      }
      // 1)  device attributes + language
      var result = await setDeviceInfo(request);



      // 4) IMI (custIMEI)
      final imi = await custIMEI();
      result = result.copyWith(custIMEI: imi);

      return result;
    } catch (e, st) {
      logger.appError(tag: 'buildFullDeviceContext', e, stack: st);
      throw AppException('Failed to prepare request payload');
    }
  }
}
