import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';

import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';

class NewThem extends StatelessWidget {
  const NewThem({super.key});

  @override
  Widget build(BuildContext context) {
    final settingState = context.watch<AppSettingBloc>().state;
    final isSystem = settingState.data.isSystemThemeTheme;
    final isDark = settingState.data.isDarkTheme;

    return CardButton(
      onTap: () {
        if (isSystem) {
          DialogService.showThemeSetting(context);
        } else {
          final newTheme = isDark ? AppThemeMode.light : AppThemeMode.dark;
          context.read<AppSettingBloc>().add(
            ChangeThemeEvent(appAppThemeMode: newTheme, fromWhere: "ThemeMenu"),
          );
        }
      },
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      borderRadius: context.shapes.brMd,
      borderColor: context.colors.outlineVariant,
      child: Row(
        children: [
          Icon(Icons.wb_sunny_outlined, size: 20),
          UIConstants.mediumWidth,
          Expanded(
            child: Text(
              Strings.dark_mode.tr(),
              style: context.textTheme.labelLarge?.copyWith(color: context.colors.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
