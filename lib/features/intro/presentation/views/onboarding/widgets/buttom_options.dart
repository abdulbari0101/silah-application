import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';

import '../../../../../../core/config/localization/localizations_string_keys.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(mainAxisSize: MainAxisSize.min, children: [_buildLoginButton(context)]),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SecondaryButton(
      text: Strings.login.tr(),
      onTap: () {
        // Handle login tap
        context.goTo(AppRoutes.login);
      },
    );
  }
}
