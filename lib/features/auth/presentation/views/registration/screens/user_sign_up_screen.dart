import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';
import 'package:silah_app/features/auth/presentation/blocs/registration/registration_bloc.dart';
import 'package:silah_app/features/auth/presentation/blocs/registration/registration_operation_type.dart';

import '../../shared/widget/auth_footer_link.dart';
import '../widgets/auth_form_scaffold.dart';
import '../widgets/user_sign_up_form.dart';

class UserSignUpScreen extends StatelessWidget {
  const UserSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<RegistrationBloc>()),
        BlocProvider(create: (_) => FormCubit()),
      ],
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationError) {
            DialogService.showErrorDialog(
              context,
              title: Strings.error.tr(),
              desc: state.message,
            );
          }
          if (state is RegistrationStepSuccess &&
              state.operationType == RegistrationOperType.SelfReqComplete) {
            context.goNamed(AppRoutes.home.name);
          }
        },
        child: AuthFormScaffold(
          title: Strings.create_user_account.tr(),
          subtitle: Strings.register_new_user.tr(),
          onBack: () => context.pop(),
          child: Column(
            children: [
              const UserSignUpForm(),
              UIConstants.bigHeight,
              AuthFooterLink(
                leadingText: Strings.already_have_account.tr(),
                actionText: Strings.log_in_now.tr(),
                onTap: () => context.goNamed(AppRoutes.login.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
