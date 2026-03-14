part of 'user_setting_bloc.dart';

@freezed
sealed class UserSettingState with _$UserSettingState {
  const factory UserSettingState.initial({
    @Default(UserSettingEntity()) UserSettingEntity data,
  }) = UserSettingInitial;
  const factory UserSettingState.loading({required UserSettingEntity data}) =
      UserSettingLoading;
  const factory UserSettingState.error({
    required String message,
    required UserSettingEntity data,
  }) = UserSettingError;
  const factory UserSettingState.loaded({required UserSettingEntity data}) =
      UserSettingLoaded;
}
