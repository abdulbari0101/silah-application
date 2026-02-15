import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/arrow_next_icon.dart';

class ThemeMenu extends StatelessWidget {
  const ThemeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double iconSize = 22;

    final settingState = context.watch<AppSettingBloc>().state;
    final isSystem = settingState.data.isSystemThemeTheme;
    final isDark = settingState.data.isDarkTheme;

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: context.colors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
      ),
      onPressed: () {
        if (isSystem) {
          DialogService.showThemeSetting(context);
        } else {
          final newTheme = isDark ? AppThemeMode.light : AppThemeMode.dark;
          context.read<AppSettingBloc>().add(
            ChangeThemeEvent(appAppThemeMode: newTheme, fromWhere: "ThemeMenu"),
          );
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.wb_sunny_outlined,
                size: iconSize,
                color: context.themeValue(light: context.colors.primary, dark: Colors.white),
              ),
              const SizedBox(width: 20),
              Expanded(child: Text(Strings.dark_mode.tr(), style: context.textTheme.labelLarge)),
              ArrowNextIcon(size: SizeIcon.SIZE_18),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            width: double.infinity,
            height: 0.1,
            color: context.colors.blackOrWhite.withAlphaOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
