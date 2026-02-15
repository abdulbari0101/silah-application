import 'package:flutter_bloc/flutter_bloc.dart';

enum TwoListMode {
  both,
  firstExpanded,
  secondExpanded,
}

class TwoListExpandState {
  final TwoListMode mode;
  const TwoListExpandState(this.mode);
}

class TwoListExpandCubit extends Cubit<TwoListExpandState> {
  TwoListExpandCubit() : super(const TwoListExpandState(TwoListMode.both));

  void showBoth() => emit(const TwoListExpandState(TwoListMode.both));
  void expandFirst() => emit(const TwoListExpandState(TwoListMode.firstExpanded));
  void expandSecond() => emit(const TwoListExpandState(TwoListMode.secondExpanded));

  void toggleFirst()=> state.mode == TwoListMode.both ? expandFirst() : showBoth();

  void toggleSecond() =>state.mode == TwoListMode.both ? expandSecond() : showBoth();
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
