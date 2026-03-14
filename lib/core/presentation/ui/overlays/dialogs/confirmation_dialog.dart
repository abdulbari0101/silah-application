import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';

Future<bool> showAppConfirmationDialog(
  BuildContext context, {
  required String message,
  String? title,
  String? confirmLabel,
  String? cancelLabel,
  FintureButtonStyle confirmStyle = FintureButtonStyle.primary,
  IconData? icon,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      final colors = dialogContext.colors;
      final semantic = dialogContext.semantic;
      final resolvedTitle = title ?? Strings.confirm_action_title.tr();
      final resolvedConfirmLabel = confirmLabel ?? Strings.action_confirm.tr();
      final resolvedCancelLabel = cancelLabel ?? Strings.action_cancel.tr();
      final resolvedIcon = icon ?? _defaultIcon(confirmStyle);
      final accent = switch (confirmStyle) {
        FintureButtonStyle.success => semantic.success,
        FintureButtonStyle.danger => colors.error,
        FintureButtonStyle.primary => colors.primary,
      };

      return Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
        ),
        shape: RoundedRectangleBorder(borderRadius: dialogContext.shapes.brLg),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(UIConstants.bigPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: accent.withAlpha(24),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(resolvedIcon, color: accent, size: 28),
                ),
                UIConstants.bigHeight,
                Text(
                  resolvedTitle,
                  textAlign: TextAlign.center,
                  style: dialogContext.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIConstants.mediumHeight,
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: dialogContext.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
                UIConstants.xxbigHeight,
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        text: resolvedCancelLabel,
                        onTap: () => Navigator.of(dialogContext).pop(false),
                      ),
                    ),
                    UIConstants.mediumWidth,
                    Expanded(
                      child: PrimaryButton(
                        text: resolvedConfirmLabel,
                        style: confirmStyle,
                        onTap: () => Navigator.of(dialogContext).pop(true),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

  return result ?? false;
}

IconData _defaultIcon(FintureButtonStyle style) {
  return switch (style) {
    FintureButtonStyle.success => Icons.check_circle_outline_rounded,
    FintureButtonStyle.danger => Icons.warning_amber_rounded,
    FintureButtonStyle.primary => Icons.help_outline_rounded,
  };
}
