import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class ResendTimer extends StatelessWidget {
  final int secondsRemaining;

  const ResendTimer({super.key, required this.secondsRemaining});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
      child: ClipRRect(
        borderRadius: context.shapes.brSm,
        child: Container(
          width: 110,
          height: 70,
          color: context.colors.outline,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Strings.tv_remaining.tr(),
                style: context.textTheme.bodyMedium,
              ),

              UIConstants.smallHeight,
              Text(
                '$secondsRemaining s',
                style: context.textTheme.labelLarge!.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
