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
      case r'legal_procedures_started_outside_platform':
        return ConsultationCloseReason.legalProceduresStartedOutsidePlatform;
      case r'client_inactive_for_long_time':
        return ConsultationCloseReason.clientInactiveForLongTime;
      case r'outside_service_scope':
        return ConsultationCloseReason.outsideServiceScope;
      case r'conflict_of_interest':
        return ConsultationCloseReason.conflictOfInterest;
      case r'consultation_completed':
        return ConsultationCloseReason.consultationCompleted;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ConsultationCloseReason self) {
    switch (self) {
      case ConsultationCloseReason.legalProceduresStartedOutsidePlatform:
        return r'legal_procedures_started_outside_platform';
      case ConsultationCloseReason.clientInactiveForLongTime:
        return r'client_inactive_for_long_time';
      case ConsultationCloseReason.outsideServiceScope:
        return r'outside_service_scope';
      case ConsultationCloseReason.conflictOfInterest:
        return r'conflict_of_interest';
      case ConsultationCloseReason.consultationCompleted:
        return r'consultation_completed';
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

