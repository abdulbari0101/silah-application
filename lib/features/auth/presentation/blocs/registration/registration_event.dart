part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class RegisterUser extends RegistrationEvent {
  final RegistrationPayload payload;

  const RegisterUser({required this.payload});
  @override
  List<Object> get props => [payload];
}
