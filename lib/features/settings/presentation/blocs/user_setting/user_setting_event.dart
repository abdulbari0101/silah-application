part of 'user_setting_bloc.dart';

abstract class UserSettingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InjectUserSettingEvent extends UserSettingEvent {
  final UserSettingEntity setting;

  InjectUserSettingEvent({required this.setting});

  @override
  List<Object?> get props => [setting];
}

class GetUserSettingEvent extends UserSettingEvent {}

class UpdateUserSettingEvent extends UserSettingEvent {
  final bool? notification;

  final bool isRefresh;
  final bool rebuildApp;
  UpdateUserSettingEvent({this.notification, this.isRefresh = true, this.rebuildApp = true});

  @override
  List<Object?> get props => [notification];
}
