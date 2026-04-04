import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/ui/theme/brightness_utils.dart';

import '../../../widget/buttons/primary_button.dart';

class IOSThemeSettingDialog extends StatefulWidget {
  const IOSThemeSettingDialog({super.key});

  @override
  State<IOSThemeSettingDialog> createState() => _IOSThemeSettingDialogState();
}

class _IOSThemeSettingDialogState extends State<IOSThemeSettingDialog> {
  late bool isSystemThemeSelected;
  @override
  void initState() {
    super.initState();
    isSystemThemeSelected = context.isSystemTheme;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        Strings.theme_setting.tr(),
        style: context.textTheme.bodyMedium!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: context.colors.blackOrWhite.withAlphaOpacity(0.9),
        ),
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, //
          children: [
            buildThemeOption(
              onTap: () {
                setState(() {
                  isSystemThemeSelected = true;
                });
              },
              title: Strings.system_theme_title.tr(),
              subtitle: Strings.system_theme_subtitle.tr(),
              selected: isSystemThemeSelected,
            ),
            buildThemeOption(
              onTap: () {
                setState(() {
                  isSystemThemeSelected = false;
                });
              },
              title: Strings.app_theme_title.tr(),
              subtitle: Strings.app_theme_subtitle.tr(),
              selected: !isSystemThemeSelected,
            ),
            UIConstants.bigHeight,
            PrimaryButton(
              text: Strings.save.tr(),
              onTap: () {
                Navigator.pop(context);

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
              },
            ),
          ],
        ),
      ),
    );
  }

  buildThemeOption({
    required Function() onTap,
    required String title,
    required String subtitle,
    required bool selected,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      splashColor: context.colors.primary,
      minLeadingWidth: 16,
      leading: Container(
        decoration: BoxDecoration(
          color: selected ? context.colors.primary : null,
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? context.colors.primary : context.colors.outline,
            width: 2.0,
          ),
        ),
        padding: const EdgeInsets.all(3),
        child: selected
            ? Icon(Icons.check, size: 15, color: context.colors.onPrimary)
            : const SizedBox(width: 15, height: 15),
      ),
      onTap: onTap,
      selectedColor: context.colors.primary,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: Text(
        subtitle,
        style: context.textTheme.bodySmall!.copyWith(fontSize: 10),
      ),
      selected: selected,
    );
  }
}
