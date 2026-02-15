import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';

import '../widgets/auth_form_scaffold.dart';
import '../widgets/lawyer_sign_up_form.dart';

class LawyerSignUpScreen extends StatelessWidget {
  const LawyerSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormCubit(),
      child: AuthFormScaffold(
        title: Strings.licensed_lawyer.tr(),
        subtitle: Strings.provide_legal_services_and_training.tr(),
        onBack: () => context.pop(),
        child: Column(
          children: [
            LawyerSignUpForm(
              onNext: (info) {
                context.pushNamed(AppRoutes.lawyerProfessionalInfo.name, extra: info);
              },
            ),
            UIConstants.bigHeight,
          ],
        ),
      ),
    );
  }
}
