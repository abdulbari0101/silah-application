import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/auth/presentation/cubits/change_password/change_password_cubit.dart';
import 'package:silah_app/features/auth/presentation/views/change_password/widgets/change_password_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangePasswordCubit(repository: locator()),
      child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              Toasts.success(context, Strings.update_password.tr());
              context.pop(true);
            },
            failure: (message) => Toasts.error(context, message),
          );
        },
        child: PlatformScreenWrapper(
          title: Strings.change_password.tr(),
          body: const ChangePasswordBody(),
        ),
      ),
    );
  }
}
