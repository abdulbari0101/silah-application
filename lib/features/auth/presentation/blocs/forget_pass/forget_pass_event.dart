part of 'forget_pass_bloc.dart';

abstract class ForgetPassEvent extends Equatable {
  const ForgetPassEvent();

  @override
  List<Object?> get props => [];
}

class ForgetPassRequest extends ForgetPassEvent {
  final String mobile;
  final String? currentMobile;

  const ForgetPassRequest({required this.mobile , required this.currentMobile});
  @override
  List<Object?> get props => [mobile , currentMobile];
}

class ReSendForgetPassRequest extends ForgetPassEvent {}

class ConfirmForgetPass extends ForgetPassEvent {
  final String otp;
  final String newPassword;
  final String mobile;

  const ConfirmForgetPass({
    required this.otp,
    required this.newPassword,
    required this.mobile,
  });
  @override
  List<Object?> get props => [otp, newPassword, mobile];
}
