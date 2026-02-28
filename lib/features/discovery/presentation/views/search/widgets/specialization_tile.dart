import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';

class SpecializationTile extends StatelessWidget {
  const SpecializationTile({
    super.key,
    required this.specialization,
    required this.icon,
    this.onTap,
    this.selected = false,
  });

  final LegalSpecializationEntity specialization;
  final IconData icon;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final bg = selected
        ? context.colors.primaryContainer.withAlphaOpacity(0.4)
        : context.colors.surface;
    final border = context.colors.outlineVariant.withAlphaOpacity(0.3);
    final iconColor = selected ? context.colors.primary : context.colors.primary.withAlphaOpacity(0.7);
    final radius = BorderRadius.circular(16);

    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: context.shadowSoft,
      ),
      child: CardButton(
        onTap: onTap,
        color: bg,
        borderColor: border,
        borderRadius: radius,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: context.colors.surface,
                shape: BoxShape.circle,
                border: Border.all(color: border),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            UIConstants.mediumHeight,
            Text(
              specialization.name ?? specialization.code ?? '',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
