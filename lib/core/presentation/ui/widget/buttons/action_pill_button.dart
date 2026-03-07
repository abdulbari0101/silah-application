import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class ActionPillButton extends StatelessWidget {
  const ActionPillButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.foregroundColor,
    this.expand = false,
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    final background =
        backgroundColor ??
        (enabled
            ? context.colors.primary
            : context.colors.primary.withAlphaOpacity(0.2));
    final foreground =
        foregroundColor ??
        (enabled
            ? context.colors.onPrimary
            : context.colors.onSurfaceVariant.withAlphaOpacity(0.6));

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          width: expand ? double.infinity : null,
          height: UIConstants.smallButtonHeight,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: expand
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Icon(icon, size: 16, color: foreground),
              UIConstants.xsmallWidth,
              Flexible(
                child: Text(
                  text,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: foreground,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
