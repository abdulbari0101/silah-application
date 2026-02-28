import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: Strings.search_for_lawyer_or_specialization.tr(),
            hintStyle:
                context.textTheme.bodySmall?.copyWith(color: context.colors.onSurfaceVariant),
            prefixIcon: Icon(Icons.search, color: context.colors.onSurfaceVariant),
            filled: true,
            fillColor: context.colors.surfaceContainerHighest.withAlphaOpacity(0.4),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: UIConstants.mediumPadding,
              vertical: UIConstants.smallPadding,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
