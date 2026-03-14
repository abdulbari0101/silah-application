part of 'app_setting_bloc.dart';

@freezed
sealed class AppSettingState with _$AppSettingState {
  const factory AppSettingState.initial({
    @Default(AppSettingEntity()) AppSettingEntity data,
  }) = AppSettingInitial;
  const factory AppSettingState.loading({required AppSettingEntity data}) =
      AppSettingLoading;
  const factory AppSettingState.error({
    required String message,
    required AppSettingEntity data,
  }) = AppSettingError;
  const factory AppSettingState.loaded({required AppSettingEntity data}) =
      AppSettingLoaded;
}
