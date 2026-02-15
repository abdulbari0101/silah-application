part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginToken extends LoginEvent {
  final String mobile;
  final String password;

  const LoginToken({required this.mobile, required this.password});

  @override
  List<Object> get props => [this.mobile, this.password];
}

class LoginTokenAfterSelfReg extends LoginEvent {
  final String mobile;
  final String password;

  const LoginTokenAfterSelfReg({required this.mobile, required this.password});

  @override
  List<Object> get props => [this.mobile, this.password];
}

class Login extends LoginEvent {}

class ConfrimtLogInInNewDevice extends LoginEvent {}

class LoginAfterPhoneVerification extends LoginEvent {}

/// otp Phone

class RequestPhoneOTP extends LoginEvent {
  const RequestPhoneOTP();

  @override
  List<Object> get props => [];
}

class ReSendPhoneOTP extends LoginEvent {}

class ConfirmPhoneOTP extends LoginEvent {
  final String? otp;

  const ConfirmPhoneOTP({this.otp});

  @override
  List<Object> get props => [];
}

/// Change Password

class ChangeFirstPassword extends LoginEvent {
  final String currentPassword;
  final String newPassword;

  const ChangeFirstPassword({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [currentPassword, newPassword];
}

/// Change PIN

class ChangeFirstPin extends LoginEvent {
  final String currentPin;
  final String newPin;

  const ChangeFirstPin({
    required this.currentPin,
    required this.newPin,
  });

  @override
  List<Object> get props => [currentPin, newPin];
}
