part of 'user_setting_bloc.dart';

abstract class UserSettingState extends Equatable {
  final UserSettingEntity data;
  const UserSettingState(this.data);

  @override
  List<Object?> get props => [data];
}

class UserSettingInitial extends UserSettingState {
  const UserSettingInitial() : super(const UserSettingEntity());
}

class UserSettingLoading extends UserSettingState {
  const UserSettingLoading(super.previous);
}

class UserSettingError extends UserSettingState {
  final String message;
  const UserSettingError({required this.message, required UserSettingEntity previous}) : super(previous);

  @override
  List<Object?> get props => [message, data];
}

class UserSettingLoaded extends UserSettingState {
  final UserSettingEntity setting;
  const UserSettingLoaded({required this.setting}) : super(setting);

  @override
  List<Object?> get props => [setting];
}
