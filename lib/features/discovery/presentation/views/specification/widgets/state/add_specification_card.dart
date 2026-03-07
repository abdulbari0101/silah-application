import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';

class AddSpecificationCard extends StatelessWidget {
  const AddSpecificationCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CardButton(
      onTap: onTap,
      borderRadius: context.shapes.brLg,
      borderColor: context.colors.outlineVariant.withAlphaOpacity(0.4),
      color: context.colors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_circle_outline,
            color: context.colors.primary,
            size: 24,
          ),
          UIConstants.smallHeight,
          Text(
            'Add specialization',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
