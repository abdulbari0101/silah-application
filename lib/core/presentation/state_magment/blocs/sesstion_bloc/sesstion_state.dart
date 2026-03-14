part of 'sesstion_bloc.dart';

@freezed
sealed class SessionState with _$SessionState {
  const factory SessionState.initial() = SessionInitial;
  const factory SessionState.idleTimedOut({required int randomId}) =
      SessionIdleTimedOut;
  const factory SessionState.tokenExpired({required ErrorSource source}) =
      SessionTokenExpired;
}
