// lib/features/main/presentation/ui/widgets/navigation/bottom_nav_bar.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';

import 'nav_item_data.dart';

class AndroidBottomNavBar extends StatelessWidget {
  const AndroidBottomNavBar({super.key, required this.items, this.navigationShell});

  final List<NavItemData> items;
  final StatefulNavigationShell? navigationShell;

  int _currentIndex(BuildContext context) {
    if (navigationShell != null) {
      return navigationShell!.currentIndex;
    }
    final router = GoRouter.of(context);
    final location = router.routerDelegate.currentConfiguration.fullPath;
    for (var i = 0; i < items.length; ++i) {
      final target = router.namedLocation(items[i].routeName);
      if (location == target || location.startsWith('$target/')) return i;
    }
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    if (navigationShell != null) {
      if (navigationShell!.currentIndex != index) {
        navigationShell!.goBranch(index);
      }
      return;
    }
    context.goNamed(items[index].routeName);
  }

  @override
  Widget build(BuildContext context) {
    final current = _currentIndex(context);

    return BottomNavigationBar(
      currentIndex: current,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (i) => _onTap(context, i),
      items: List.generate(items.length, (i) => _buildItem(context, i, current == i)),
    );
  }

  BottomNavigationBarItem _buildItem(BuildContext context, int index, bool selected) {
    final item = items[index];
    final theme = Theme.of(context);
    final navTheme = theme.bottomNavigationBarTheme;
    final selectedColor = theme.colorScheme.primary;
    final unselectedColor = navTheme.unselectedItemColor ?? theme.colorScheme.onSurfaceVariant;
    final iconColor = selected ? selectedColor : unselectedColor;

    final iconWidget = AppSvgIcon(
      assetName: selected ? item.selectedIconAsset : item.unselectedIconAsset,
      height: 24,
      width: 24,
      darkColor: iconColor,
      lightColor: iconColor,
      darkDynamicColor: false,
      lightDynamicColor: false,
    );

    final style = selected ? navTheme.selectedLabelStyle : navTheme.unselectedLabelStyle;
    final labelStyle = (style ?? theme.textTheme.labelMedium)?.copyWith(color: iconColor);

    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          const SizedBox(height: 8),
          Text(item.labelKey.tr(), style: labelStyle),
        ],
      ),
      label: '', // keep labels hidden – we render our own
    );
  }
}
