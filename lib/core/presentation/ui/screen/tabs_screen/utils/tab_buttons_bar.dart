import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/core/presentation/ui/screen/tabs_screen/utils/tab_button_item.dart';

import '../../../../state_magment/cubits/tabs_cubit.dart';

class TabButtonsBar extends StatelessWidget {
  const TabButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, TabsState>(
      builder: (context, state) {
        return Container(
          width: AppDimension(context).width * 0.88,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          decoration: BoxDecoration(
            color: context.colors.greyDark(reverse: true),
            borderRadius: context.shapes.brSm,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: Row(
              children: List.generate(
                state.tabs.length,
                (index) => TabButtonItem(
                  tab: state.tabs[index],
                  isSelected: index == state.selectedIndex,
                  onTap: () => context.read<TabsCubit>().changeTab(index),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
