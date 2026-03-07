part of 'registration_bloc.dart';

sealed class RegistrationState extends Equatable {
  final RegistrationOperType operationType;
  const RegistrationState({required this.operationType});
  @override
  List<Object?> get props => [operationType];
}

class RegistrationInitialState extends RegistrationState {
  const RegistrationInitialState() : super(operationType: RegistrationOperType.reqComplete);
}

class RegistrationInProgress extends RegistrationState {
  const RegistrationInProgress({required super.operationType});

}

class RegistrationStepSuccess extends RegistrationState {
  final String? data; // optional: mobile number, email, etc.
  const RegistrationStepSuccess({required super.operationType, this.data});

  @override
  List<Object?> get props => [...super.props, data];
}

class RegistrationError extends RegistrationState {
  final String message;
  const RegistrationError({required super.operationType, required this.message});

  @override
  List<Object?> get props => [...super.props, message];
}
