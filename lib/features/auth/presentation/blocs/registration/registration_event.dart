part of 'registration_bloc.dart';

@freezed
sealed class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.registerUser({
    required RegistrationPayload payload,
  }) = RegisterUser;
}
