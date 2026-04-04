import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';

import '../widget/body.dart';

class LanguagePreferencesScreen extends StatelessWidget {
  const LanguagePreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingBloc, AppSettingState>(
      builder: (context, state) {
        return PlatformScreenWrapper(
          body: LanguageBody(),
          title: Strings.et_change_lang.tr(),
        );
      },
    );
  }
}
