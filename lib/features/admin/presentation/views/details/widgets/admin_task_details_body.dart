import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/core/presentation/ui/widget/text/labeled_value_row.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_status.dart';
import 'package:silah_app/features/admin/presentation/cubits/details/admin_task_details_cubit.dart';

class AdminTaskDetailsBody extends StatelessWidget {
  const AdminTaskDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminTaskDetailsCubit, AdminTaskDetailsState>(
      builder: (context, state) {
        return state.when(
          ready: (task, isUpdating) =>
              _buildContent(context, task, isUpdating: isUpdating),
          failure: (message, task) {
            if (task == null) {
              return Center(child: Text(message));
            }
            return _buildContent(
              context,
              task,
              isUpdating: false,
              errorMessage: message,
            );
          },
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    AdminTaskEntity task, {
    required bool isUpdating,
    String? errorMessage,
  }) {
    final statusLabel = _statusLabel(context, task.status);
    final statusColor = _statusColor(context, task.status);

    final actions = <Widget>[];
    if (task.status == AdminTaskStatus.pending ||
        task.status == AdminTaskStatus.inReview) {
      actions.add(
        SecondaryButton(
          text: Strings.action_reject.tr(),
          onTap: isUpdating
              ? null
              : () => _confirmAction(
                  context,
                  message: Strings.confirm_reject_request.tr(),
                  onConfirm: () => context
                      .read<AdminTaskDetailsCubit>()
                      .updateStatus(AdminTaskStatus.rejected),
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
                  message: Strings.confirm_accept_request.tr(),
                  onConfirm: () => context
                      .read<AdminTaskDetailsCubit>()
                      .updateStatus(AdminTaskStatus.approved),
                ),
          isDisabled: isUpdating,
        ),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
          vertical: UIConstants.bigPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(
              innerWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          task.type ?? Strings.admin_tasks.tr(),
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                      StatusChip(label: statusLabel, color: statusColor),
                    ],
                  ),
                  if ((task.targetId ?? '').isNotEmpty) ...[
                    UIConstants.smallHeight,
                    LabeledValueRow(
                      label: Strings.reference_number.tr(),
                      value: task.targetId!,
                      labelSuffix: ':',
                      labelStyle: context.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      valueStyle: context.textTheme.labelSmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if ((task.notes ?? '').isNotEmpty) ...[
                    UIConstants.smallHeight,
                    Text(task.notes!, style: context.textTheme.bodySmall),
                  ],
                  if ((task.createdAt ?? '').isNotEmpty) ...[
                    UIConstants.mediumHeight,
                    LabeledValueRow(
                      label: Strings.created_at.tr(),
                      value: task.createdAt!,
                      labelSuffix: ':',
                      labelStyle: context.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      valueStyle: context.textTheme.labelSmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (actions.isNotEmpty) ...[
              UIConstants.mediumHeight,
              Row(
                children: actions
                    .map(
                      (action) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: action,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            if (errorMessage != null) ...[
              UIConstants.mediumHeight,
              Text(
                errorMessage,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.error,
                ),
              ),
            ],
          ],
        ),
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

  String _statusLabel(BuildContext context, AdminTaskStatus status) {
    switch (status) {
      case AdminTaskStatus.pending:
        return Strings.status_pending.tr();
      case AdminTaskStatus.inReview:
        return Strings.status_in_review.tr();
      case AdminTaskStatus.approved:
        return Strings.status_approved.tr();
      case AdminTaskStatus.rejected:
        return Strings.status_rejected.tr();
    }
  }

  Color _statusColor(BuildContext context, AdminTaskStatus status) {
    switch (status) {
      case AdminTaskStatus.pending:
        return context.semantic.warning;
      case AdminTaskStatus.inReview:
        return context.semantic.info;
      case AdminTaskStatus.approved:
        return context.semantic.success;
      case AdminTaskStatus.rejected:
        return context.colors.error;
    }
  }
}
