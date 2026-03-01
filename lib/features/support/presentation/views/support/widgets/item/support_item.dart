import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/gen/assets.gen.dart';

class SupportItem extends StatelessWidget {
  const SupportItem({
    super.key,
    required this.item,
    this.onTap,
    this.enabled = true,
  });

  final SupportTicketEntity item;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final content = CardButton(
      onTap: enabled ? onTap : null,
      borderRadius: context.shapes.brLg,
      borderColor: context.colors.outlineVariant.withAlphaOpacity(0.4),
      color: context.colors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSvgIcon(
            assetName: Assets.icons.mobile,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
            darkDynamicColor: false,
            lightDynamicColor: false,
          ),
          UIConstants.smallHeight,
          Text(
            item.description ?? "",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.labelMedium,
          ),
        ],
      ),
    );

    if (enabled) {
      return content;
    }

    return Opacity(opacity: 0.45, child: content);
  }
}
