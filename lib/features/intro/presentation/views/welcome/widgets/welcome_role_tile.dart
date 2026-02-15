import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class WelcomeRoleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const WelcomeRoleTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: context.colors.primaryContainer,
            borderRadius: context.shapes.brSm,
          ),
          child: Icon(icon, color: context.colors.primary),
        ),
        UIConstants.mediumWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.textTheme.titleMedium),
              UIConstants.smallHeight,
              Text(
                subtitle,
                style: context.textTheme.bodySmall?.copyWith(height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
