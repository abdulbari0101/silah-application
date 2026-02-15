part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}


class RefreshHomeEvent extends HomeEvent {
  // used to refresh the home screen when change language
  final String? language;
  const RefreshHomeEvent({this.language});
  @override
  List<Object> get props => [];
}
