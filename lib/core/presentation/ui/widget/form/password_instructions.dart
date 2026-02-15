import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class PasswordInstructions extends StatelessWidget {
  const PasswordInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "• ${Strings.exactly_6_digits.tr()}",
            //   style: context.textTheme.labelMedium!.copyWith(
            //     fontWeight: FontWeight.w500,
            //     color: context.colors.tertiary,
            //   ),
            // ),
            // UIConstants.xsmallHeight,
            Text(
              "• ${Strings.no_repeating_digits.tr()}",
              style: context.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colors.tertiary,
              ),
            ),
            UIConstants.xsmallHeight,
            Text(
              "• ${Strings.no_old_password_reuse.tr()}",
              style: context.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colors.tertiary,
              ),
            ),
            UIConstants.xsmallHeight,
          ],
        ),
      ],
    );
  }
}
