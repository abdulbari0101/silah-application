part of 'self_registration_bloc.dart';

sealed class SelfRegEvent extends Equatable {
  const SelfRegEvent();

  @override
  List<Object?> get props => [];
}

class SelfRegToken extends SelfRegEvent {
  final String mobile;
  final String? refrenceCode;
  const SelfRegToken({required this.mobile, this.refrenceCode});
  @override
  List<Object?> get props => [this.mobile, this.refrenceCode];
}

class SelfRegPhoneVerfiyRequest extends SelfRegEvent {}

class SelfRegReSendPhoneVerfiyRequest extends SelfRegEvent {}

class SelfRegPhoneVerfiyConfirm extends SelfRegEvent {
  final String otp;
  const SelfRegPhoneVerfiyConfirm({required this.otp});
  @override
  List<Object> get props => [otp];
}

class SelfRegEmailVerfiyRequest extends SelfRegEvent {
  final String email;
  const SelfRegEmailVerfiyRequest({required this.email});
  @override
  List<Object?> get props => [this.email];
}

class ReSendEmailVerfiyRequest extends SelfRegEvent {}

class SelfRegEmailVerfiyConfirm extends SelfRegEvent {
  final String otp;
  const SelfRegEmailVerfiyConfirm({required this.otp});
  @override
  List<Object> get props => [otp];
}

class SelfRegInfoFormSubmit extends SelfRegEvent {
  final String firstName;
  final String lastName;
  final String? email;

  const SelfRegInfoFormSubmit({
    required this.firstName,
    required this.lastName,
    this.email,
  });
  @override
  List<Object?> get props => [firstName, lastName, email];
}

class SelfRegComplete extends SelfRegEvent {
  final SelfRegistrationPayload payload;

  const SelfRegComplete({required this.payload});
  @override
  List<Object> get props => [payload];
}
