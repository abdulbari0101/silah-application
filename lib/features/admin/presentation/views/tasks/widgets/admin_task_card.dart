import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/presentation/support/admin_task_presenter.dart';

class AdminTaskCard extends StatelessWidget {
  const AdminTaskCard({super.key, required this.task, this.onTap});

  final AdminTaskEntity task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
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
                    AdminTaskPresenter.title(context, task),
                    style: context.textTheme.titleSmall,
                  ),
                ),
                StatusChip(
                  label: AdminTaskPresenter.statusLabel(context, task.status),
                  color: AdminTaskPresenter.statusColor(context, task.status),
                ),
              ],
            ),
            UIConstants.smallHeight,
            Text(
              AdminTaskPresenter.summary(context, task),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
            UIConstants.smallHeight,
            Text(
              '${Strings.reference_number.tr()}: ${AdminTaskPresenter.referenceCode(task)}',
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            if ((task.createdAt ?? '').isNotEmpty) ...[
              UIConstants.smallHeight,
              Text(
                AdminTaskPresenter.formattedCreatedAt(context, task.createdAt),
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
}
