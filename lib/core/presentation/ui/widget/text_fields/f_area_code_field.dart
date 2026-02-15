import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class FAreaCodeField extends StatelessWidget {
  final String? selectedCode;
  final VoidCallback? onTap;
  final bool enabled;

  const FAreaCodeField({super.key, this.selectedCode = '+967', this.onTap, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: enabled
              ? context.colors.surfaceContainerLowest
              : context.colors.surfaceContainer.withAlphaOpacity(0.6),
          borderRadius: context.shapes.brMd,
          border: Border.all(color: context.colors.outline, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // AppSvgIcon(assetName: Assets.icons.flags.tr, width: 24, height: 24),
            // AppSvgIcon(assetName: Assets.icons.flags.icYemenFlg, width: 24, height: 24),

            // UIConstants.smallWidth,
            Text(selectedCode ?? '', style: context.textTheme.bodyMedium),
            UIConstants.xsmallWidth,
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
