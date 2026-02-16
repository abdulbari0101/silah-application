// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'prefs_key.dart';

class PrefsKeyMapper extends EnumMapper<PrefsKey> {
  PrefsKeyMapper._();

  static PrefsKeyMapper? _instance;
  static PrefsKeyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PrefsKeyMapper._());
    }
    return _instance!;
  }

  static PrefsKey fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PrefsKey decode(dynamic value) {
    switch (value) {
      case r'saved_mobile_numbers':
        return PrefsKey.savedMobileNumbers;
      case r'saved_web_surfer_card_numbers':
        return PrefsKey.savedWebSurferCardNumbers;
      case r'saved_users_codes':
        return PrefsKey.savedUsersCodes;
      case r'saved_agents_codes':
        return PrefsKey.savedAgentsCodes;
      case r'saved_names':
        return PrefsKey.savedNames;
      case r'saved_personal_cards':
        return PrefsKey.savedPersonalCards;
      case r'saved_commercial_elect_numbers':
        return PrefsKey.savedCommercialElectNumbers;
      case r'saved_gov_elect_numbers':
        return PrefsKey.savedGovElectNumbers;
      case r'saved_water_numbers':
        return PrefsKey.savedWaterNumbers;
      case r'saved_mobile_pos_numbers':
        return PrefsKey.savedMobilePosNumbers;
      case r'saved_we_net_account_numbers':
        return PrefsKey.savedWeNetAccountNumbers;
      case r'app_setting':
        return PrefsKey.appSetting;
      case r'user_setting':
        return PrefsKey.userSetting;
      case r'company_info':
        return PrefsKey.companyInfo;
      case r'transfer_purpose_list':
        return PrefsKey.transferPurposeList;
      case r'operators':
        return PrefsKey.operators;
      case r'notifications_pending_seen':
        return PrefsKey.notificationsPendingSeen;
      case r'image_profile':
        return PrefsKey.imageProfile;
      case r'session_time':
        return PrefsKey.sessionTime;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PrefsKey self) {
    switch (self) {
      case PrefsKey.savedMobileNumbers:
        return r'saved_mobile_numbers';
      case PrefsKey.savedWebSurferCardNumbers:
        return r'saved_web_surfer_card_numbers';
      case PrefsKey.savedUsersCodes:
        return r'saved_users_codes';
      case PrefsKey.savedAgentsCodes:
        return r'saved_agents_codes';
      case PrefsKey.savedNames:
        return r'saved_names';
      case PrefsKey.savedPersonalCards:
        return r'saved_personal_cards';
      case PrefsKey.savedCommercialElectNumbers:
        return r'saved_commercial_elect_numbers';
      case PrefsKey.savedGovElectNumbers:
        return r'saved_gov_elect_numbers';
      case PrefsKey.savedWaterNumbers:
        return r'saved_water_numbers';
      case PrefsKey.savedMobilePosNumbers:
        return r'saved_mobile_pos_numbers';
      case PrefsKey.savedWeNetAccountNumbers:
        return r'saved_we_net_account_numbers';
      case PrefsKey.appSetting:
        return r'app_setting';
      case PrefsKey.userSetting:
        return r'user_setting';
      case PrefsKey.companyInfo:
        return r'company_info';
      case PrefsKey.transferPurposeList:
        return r'transfer_purpose_list';
      case PrefsKey.operators:
        return r'operators';
      case PrefsKey.notificationsPendingSeen:
        return r'notifications_pending_seen';
      case PrefsKey.imageProfile:
        return r'image_profile';
      case PrefsKey.sessionTime:
        return r'session_time';
    }
  }
}

extension PrefsKeyMapperExtension on PrefsKey {
  String toValue() {
    PrefsKeyMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PrefsKey>(this) as String;
  }
}

