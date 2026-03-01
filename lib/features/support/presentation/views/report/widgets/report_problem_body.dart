import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/features/support/presentation/cubits/report/support_report_cubit.dart';

class ReportProblemBody extends StatefulWidget {
  const ReportProblemBody({super.key});

  @override
  State<ReportProblemBody> createState() => _ReportProblemBodyState();
}

class _ReportProblemBodyState extends State<ReportProblemBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
          vertical: UIConstants.bigPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.apologize_for_the_issue.tr(),
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colors.primary,
              ),
            ),
            UIConstants.smallHeight,
            Text(
              Strings.please_describe_the_issue.tr(),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            UIConstants.bigHeight,
            Container(
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: context.shapes.brLg,
                border: Border.all(
                  color: context.colors.outlineVariant.withAlphaOpacity(0.4),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FTextField(
                  controller: _controller,
                  maxLines: 8,
                  showLabel: false,
                  hintText: Strings.write_problem_description_placeholder.tr(),
                ),
              ),
            ),
            UIConstants.xbigHeight,
            BlocBuilder<SupportReportCubit, SupportReportState>(
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  submitting: () => true,
                  orElse: () => false,
                );
                return PrimaryButtonWithProgress(
                  text: Strings.send_report.tr(),
                  isLoading: isLoading,
                  onTap: isLoading
                      ? null
                      : () => context.read<SupportReportCubit>().submit(
                          description: _controller.text,
                          subject: Strings.send_your_problem.tr(),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
