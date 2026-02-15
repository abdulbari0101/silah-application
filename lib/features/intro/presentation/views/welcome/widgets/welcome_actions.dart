import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/link_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';

class WelcomeActions extends StatelessWidget {
  const WelcomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          text: Strings.start_now.tr(),
          onTap: () => context.pushNamed(AppRoutes.selfRegisterWizard.name),
        ),
        UIConstants.mediumHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.already_have_account.tr(),
              style: context.textTheme.bodySmall?.onSurfaceVariant(context),
            ),
            UIConstants.smallWidth,
            LinkButton(
              text: Strings.log_in_now.tr(),
              onTap: () => context.pushNamed(AppRoutes.login.name),
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ],
    );
  }
}
