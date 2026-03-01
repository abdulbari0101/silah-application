import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class ForgetPasswordField extends StatelessWidget {
  const ForgetPasswordField({super.key});

  void _handleTap(BuildContext context) {
    context.pushNamed(AppRoutes.changePassword.name);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: context.colors.primary,
      onTap: () => _handleTap(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            Strings.forgot_password_question.tr(),
            style: context.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
