// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'verification_status.dart';

class VerificationStatusMapper extends EnumMapper<VerificationStatus> {
  VerificationStatusMapper._();

  static VerificationStatusMapper? _instance;
  static VerificationStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VerificationStatusMapper._());
    }
    return _instance!;
  }

  static VerificationStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  VerificationStatus decode(dynamic value) {
    switch (value) {
      case r'pending':
        return VerificationStatus.pending;
      case r'verified':
        return VerificationStatus.verified;
      case r'rejected':
        return VerificationStatus.rejected;
      case r'needsreview':
        return VerificationStatus.needsReview;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(VerificationStatus self) {
    switch (self) {
      case VerificationStatus.pending:
        return r'pending';
      case VerificationStatus.verified:
        return r'verified';
      case VerificationStatus.rejected:
        return r'rejected';
      case VerificationStatus.needsReview:
        return r'needsreview';
    }
  }
}

extension VerificationStatusMapperExtension on VerificationStatus {
  String toValue() {
    VerificationStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<VerificationStatus>(this) as String;
  }
}

