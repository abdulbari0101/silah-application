import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/wrapper/app_setting_bloc_builder.dart';
import 'package:silah_app/features/app_shell/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/screen/android_nav_wrapper.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/screen/ios_nav_wrapper.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  final StatefulNavigationShell? navigationShell;

  const MainScreen({super.key, required this.child, this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MultiBlocProvider(
          providers: [BlocProvider<HomeBloc>.value(value: locator<HomeBloc>())],
    
          child: AppSettingBlocBuilder(
            child: AppPlatform(
              ios: IOSNavWrapper(navigationShell: widget.navigationShell),
              android: AndroidNavWrapper(
                child: widget.child,
                navigationShell: widget.navigationShell,
              ),
            ),
          ),
        );
      },
    );
  }
}
