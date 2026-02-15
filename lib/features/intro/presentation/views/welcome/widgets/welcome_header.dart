import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/gen/assets.gen.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.images.silahLogo1.image(width: 160, fit: BoxFit.contain),
        UIConstants.mediumHeight,
        Text(
          Strings.welcome_to_silah_trusted_platform.tr(),
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge?.primary(context),
        ),
        UIConstants.smallHeight,
        Text(
          Strings.silah_helps_you_find_the_right_lawyer.tr(),
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall?.onSurfaceVariant(context),
        ),
      ],
    );
  }
}
