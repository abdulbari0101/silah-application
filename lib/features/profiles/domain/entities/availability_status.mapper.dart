// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'availability_status.dart';

class AvailabilityStatusMapper extends EnumMapper<AvailabilityStatus> {
  AvailabilityStatusMapper._();

  static AvailabilityStatusMapper? _instance;
  static AvailabilityStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvailabilityStatusMapper._());
    }
    return _instance!;
  }

  static AvailabilityStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AvailabilityStatus decode(dynamic value) {
    switch (value) {
      case r'available':
        return AvailabilityStatus.available;
      case r'busy':
        return AvailabilityStatus.busy;
      case r'unavailable':
        return AvailabilityStatus.unavailable;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AvailabilityStatus self) {
    switch (self) {
      case AvailabilityStatus.available:
        return r'available';
      case AvailabilityStatus.busy:
        return r'busy';
      case AvailabilityStatus.unavailable:
        return r'unavailable';
    }
  }
}

extension AvailabilityStatusMapperExtension on AvailabilityStatus {
  String toValue() {
    AvailabilityStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AvailabilityStatus>(this) as String;
  }
}

