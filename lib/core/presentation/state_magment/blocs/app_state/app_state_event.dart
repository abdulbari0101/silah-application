part of 'app_state_bloc.dart';

@MappableClass(discriminatorKey: 'event')
sealed class AppStateEvent  with AppStateEventMappable {
  const AppStateEvent();

}

@MappableClass(discriminatorValue: 'update_session')
class UpdateSession extends AppStateEvent with UpdateSessionMappable {
  final AuthUserEntity? authData;
  final bool? isLoggedIn;
  final UserAuthStatus? userAuthStatus;

  const UpdateSession({this.authData, this.isLoggedIn, this.userAuthStatus});

}

@MappableClass(discriminatorValue: 'user_logged_in')
class UserLoggedIn extends AppStateEvent with UserLoggedInMappable {
  final AuthUserEntity? authData;
  final UserAuthStatus? userAuthStatus;

  const UserLoggedIn({
    required this.authData,
    required this.userAuthStatus,
  });

}






@MappableClass(discriminatorValue: 'inject_data_before_app_start')
class InjectDataBeforeAppStart extends AppStateEvent with InjectDataBeforeAppStartMappable {
  final AuthUserEntity? customer;

  const InjectDataBeforeAppStart({required this.customer});

}

// Functions can't be serialized—ignore the mapper field.
@MappableClass(discriminatorValue: 'sync_local_data_to_app_state')
class SyncLocalDataToAppState extends AppStateEvent with SyncLocalDataToAppStateMappable {

  final AppStateData Function(AppStateData old) mapper;
  final String? type;

  const SyncLocalDataToAppState(this.mapper, {this.type});

}
