part of 'self_registration_bloc.dart';

sealed class SelfRegEvent extends Equatable {
  const SelfRegEvent();

  @override
  List<Object?> get props => [];
}

class SelfRegComplete extends SelfRegEvent {
  final SelfRegistrationPayload payload;

  const SelfRegComplete({required this.payload});
  @override
  List<Object> get props => [payload];
}
