import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/config/router/global_navigator.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/consultations/presentation/cubits/create_request/consultation_request_cubit.dart';
import 'package:silah_app/features/consultations/presentation/views/create_request/models/consultation_request_args.dart';
import 'package:silah_app/features/consultations/presentation/views/create_request/widgets/consultation_request_body.dart';

class ConsultationRequestScreen extends StatelessWidget {
  const ConsultationRequestScreen({super.key, required this.args});

  final ConsultationRequestArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConsultationRequestCubit(repository: locator()),
      child: BlocListener<ConsultationRequestCubit, ConsultationRequestState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (_) {
              final rootContext = rootNavigatorKey.currentContext;
              Navigator.of(context).pop(true);
              if (rootContext != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Toasts.success(rootContext, Strings.sent_successfully.tr());
                });
              }
            },
            failure: (message) => Toasts.error(context, message),
          );
        },
        child: PlatformScreenWrapper(
          title: Strings.request_consultation.tr(),
          body: ConsultationRequestBody(args: args),
        ),
      ),
    );
  }
}
