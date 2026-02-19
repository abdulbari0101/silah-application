// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'consultation_status.dart';

class ConsultationStatusMapper extends EnumMapper<ConsultationStatus> {
  ConsultationStatusMapper._();

  static ConsultationStatusMapper? _instance;
  static ConsultationStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConsultationStatusMapper._());
    }
    return _instance!;
  }

  static ConsultationStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ConsultationStatus decode(dynamic value) {
    switch (value) {
      case r'pending':
        return ConsultationStatus.pending;
      case r'accepted':
        return ConsultationStatus.accepted;
      case r'rejected':
        return ConsultationStatus.rejected;
      case r'active':
        return ConsultationStatus.active;
      case r'closed':
        return ConsultationStatus.closed;
      case r'cancelled':
        return ConsultationStatus.cancelled;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ConsultationStatus self) {
    switch (self) {
      case ConsultationStatus.pending:
        return r'pending';
      case ConsultationStatus.accepted:
        return r'accepted';
      case ConsultationStatus.rejected:
        return r'rejected';
      case ConsultationStatus.active:
        return r'active';
      case ConsultationStatus.closed:
        return r'closed';
      case ConsultationStatus.cancelled:
        return r'cancelled';
    }
  }
}

extension ConsultationStatusMapperExtension on ConsultationStatus {
  String toValue() {
    ConsultationStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ConsultationStatus>(this) as String;
  }
}

