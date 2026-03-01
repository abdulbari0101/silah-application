import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class NotMemberSignUp extends StatelessWidget {
  const NotMemberSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Strings.not_a_member.tr(), style: context.textTheme.bodyMedium),

        UIConstants.bigHeight,

        InkWell(
          child: Text(
            Strings.sign_up.tr(),
            style: context.textTheme.titleMedium,
          ),
          onTap: () {
            context.pushNamed(AppRoutes.RegistrationisterWizard.name);
          },
        ),
      ],
    );
  }
}
