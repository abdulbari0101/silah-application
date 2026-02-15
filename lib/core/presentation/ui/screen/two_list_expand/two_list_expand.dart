import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/two_list_expand_cubit.dart';
import 'package:silah_app/core/presentation/ui/screen/two_list_expand/models/sub_list_view.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/sub_list_card.dart';

class TwoListExpand extends StatelessWidget {
  const TwoListExpand({super.key, required this.firstList, required this.secondList, this.padding});

  final SubListView firstList;
  final SubListView secondList;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final firstMoreText = firstList.moreText ?? Strings.view_all.tr();
    final firstCloseText = firstList.closeText ?? Strings.view_less.tr();

    final secondMoreText = secondList.moreText ?? Strings.view_all.tr();
    final secondCloseText = secondList.closeText ?? Strings.view_less.tr();

    return BlocProvider(
      create: (_) => TwoListExpandCubit(),
      child: BlocBuilder<TwoListExpandCubit, TwoListExpandState>(
        builder: (context, state) {
          return Padding(
            padding: padding ?? EdgeInsets.symmetric(vertical: 0),
            child: SafeArea(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: Column(
                  key: ValueKey(state.mode),
                  children: [
                    if (state.isFirstVisible)
                      SubListCard(
                        childList: firstList.child,
                        title: firstList.title,
                        moreText: state.isFirstExpanded ? firstCloseText : firstMoreText,
                        onMoreTap: () {
                          firstList.onMoreTap?.call();
                          _toggleFirstView(context, state);
                        },
                      ),

                    if (state.isBoth) const SizedBox(height: 8),

                    if (state.isSecondVisible)
                      SubListCard(
                        childList: secondList.child,
                        title: secondList.title,
                        moreText: state.isSecondExpanded ? secondCloseText : secondMoreText,
                        onMoreTap: () {
                          secondList.onMoreTap?.call();
                          _toggleSecondView(context, state);
                        },
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _toggleFirstView(BuildContext context, TwoListExpandState state) {
    final cubit = context.read<TwoListExpandCubit>();
    state.mode == TwoListMode.both ? cubit.expandFirst() : cubit.showBoth();
  }

  void _toggleSecondView(BuildContext context, TwoListExpandState state) {
    final cubit = context.read<TwoListExpandCubit>();
    state.mode == TwoListMode.both ? cubit.expandSecond() : cubit.showBoth();
  }
}
