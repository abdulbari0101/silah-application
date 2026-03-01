import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/arrow_next_icon.dart';

class SettingsItemRow extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback? onTap;

  const SettingsItemRow({
    super.key,
    required this.label,
    this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: UIConstants.mediumPadding,
      ),
      title: Text(label, style: context.textTheme.labelLarge),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null)
            Padding(
              padding: EdgeInsets.only(right: UIConstants.smallPadding),
              child: Text(value!, style: context.textTheme.labelLarge),
            ),
          ArrowNextIcon(size: SizeIcon.SIZE_18),
        ],
      ),
      onTap: onTap,
    );
  }
}
