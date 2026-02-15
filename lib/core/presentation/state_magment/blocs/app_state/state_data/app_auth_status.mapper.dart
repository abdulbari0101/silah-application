// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_auth_status.dart';

class UserAuthStatusMapper extends EnumMapper<UserAuthStatus> {
  UserAuthStatusMapper._();

  static UserAuthStatusMapper? _instance;
  static UserAuthStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserAuthStatusMapper._());
    }
    return _instance!;
  }

  static UserAuthStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  UserAuthStatus decode(dynamic value) {
    switch (value) {
      case r'firstTimeGuest':
        return UserAuthStatus.firstTimeGuest;
      case r'loggedOutReturningUser':
        return UserAuthStatus.loggedOutReturningUser;
      case r'loggedInUnverifiedAccount':
        return UserAuthStatus.loggedInUnverifiedAccount;
      case r'loggedInUnverifiedDevice':
        return UserAuthStatus.loggedInUnverifiedDevice;
      case r'loggedInFullyVerified':
        return UserAuthStatus.loggedInFullyVerified;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(UserAuthStatus self) {
    switch (self) {
      case UserAuthStatus.firstTimeGuest:
        return r'firstTimeGuest';
      case UserAuthStatus.loggedOutReturningUser:
        return r'loggedOutReturningUser';
      case UserAuthStatus.loggedInUnverifiedAccount:
        return r'loggedInUnverifiedAccount';
      case UserAuthStatus.loggedInUnverifiedDevice:
        return r'loggedInUnverifiedDevice';
      case UserAuthStatus.loggedInFullyVerified:
        return r'loggedInFullyVerified';
    }
  }
}

extension UserAuthStatusMapperExtension on UserAuthStatus {
  String toValue() {
    UserAuthStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<UserAuthStatus>(this) as String;
  }
}

