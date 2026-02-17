// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'admin_task_status.dart';

class AdminTaskStatusMapper extends EnumMapper<AdminTaskStatus> {
  AdminTaskStatusMapper._();

  static AdminTaskStatusMapper? _instance;
  static AdminTaskStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdminTaskStatusMapper._());
    }
    return _instance!;
  }

  static AdminTaskStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AdminTaskStatus decode(dynamic value) {
    switch (value) {
      case r'pending':
        return AdminTaskStatus.pending;
      case r'inreview':
        return AdminTaskStatus.inReview;
      case r'approved':
        return AdminTaskStatus.approved;
      case r'rejected':
        return AdminTaskStatus.rejected;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AdminTaskStatus self) {
    switch (self) {
      case AdminTaskStatus.pending:
        return r'pending';
      case AdminTaskStatus.inReview:
        return r'inreview';
      case AdminTaskStatus.approved:
        return r'approved';
      case AdminTaskStatus.rejected:
        return r'rejected';
    }
  }
}

extension AdminTaskStatusMapperExtension on AdminTaskStatus {
  String toValue() {
    AdminTaskStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AdminTaskStatus>(this) as String;
  }
}

