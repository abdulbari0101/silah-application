import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_item_data.dart';
import 'package:silah_app/gen/assets.gen.dart';

class IOSNavWrapper extends StatelessWidget {
  const IOSNavWrapper({super.key, required this.navigationShell});

  final StatefulNavigationShell? navigationShell;

  static final List<NavItemData> _tabs = [
    NavItemData(
      routeName: AppRoutes.home.name,
      selectedIconAsset: Assets.icons.bottomNavigation.home,
      unselectedIconAsset: Assets.icons.bottomNavigation.home,
      labelKey: Strings.home,
    ),

    NavItemData(
      routeName: AppRoutes.requests.name,
      selectedIconAsset: Assets.icons.bottomNavigation.requests,
      unselectedIconAsset: Assets.icons.bottomNavigation.requests,
      labelKey: Strings.my_requests,
    ),

    NavItemData(
      routeName: AppRoutes.messages.name,
      selectedIconAsset: Assets.icons.bottomNavigation.chats,
      unselectedIconAsset: Assets.icons.bottomNavigation.chats,
      labelKey: Strings.messages,
    ),

    NavItemData(
      routeName: AppRoutes.settings.name,
      selectedIconAsset: Assets.icons.bottomNavigation.account,
      unselectedIconAsset: Assets.icons.bottomNavigation.account,
      labelKey: Strings.my_account,
    ),
  ];

  void _handleTap(int idx) {
    if (idx != navigationShell?.currentIndex) {
      navigationShell?.goBranch(idx);
    } else {
      // Optionally pop to root of current branch here if you wish.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,

      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: context.colors.surfaceContainerLow,
        activeColor: context.colors.onPrimaryContainer,
        inactiveColor: context.colors.onSurfaceVariant,
        currentIndex: navigationShell?.currentIndex ?? 0,
        onTap: _handleTap,

        items: [
          for (var i = 0; i < _tabs.length; i++)
            _buildTab(context, _tabs[i], i == navigationShell?.currentIndex),
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
