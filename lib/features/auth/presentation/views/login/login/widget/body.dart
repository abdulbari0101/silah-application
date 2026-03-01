import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/features/auth/presentation/views/shared/widget/auth_curved_scaffold.dart';
import 'package:silah_app/features/auth/presentation/views/shared/widget/auth_footer_link.dart';

import 'form.dart';
import 'welcom_message.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(),
      child: AuthCurvedScaffold(
        header: const LoginWelcomText(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LoginForm(),
            UIConstants.mediumHeight,
            AuthFooterLink(
              leadingText: Strings.no_account_question.tr(),
              actionText: Strings.sign_up_now.tr(),
              onTap: () =>
                  context.pushNamed(AppRoutes.RegistrationisterWizard.name),
            ),
          ],
        ),
      ),
    );
  }
}
