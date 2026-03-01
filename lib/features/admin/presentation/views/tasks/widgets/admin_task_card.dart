import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_status.dart';

class AdminTaskCard extends StatelessWidget {
  const AdminTaskCard({super.key, required this.task, this.onTap});

  final AdminTaskEntity task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final title = task.type?.trim();
    final notes = task.notes?.trim();

    return InkWell(
      onTap: onTap,
      borderRadius: context.shapes.brLg,
      child: CustomCard(
        innerWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title?.isNotEmpty == true
                        ? title!
                        : Strings.admin_tasks.tr(),
                    style: context.textTheme.titleSmall,
                  ),
                ),
                StatusChip(
                  label: _statusLabel(context, task.status),
                  color: _statusColor(context, task.status),
                ),
              ],
            ),
            if (notes != null && notes.isNotEmpty) ...[
              UIConstants.smallHeight,
              Text(
                notes,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if ((task.createdAt ?? '').isNotEmpty) ...[
              UIConstants.smallHeight,
              Text(
                task.createdAt!,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
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
