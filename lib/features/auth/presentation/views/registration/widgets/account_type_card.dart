import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';

class AccountTypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const AccountTypeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CardButton(
      onTap: onTap,
      color: context.colors.surface,
      borderColor: context.colors.outlineVariant,
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.mediumPadding,
        vertical: UIConstants.mediumPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.colors.primaryContainer,
              borderRadius: context.shapes.brMd,
            ),
            child: Icon(icon, color: context.colors.onPrimaryContainer),
          ),
          UIConstants.mediumWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.titleMedium?.primary(context)),
                UIConstants.smallHeight,
                Text(
                  subtitle,
                  style: context.textTheme.bodySmall?.onSurfaceVariant(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
