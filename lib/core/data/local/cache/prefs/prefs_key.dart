// prefs_key.dart
import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';

part 'prefs_key.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum PrefsKey {
  // Saved data lists
  savedMobileNumbers,
  savedWebSurferCardNumbers,
  savedUsersCodes,
  savedAgentsCodes,
  savedNames,
  savedPersonalCards,
  savedCommercialElectNumbers,
  savedGovElectNumbers,
  savedWaterNumbers,
  savedMobilePosNumbers,
  savedWeNetAccountNumbers,
  appSetting,
  userSetting,
  companyInfo,
  transferPurposeList,
  operators,
  notificationsPendingSeen,
  imageProfile,
  sessionTime,
}

extension PrefsKeyExt on PrefsKey {
  String generateKey({String? userId}) {
    if (userId.isNotNullOrEmpty) {
      return '${toValue()}_${userId?.substring(0, 10)}';
    } else {
      return toValue();
    }
  }
}
