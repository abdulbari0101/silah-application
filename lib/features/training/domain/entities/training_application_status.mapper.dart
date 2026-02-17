// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'training_application_status.dart';

class TrainingApplicationStatusMapper
    extends EnumMapper<TrainingApplicationStatus> {
  TrainingApplicationStatusMapper._();

  static TrainingApplicationStatusMapper? _instance;
  static TrainingApplicationStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TrainingApplicationStatusMapper._(),
      );
    }
    return _instance!;
  }

  static TrainingApplicationStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TrainingApplicationStatus decode(dynamic value) {
    switch (value) {
      case r'pending':
        return TrainingApplicationStatus.pending;
      case r'accepted':
        return TrainingApplicationStatus.accepted;
      case r'rejected':
        return TrainingApplicationStatus.rejected;
      case r'cancelled':
        return TrainingApplicationStatus.cancelled;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TrainingApplicationStatus self) {
    switch (self) {
      case TrainingApplicationStatus.pending:
        return r'pending';
      case TrainingApplicationStatus.accepted:
        return r'accepted';
      case TrainingApplicationStatus.rejected:
        return r'rejected';
      case TrainingApplicationStatus.cancelled:
        return r'cancelled';
    }
  }
}

extension TrainingApplicationStatusMapperExtension
    on TrainingApplicationStatus {
  String toValue() {
    TrainingApplicationStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TrainingApplicationStatus>(this)
        as String;
  }
}

