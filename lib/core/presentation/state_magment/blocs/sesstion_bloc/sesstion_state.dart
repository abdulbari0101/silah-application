part of 'sesstion_bloc.dart';

sealed class SessionState extends Equatable {
  const SessionState();
  @override
  List<Object?> get props => [];
}

class SessionInitial extends SessionState {}

class SessionIdleTimedOut extends SessionState {
  final randomId;

  SessionIdleTimedOut() : randomId = Random().nextInt(1000000);
  @override
  List<Object?> get props => [...super.props, randomId];
}

class SessionTokenExpired extends SessionState {
  final ErrorSource source;
  const SessionTokenExpired(this.source);
  @override
  List<Object?> get props => [source];
}


