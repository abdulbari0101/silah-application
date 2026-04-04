import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/core/presentation/ui/screen/tabs_screen/utils/tab_buttons_bar.dart';
import 'package:silah_app/core/presentation/ui/screen/tabs_screen/utils/tab_view.dart';

import '../../../state_magment/cubits/tabs_cubit.dart';

class TabsBody extends StatelessWidget {
  final int currentTab;
  final EdgeInsetsGeometry padding;
  final List<TabView> items;

  const TabsBody({
    super.key,

    required this.currentTab,
    required this.items,
    this.padding = const EdgeInsets.symmetric(horizontal: 4),
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabsCubit(tabs: items, initialIndex: currentTab),
      child: Column(
        children: [
          TabButtonsBar(),

          SizedBox(height: AppDimension(context).height * 0.01),

          Expanded(
            child: BlocBuilder<TabsCubit, TabsState>(
              builder: (context, state) {
                return Padding(
                  padding: padding,
                  child: state.tabs[state.selectedIndex].widget,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
