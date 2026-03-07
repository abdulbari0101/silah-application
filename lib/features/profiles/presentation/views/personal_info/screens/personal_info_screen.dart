import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/profiles/presentation/cubits/profile/profile_cubit.dart';
import 'package:silah_app/features/profiles/presentation/views/personal_info/widgets/personal_info_body.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(
        repository: locator(),
        appStateBloc: context.read<AppStateBloc>(),
        imagePickerService: locator(),
      )..load(),
      child: PlatformScreenWrapper(
        title: Strings.personal_information.tr(),
        body: const PersonalInfoBody(),
      ),
    );
  }
}
