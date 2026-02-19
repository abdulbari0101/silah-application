// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'setting_item_type.dart';

class SettingItemTypeMapper extends EnumMapper<SettingItemType> {
  SettingItemTypeMapper._();

  static SettingItemTypeMapper? _instance;
  static SettingItemTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingItemTypeMapper._());
    }
    return _instance!;
  }

  static SettingItemType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SettingItemType decode(dynamic value) {
    switch (value) {
      case r'toggle':
        return SettingItemType.toggle;
      case r'action':
        return SettingItemType.action;
      case r'navigation':
        return SettingItemType.navigation;
      case r'selection':
        return SettingItemType.selection;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SettingItemType self) {
    switch (self) {
      case SettingItemType.toggle:
        return r'toggle';
      case SettingItemType.action:
        return r'action';
      case SettingItemType.navigation:
        return r'navigation';
      case SettingItemType.selection:
        return r'selection';
    }
  }
}

extension SettingItemTypeMapperExtension on SettingItemType {
  String toValue() {
    SettingItemTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SettingItemType>(this) as String;
  }
}

