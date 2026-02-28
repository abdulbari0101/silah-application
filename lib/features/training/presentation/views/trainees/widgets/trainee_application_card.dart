import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/actions/action_row.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/presentation/cubits/trainees/trainees_cubit.dart';

class TraineeApplicationCard extends StatelessWidget {
  const TraineeApplicationCard({
    super.key,
    required this.application,
    required this.isUpdating,
  });

  final TrainingApplicationEntity application;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    final name = application.fullName?.trim().isNotEmpty == true
        ? application.fullName!.trim()
        : Strings.user.tr();
    final university = application.university?.trim();
    final city = application.city?.trim();
    final submittedAt = application.submittedAt?.trim();

    final statusLabel = _statusLabel(application.status, context);
    final statusColor = _statusColor(application.status, context);

    final actions = <Widget>[];
    if (application.status == TrainingApplicationStatus.pending) {
      actions.add(
        SecondaryButton(
          text: Strings.action_reject.tr(),
          onTap: isUpdating
              ? null
              : () => _confirmAction(
                    context,
                    message: Strings.confirm_reject_application.tr(),
                    onConfirm: () => context
                        .read<TraineesCubit>()
                        .updateStatus(application.id ?? '', TrainingApplicationStatus.rejected),
                  ),
          isDisabled: isUpdating,
        ),
      );
      actions.add(
        PrimaryButton(
          text: Strings.action_accept.tr(),
          onTap: isUpdating
              ? null
              : () => _confirmAction(
                    context,
                    message: Strings.confirm_accept_application.tr(),
                    onConfirm: () => context
                        .read<TraineesCubit>()
                        .updateStatus(application.id ?? '', TrainingApplicationStatus.accepted),
                  ),
          isDisabled: isUpdating,
        ),
      );
    }

    return CustomCard(
      innerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: context.textTheme.titleSmall,
                ),
              ),
              StatusChip(label: statusLabel, color: statusColor),
            ],
          ),
          if (university != null && university.isNotEmpty) ...[
            UIConstants.smallHeight,
            Text(
              '${Strings.label_university.tr()}: $university',
              style: context.textTheme.bodySmall,
            ),
          ],
          if (city != null && city.isNotEmpty) ...[
            UIConstants.smallHeight,
            Text(
              '${Strings.label_city.tr()}: $city',
              style: context.textTheme.bodySmall,
            ),
          ],
          if (submittedAt != null && submittedAt.isNotEmpty) ...[
            UIConstants.smallHeight,
            Text(
              submittedAt,
              style: context.textTheme.labelSmall?.onSurfaceVariant(context),
            ),
          ],
          if (actions.isNotEmpty) ...[
            UIConstants.mediumHeight,
            ActionRow(actions: actions),
          ],
        ],
      ),
    );
  }

  Future<void> _confirmAction(
    BuildContext context, {
    required String message,
    required VoidCallback onConfirm,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Strings.confirm_action_title.tr()),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(Strings.action_cancel.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(Strings.action_confirm.tr()),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      onConfirm();
    }
  }

  String _statusLabel(TrainingApplicationStatus status, BuildContext context) {
    switch (status) {
      case TrainingApplicationStatus.pending:
        return Strings.status_pending.tr();
      case TrainingApplicationStatus.accepted:
        return Strings.status_accepted.tr();
      case TrainingApplicationStatus.rejected:
        return Strings.status_rejected.tr();
      case TrainingApplicationStatus.cancelled:
        return Strings.status_cancelled.tr();
    }
  }

  Color _statusColor(TrainingApplicationStatus status, BuildContext context) {
    switch (status) {
      case TrainingApplicationStatus.pending:
        return context.semantic.warning;
      case TrainingApplicationStatus.accepted:
        return context.semantic.success;
      case TrainingApplicationStatus.rejected:
        return context.colors.error;
      case TrainingApplicationStatus.cancelled:
        return context.colors.outlineVariant;
    }
  }
}
