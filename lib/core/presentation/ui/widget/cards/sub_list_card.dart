import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

import '../../../../config/constants/ui_constants.dart';

class SubListCard extends StatelessWidget {
  const SubListCard({
    super.key,
    required this.childList,
    required this.title,
    this.onMoreTap,
    this.moreText,
  });

  final Widget childList;
  final String title;
  final String? moreText;

  final void Function()? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.smallPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: context.textTheme.titleSmall),

                if (onMoreTap != null) ...[
                  TextButton(
                    onPressed: onMoreTap,
                    child: Text(
                      moreText ?? Strings.view_all.tr(),
                      style: context.textTheme.titleSmall?.primary(context),
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 4),
            Expanded(
              child: Card(elevation: 0, shape: context.shapes.roundedLg, child: childList),
            ),
          ],
        ),
      ),
    );
  }
}
