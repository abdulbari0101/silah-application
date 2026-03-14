part of 'app_state_bloc.dart';

@freezed
sealed class AppStateEvent with _$AppStateEvent {
  const factory AppStateEvent.updateSession({
    AuthUserEntity? authData,
    bool? isLoggedIn,
    UserAuthStatus? userAuthStatus,
  }) = UpdateSession;

  const factory AppStateEvent.userLoggedIn({
    required AuthUserEntity? authData,
    required UserAuthStatus? userAuthStatus,
  }) = UserLoggedIn;

  const factory AppStateEvent.injectDataBeforeAppStart({
    required AuthUserEntity? customer,
  }) = InjectDataBeforeAppStart;

  const factory AppStateEvent.syncLocalDataToAppState(
    AppStateData Function(AppStateData old) mapper, {
    String? type,
  }) = SyncLocalDataToAppState;
}
