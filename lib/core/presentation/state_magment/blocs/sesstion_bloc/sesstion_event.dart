part of 'sesstion_bloc.dart';

@freezed
sealed class SessionEvent with _$SessionEvent {
  const factory SessionEvent.resumeInteractionListener() =
      ResumeInteractionListener;
  const factory SessionEvent.pauseInteractionListener() =
      PauseInteractionListener;
  const factory SessionEvent.interactionTimedOut() = InteractionTimedOutEvent;
  const factory SessionEvent.tokenExpired({required ErrorSource source}) =
      TokenExpiredEvent;
}
