part of 'app_setting_bloc.dart';

@MappableClass(
  // store which subtype this is under this key
  discriminatorKey: 'type',
)
sealed class AppSettingState with AppSettingStateMappable {
  final AppSettingEntity data;
  const AppSettingState(this.data);
}

@MappableClass(discriminatorValue: 'initial')
class AppSettingInitial extends AppSettingState with AppSettingInitialMappable{
  const AppSettingInitial() : super(const AppSettingEntity());
}

@MappableClass(discriminatorValue: 'loading')
class AppSettingLoading extends AppSettingState with AppSettingLoadingMappable {
  const AppSettingLoading(super.previous);
}

@MappableClass(discriminatorValue: 'error')
class AppSettingError extends AppSettingState with AppSettingErrorMappable{
  final String message;
  const AppSettingError({required this.message, required AppSettingEntity previous})
    : super(previous);
}

@MappableClass(discriminatorValue: 'loaded')
class AppSettingLoaded extends AppSettingState with AppSettingLoadedMappable{
  const AppSettingLoaded(super.setting);
}
