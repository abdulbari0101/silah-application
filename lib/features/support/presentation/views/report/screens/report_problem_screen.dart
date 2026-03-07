import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/support/presentation/cubits/report/support_report_cubit.dart';
import 'package:silah_app/features/support/presentation/views/report/widgets/report_problem_body.dart';

class ReportProblemScreen extends StatelessWidget {
  const ReportProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SupportReportCubit(repository: locator()),
      child: BlocListener<SupportReportCubit, SupportReportState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (_) => context.pop(true),
            failure: (message) => Toasts.error(context, message),
          );
        },
        child: PlatformScreenWrapper(
          title: Strings.support.tr(),
          body: const ReportProblemBody(),
        ),
      ),
    );
  }
}
