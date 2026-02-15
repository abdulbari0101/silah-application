import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state_magment/cubits/selected_item_cubit.dart';

class SelectableItemBuilder<T> extends StatelessWidget {
  final T item;
  final Widget Function(BuildContext context, bool isSelected) builder;

  const SelectableItemBuilder({
    super.key,
    required this.item,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SelectedItemCubit<T>, T?, bool>(
      selector: (selected) => selected == item,
      builder: (context, isSelected) => builder(context, isSelected),
    );
  }
}