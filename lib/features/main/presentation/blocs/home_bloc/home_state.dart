part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeRefreshed extends HomeState {}

class HomeRefreshError extends HomeState {
  final String message;
  const HomeRefreshError({required this.message});
  @override
  List<Object> get props => [message];
}
