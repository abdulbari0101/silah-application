import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.moreTap,
    this.moreText,
  });
  final GestureTapCallback? moreTap;
  final String? moreText;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.titleMedium),
        if (moreTap != null)
          GestureDetector(
            onTap: moreTap,
            child: Row(
              children: [
                Text(
                  moreText ?? Strings.see_more.tr(),
                  style: context.textTheme.labelSmall!.semiBold.primary(
                    context,
                  ),
                ),
                Icon(Icons.navigate_next, size: 16),
              ],
            ),
          )
        else
          Container(),
      ],
    );
  }
}
