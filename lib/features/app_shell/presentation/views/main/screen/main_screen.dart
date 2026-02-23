import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/wrapper/app_setting_bloc_builder.dart';
import 'package:silah_app/features/app_shell/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/screen/android_nav_wrapper.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/screen/ios_nav_wrapper.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_item_data.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_items_builder.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  final StatefulNavigationShell? navigationShell;

  const MainScreen({super.key, required this.child, this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _ensureAllowedBranch(StatefulNavigationShell? navigationShell, List<NavItemData> items) {
    if (navigationShell == null || items.isEmpty) return;
    final allowedBranches = <int>{};
    for (var i = 0; i < items.length; i++) {
      allowedBranches.add(items[i].branchIndex ?? i);
    }
    final current = navigationShell.currentIndex;
    if (!allowedBranches.contains(current)) {
      final target = items.first.branchIndex ?? 0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (navigationShell.currentIndex != target) {
          navigationShell.goBranch(target);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }

  @override
  Widget build(BuildContext context) {
    final authUser = context.select<AppStateBloc, AuthUserEntity?>((bloc) {
      final state = bloc.state;
      if (state is AppStateLoaded) {
        return state.data.customer;
      }
      return null;
    });
    final role = resolveAppUserRole(authUser);
    final items = NavItemsBuilder.forRole(role);
    _ensureAllowedBranch(widget.navigationShell, items);

    return Builder(
      builder: (context) {
        return MultiBlocProvider(
          providers: [BlocProvider<HomeBloc>.value(value: locator<HomeBloc>())],
    
          child: AppSettingBlocBuilder(
            child: AppPlatform(
              ios: IOSNavWrapper(navigationShell: widget.navigationShell, items: items),
              android: AndroidNavWrapper(
                child: widget.child,
                navigationShell: widget.navigationShell,
                items: items,
              ),
            ),
          ),
        );
      },
    );
  }
}
