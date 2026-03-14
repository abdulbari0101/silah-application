part of 'user_setting_bloc.dart';

@freezed
sealed class UserSettingEvent with _$UserSettingEvent {
  const factory UserSettingEvent.inject({required UserSettingEntity setting}) =
      InjectUserSettingEvent;
  const factory UserSettingEvent.get() = GetUserSettingEvent;
  const factory UserSettingEvent.update({
    bool? notification,
    @Default(true) bool isRefresh,
    @Default(true) bool rebuildApp,
  }) = UpdateUserSettingEvent;
}
