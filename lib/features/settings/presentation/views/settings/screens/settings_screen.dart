import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/profiles/presentation/cubits/profile/profile_cubit.dart';
import 'package:silah_app/features/settings/presentation/views/settings/widget/body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingBloc, AppSettingState>(
      builder: (context, state) {
        return BlocProvider(
          create: (_) => ProfileCubit(
            repository: locator(),
            appStateBloc: context.read<AppStateBloc>(),
            imagePickerService: locator(),
          )..load(),
          child: const PlatformScreenWrapper(body: Body()),
        );
      },
    );
  }
}
