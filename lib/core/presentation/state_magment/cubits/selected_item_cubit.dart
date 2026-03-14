import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_item_cubit.freezed.dart';

@freezed
sealed class SelectedItemState<T> with _$SelectedItemState<T> {
  const factory SelectedItemState({T? selected}) = _SelectedItemState<T>;
}

class SelectedItemCubit<T> extends Cubit<SelectedItemState<T>> {
  SelectedItemCubit([T? initialState])
    : super(SelectedItemState<T>(selected: initialState));

  void setSelected(T item) {
    if (item == state.selected) return;
    emit(state.copyWith(selected: item));
  }

  bool isSelected(T item) => state.selected == item;
}
