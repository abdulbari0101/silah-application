import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/screen/success/helper/success_screen_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/auth/presentation/cubits/forgot_password/forgot_password_cubit.dart';
import 'package:silah_app/features/auth/presentation/views/forgot_password/widgets/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(repository: locator()),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              context.goNamed(
                AppRoutes.success.name,
                extra: {
                  SuccessScreenKeys.title: Strings.msg_reset_password_done.tr(),
                  SuccessScreenKeys.subtitle: Strings.msg_reset_success.tr(),
                  SuccessScreenKeys.primaryButtonLabel: Strings.login.tr(),
                  SuccessScreenKeys.onPrimaryRoute: AppRoutes.login.name,
                },
              );
            },
            failure: (message) => Toasts.error(context, message),
          );
        },
        child: PlatformScreenWrapper(
          title: Strings.reset_password.tr(),
          body: const ForgotPasswordBody(),
        ),
      ),
    );
  }
}
