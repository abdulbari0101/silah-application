import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_info.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_item_data.dart';
import 'package:silah_app/gen/assets.gen.dart';

enum AppUserRole { user, lawyer, admin }

AppUserRole resolveAppUserRole(AuthUserEntity? user) {
  final profileAccountType = user?.profile?['accountType']
      ?.toString()
      .toLowerCase();
  final isAdmin = profileAccountType == 'admin';
  if (isAdmin) return AppUserRole.admin;

  final isLawyer =
      profileAccountType == 'lawyer' ||
      user?.accountType == AuthAccountType.lawyer;
  if (isLawyer) return AppUserRole.lawyer;

  // Trainee is a user with an enabled trainee flag.
  return AppUserRole.user;
}

class NavItemsBuilder {
  static List<NavItemData> forRole(AppUserRole role) {
    switch (role) {
      case AppUserRole.admin:
        return _adminTabs();
      case AppUserRole.lawyer:
        return _lawyerTabs();
      case AppUserRole.user:
        return _userTabs();
    }
  }

  static List<NavItemData> _userTabs() => [
    _tab(
      route: AppRoutes.home,
      labelKey: Strings.home,
      icon: Assets.icons.bottomNavigation.home,
    ),
    _tab(
      route: AppRoutes.requests,
      labelKey: Strings.orders,
      icon: Assets.icons.bottomNavigation.requests,
    ),
    _tab(
      route: AppRoutes.messages,
      labelKey: Strings.messages,
      icon: Assets.icons.bottomNavigation.chats,
    ),
    _tab(
      route: AppRoutes.settings,
      labelKey: Strings.my_account,
      icon: Assets.icons.bottomNavigation.account,
    ),
  ];

  static List<NavItemData> _lawyerTabs() => [
    _tab(
      route: AppRoutes.home,
      labelKey: Strings.home,
      icon: Assets.icons.bottomNavigation.home,
    ),
    _tab(
      route: AppRoutes.requests,
      labelKey: Strings.orders,
      icon: Assets.icons.bottomNavigation.requests,
    ),
    _tab(
      route: AppRoutes.trainees,
      labelKey: Strings.trainees,
      icon: Assets.icons.bottomNavigation.requests,
    ),
    _tab(
      route: AppRoutes.settings,
      labelKey: Strings.my_account,
      icon: Assets.icons.bottomNavigation.account,
    ),
  ];

  static List<NavItemData> _adminTabs() => [
    _tab(
      route: AppRoutes.home,
      labelKey: Strings.home,
      icon: Assets.icons.bottomNavigation.home,
    ),
    _tab(
      route: AppRoutes.specifications,
      labelKey: Strings.specializations,
      icon: Assets.icons.bottomNavigation.requests,
    ),
    _tab(
      route: AppRoutes.messages,
      labelKey: Strings.messages,
      icon: Assets.icons.bottomNavigation.chats,
    ),
    _tab(
      route: AppRoutes.settings,
      labelKey: Strings.my_account,
      icon: Assets.icons.bottomNavigation.account,
    ),
  ];

  static NavItemData _tab({
    required RouteInfo route,
    required String labelKey,
    required String icon,
  }) {
    return NavItemData(
      routeName: route.name,
      selectedIconAsset: icon,
      unselectedIconAsset: icon,
      labelKey: labelKey,
      branchIndex: _branchIndex(route),
    );
  }

  static int _branchIndex(RouteInfo route) {
    final idx = AppRoutes.shellTabRoutes.indexOf(route);
    return idx == -1 ? 0 : idx;
  }
}
