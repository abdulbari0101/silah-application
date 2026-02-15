part of 'sesstion_bloc.dart';

sealed class SessionEvent extends Equatable {
  const SessionEvent();
  @override
  List<Object?> get props => [];
}

//
class ResumeInteractionListener extends SessionEvent {}

class PauseInteractionListener extends SessionEvent {}

class InteractionTimedOutEvent extends SessionEvent {}

class TokenExpiredEvent extends SessionEvent {
  final ErrorSource source;
  const TokenExpiredEvent({required this.source});
  @override
  List<Object?> get props => [source];
}

