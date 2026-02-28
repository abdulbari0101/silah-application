import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/back_button.dart';

class SpecializationHeader extends StatelessWidget {
  const SpecializationHeader({super.key, this.title, this.icon, this.onBack});

  final String? title;
  final IconData? icon;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final label = title?.trim();
    final hasLabel = label != null && label.isNotEmpty;
    final resolvedIcon = icon ?? Icons.layers;

    return Row(
      children: [
        CustomeBackButton(onPressed: onBack ?? () => context.pop()),
        const Spacer(),
        if (hasLabel)
          Row(
            children: [
              Icon(resolvedIcon, color: context.colors.primary),
              UIConstants.smallWidth,
              Text(
                label,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
