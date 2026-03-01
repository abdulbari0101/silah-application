import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.height,
    this.width,
    this.title,
    this.subtitle,
    this.retryWidget,
    this.icon,
  });

  final double? height;
  final double? width;
  final Widget? retryWidget;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final iconSize = width ?? 96;
    final bodyHeight = height ?? AppDimension(context).height / 2;
    return Container(
      constraints: BoxConstraints(minHeight: bodyHeight),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon ?? Icons.inbox_outlined,
            size: iconSize,
            color: context.colors.onSurfaceVariant.withAlphaOpacity(0.5),
          ),
          UIConstants.mediumHeight,
          Text(
            title ?? Strings.no_data_to_display.tr(),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          if (subtitle != null && subtitle!.trim().isNotEmpty) ...[
            UIConstants.xsmallHeight,
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
          if (retryWidget != null) ...[UIConstants.mediumHeight, retryWidget!],
        ],
      ),
    );
  }
}
