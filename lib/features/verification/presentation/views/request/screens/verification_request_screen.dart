import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/verification/presentation/cubits/request/verification_request_cubit.dart';
import 'package:silah_app/features/verification/presentation/views/request/widgets/verification_request_body.dart';

class VerificationRequestScreen extends StatelessWidget {
  const VerificationRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerificationRequestCubit(repository: locator()),
      child: BlocListener<VerificationRequestCubit, VerificationRequestState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (_) {
              Toasts.success(context, Strings.send_verification.tr());
              context.pop(true);
            },
            failure: (message) => Toasts.error(context, message),
          );
        },
        child: PlatformScreenWrapper(
          title: Strings.request_verification.tr(),
          body: const VerificationRequestBody(),
        ),
      ),
    );
  }
}
