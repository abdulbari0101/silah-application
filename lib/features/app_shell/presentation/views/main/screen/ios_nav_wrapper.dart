import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_item_data.dart';

class IOSNavWrapper extends StatelessWidget {
  const IOSNavWrapper({super.key, required this.navigationShell, required this.items});

  final StatefulNavigationShell? navigationShell;
  final List<NavItemData> items;

  int _currentIndex() {
    final shell = navigationShell;
    if (shell == null) return 0;
    final branchIndex = shell.currentIndex;
    for (var i = 0; i < items.length; i++) {
      final targetBranch = items[i].branchIndex ?? i;
      if (targetBranch == branchIndex) return i;
    }
    return 0;
  }

  void _handleTap(int idx) {
    final shell = navigationShell;
    final targetBranch = items[idx].branchIndex ?? idx;
    if (targetBranch != shell?.currentIndex) {
      shell?.goBranch(targetBranch);
    } else {
      // Optionally pop to root of current branch here if you wish.
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex();
    return Scaffold(
      body: navigationShell,

      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: context.colors.surfaceContainerLow,
        activeColor: context.colors.onPrimaryContainer,
        inactiveColor: context.colors.onSurfaceVariant,
        currentIndex: currentIndex,
        onTap: _handleTap,

        items: [
          for (var i = 0; i < items.length; i++)
            _buildTab(context, items[i], i == currentIndex),
        ],
      ),
    );
  }

  Widget _buildTintedIcon(NavItemData item, bool selected, BuildContext context) {
    final color = selected ? context.colors.onPrimaryContainer : context.colors.onSurfaceVariant;

    return AppSvgIcon(
      assetName: selected ? item.selectedIconAsset : item.unselectedIconAsset,
      height: 24,
      width: 24,
      darkColor: color,
      lightColor: color,
      darkDynamicColor: false,
      lightDynamicColor: false,
    );
  }

  BottomNavigationBarItem _buildTab(BuildContext context, NavItemData item, bool selected) {
    return BottomNavigationBarItem(
      icon: _buildTintedIcon(item, selected, context),
      label: item.labelKey.tr(),
    );
  }
}
