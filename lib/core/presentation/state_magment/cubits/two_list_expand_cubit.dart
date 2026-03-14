import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'two_list_expand_cubit.freezed.dart';

enum TwoListMode { both, firstExpanded, secondExpanded }

@freezed
sealed class TwoListExpandState with _$TwoListExpandState {
  const factory TwoListExpandState({
    @Default(TwoListMode.both) TwoListMode mode,
  }) = _TwoListExpandState;
}

class TwoListExpandCubit extends Cubit<TwoListExpandState> {
  TwoListExpandCubit() : super(const TwoListExpandState());

  void showBoth() => emit(const TwoListExpandState(mode: TwoListMode.both));
  void expandFirst() =>
      emit(const TwoListExpandState(mode: TwoListMode.firstExpanded));
  void expandSecond() =>
      emit(const TwoListExpandState(mode: TwoListMode.secondExpanded));

  void toggleFirst() =>
      state.mode == TwoListMode.both ? expandFirst() : showBoth();

  void toggleSecond() =>
      state.mode == TwoListMode.both ? expandSecond() : showBoth();
}

extension TwoListExpandStateX on TwoListExpandState {
  bool get isFirstVisible =>
      mode == TwoListMode.both || mode == TwoListMode.firstExpanded;

  bool get isSecondVisible =>
      mode == TwoListMode.both || mode == TwoListMode.secondExpanded;

  bool get isFirstExpanded => mode == TwoListMode.firstExpanded;

  bool get isSecondExpanded => mode == TwoListMode.secondExpanded;

  bool get isBoth => mode == TwoListMode.both;
}
