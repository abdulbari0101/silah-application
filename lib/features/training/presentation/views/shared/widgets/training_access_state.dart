import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

class TrainingAccessState extends StatelessWidget {
  const TrainingAccessState({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIConstants.screenHorizantalPadding,
            vertical: UIConstants.bigPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSvgIcon(
                assetName: Assets.icons.logo.logoSvg,
                width: 150,
                height: 120,
                darkDynamicColor: false,
                lightDynamicColor: false,
              ),
              UIConstants.bigHeight,
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: context.colors.primary,
                ),
              ),
              UIConstants.mediumHeight,
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              if (onAction != null) ...[
                UIConstants.xbigHeight,
                PrimaryButton(
                  text: actionLabel ?? Strings.settings.tr(),
                  onTap: onAction,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
