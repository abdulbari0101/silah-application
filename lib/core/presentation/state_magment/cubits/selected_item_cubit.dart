import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedItemCubit<T> extends Cubit<T?> {
  SelectedItemCubit([T? initialState]) : super(initialState);

  void setSelected(T item) {
    if (item == state) return;
    emit(item);
  }

  bool isSelected(T item) => state == item;
}
