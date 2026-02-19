// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'consultation_close_reason.dart';

class ConsultationCloseReasonMapper
    extends EnumMapper<ConsultationCloseReason> {
  ConsultationCloseReasonMapper._();

  static ConsultationCloseReasonMapper? _instance;
  static ConsultationCloseReasonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ConsultationCloseReasonMapper._(),
      );
    }
    return _instance!;
  }

  static ConsultationCloseReason fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ConsultationCloseReason decode(dynamic value) {
    switch (value) {
      case r'completed':
        return ConsultationCloseReason.completed;
      case r'usercancelled':
        return ConsultationCloseReason.userCancelled;
      case r'lawyerrejected':
        return ConsultationCloseReason.lawyerRejected;
      case r'timeout':
        return ConsultationCloseReason.timeout;
      case r'other':
        return ConsultationCloseReason.other;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ConsultationCloseReason self) {
    switch (self) {
      case ConsultationCloseReason.completed:
        return r'completed';
      case ConsultationCloseReason.userCancelled:
        return r'usercancelled';
      case ConsultationCloseReason.lawyerRejected:
        return r'lawyerrejected';
      case ConsultationCloseReason.timeout:
        return r'timeout';
      case ConsultationCloseReason.other:
        return r'other';
    }
  }
}

extension ConsultationCloseReasonMapperExtension on ConsultationCloseReason {
  String toValue() {
    ConsultationCloseReasonMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ConsultationCloseReason>(this)
        as String;
  }
}

