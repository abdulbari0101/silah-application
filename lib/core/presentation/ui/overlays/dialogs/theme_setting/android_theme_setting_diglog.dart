import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/core/presentation/ui/theme/brightness_utils.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';

class AndroidThemeSettingDialog extends StatefulWidget {
  const AndroidThemeSettingDialog({super.key});

  @override
  State<AndroidThemeSettingDialog> createState() => _AndroidThemeSettingDialogState();
}

class _AndroidThemeSettingDialogState extends State<AndroidThemeSettingDialog> {
  late bool isSystemThemeSelected;

  @override
  void initState() {
    super.initState();
    final settingState = context.read<AppSettingBloc>().state;
    isSystemThemeSelected = settingState.data.isSystemThemeTheme;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: context.shapes.roundedLg,
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          Strings.theme_setting.tr(),
          style: context.textTheme.labelLarge!
              .copyWith(fontWeight: FontWeight.w600, color: context.colors.onSurface)
              .copyWith(fontSize: 18),
        ),
      ),
      content: SizedBox(
        width: AppDimension(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ThemeOptionTile(
                title: Strings.system_theme_title.tr(),
                subtitle: Strings.system_theme_subtitle.tr(),
                isSelected: isSystemThemeSelected,
                onTap: () => setState(() => isSystemThemeSelected = true),
              ),
              _ThemeOptionTile(
                title: Strings.app_theme_title.tr(),
                subtitle: Strings.app_theme_subtitle.tr(),
                isSelected: !isSystemThemeSelected,
                onTap: () => setState(() => isSystemThemeSelected = false),
              ),
              UIConstants.bigHeight,
              PrimaryButton(
                text: Strings.save.tr(),
                onTap: _shouldDisableButton(context)
                    ? () {}
                    : () {
                        final appAppThemeMode = isSystemThemeSelected
                            ? AppThemeMode.system
                            : BrightnessUtils.isSystemDark()
                            ? AppThemeMode.dark
                            : AppThemeMode.light;

                        context.read<AppSettingBloc>().add(
                          ChangeThemeEvent(
                            appAppThemeMode: appAppThemeMode,
                            fromWhere: "AndroidThemeSettingDialog",
                          ),
                        );

                        Navigator.pop(context);
                      },
              ),
              UIConstants.bigHeight,
            ],
          ),
        ),
      ),
    );
  }

  bool _shouldDisableButton(BuildContext context) {
    final currentMode = context.read<AppSettingBloc>().state.data.appAppThemeMode;
    final intendedMode = isSystemThemeSelected
        ? AppThemeMode.system
        : BrightnessUtils.isSystemDark()
        ? AppThemeMode.dark
        : AppThemeMode.light;

    return currentMode == intendedMode;
  }
}

class _ThemeOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOptionTile({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      splashColor: context.colors.primary,
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? context.colors.primary : null,
          border: Border.all(
            color: isSelected ? context.colors.primary : context.colors.outline,
            width: 2,
          ),
        ),
        child: isSelected
            ? Icon(Icons.check, size: 16, color: context.colors.onPrimary)
            : const SizedBox(width: 16, height: 16),
      ),
      title: Text(
        title,
        style: context.textTheme.labelLarge!
            .copyWith(fontWeight: FontWeight.w600, color: context.colors.onSurface)
            .copyWith(fontSize: 15),
      ),
      subtitle: Text(
        subtitle,
        style: context.textTheme.bodySmall!
            .copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: context.colors.onSurfaceVariant,
            )
            .copyWith(fontSize: 11),
      ),
    );
  }
}
