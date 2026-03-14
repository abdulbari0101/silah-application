part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.refreshed() = HomeRefreshed;
  const factory HomeState.error({required String message}) = HomeRefreshError;
}
