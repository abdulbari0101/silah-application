part of 'app_state_bloc.dart';

@freezed
sealed class AppStateState with _$AppStateState {
  const factory AppStateState.initial({required AppStateData data}) =
      AppStateInitial;
  const factory AppStateState.loaded({required AppStateData data}) =
      AppStateLoaded;
}
