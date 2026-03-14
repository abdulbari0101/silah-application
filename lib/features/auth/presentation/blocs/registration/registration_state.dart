part of 'registration_bloc.dart';

@freezed
sealed class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial({
    @Default(RegistrationOperType.reqComplete)
    RegistrationOperType operationType,
  }) = RegistrationInitialState;
  const factory RegistrationState.inProgress({
    required RegistrationOperType operationType,
  }) = RegistrationInProgress;
  const factory RegistrationState.stepSuccess({
    required RegistrationOperType operationType,
    String? data,
  }) = RegistrationStepSuccess;
  const factory RegistrationState.error({
    required RegistrationOperType operationType,
    required String message,
  }) = RegistrationError;
}
