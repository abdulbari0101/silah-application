part of 'login_bloc.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.requested({
    required String email,
    required String password,
  }) = LoginRequested;
}
