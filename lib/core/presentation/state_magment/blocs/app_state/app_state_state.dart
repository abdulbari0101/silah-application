part of 'app_state_bloc.dart';

@MappableClass(discriminatorKey: 'state')
sealed class AppStateState with AppStateStateMappable {
  const AppStateState(this.data);
  final AppStateData data;
}

@MappableClass(discriminatorValue: 'initial')
class AppStateInitial extends AppStateState with AppStateInitialMappable {
  AppStateInitial() : super( AppStateData());
}

@MappableClass(discriminatorValue: 'loaded')
class AppStateLoaded extends AppStateState with AppStateLoadedMappable {
  const AppStateLoaded(super.data);
}
