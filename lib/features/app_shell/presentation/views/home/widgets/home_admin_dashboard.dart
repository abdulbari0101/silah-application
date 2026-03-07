import 'package:dartz/dartz.dart' show Either;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_status.dart';
import 'package:silah_app/features/admin/domain/repositories/admin_repository.dart';
import 'package:silah_app/features/admin/presentation/views/details/models/admin_task_details_args.dart';
import 'package:silah_app/features/admin/presentation/views/tasks/widgets/admin_task_card.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_status.dart';
import 'package:silah_app/features/support/domain/repositories/support_tickets_repository.dart';

class HomeAdminDashboard extends StatefulWidget {
  const HomeAdminDashboard({super.key});

  @override
  State<HomeAdminDashboard> createState() => _HomeAdminDashboardState();
}

class _HomeAdminDashboardState extends State<HomeAdminDashboard> {
  Future<_AdminHomeSnapshot>? _future;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _future ??= _loadSnapshot();
  }

  Future<_AdminHomeSnapshot> _loadSnapshot() async {
    final adminRepository = locator<AdminRepository>();
    final supportRepository = locator<SupportTicketsRepository>();

    final tasks = _unwrap(await adminRepository.fetchPendingTasks());
    final tickets = _unwrap(await supportRepository.fetchTickets());

    final actionableTasks = tasks
        .where(
          (item) =>
              item.status == AdminTaskStatus.pending ||
              item.status == AdminTaskStatus.inReview,
        )
        .toList();

    final openReports = tickets
        .where(
          (item) =>
              item.status == SupportTicketStatus.open ||
              item.status == SupportTicketStatus.inProgress,
        )
        .length;

    return _AdminHomeSnapshot(
      actionableTaskCount: actionableTasks.length,
      openSupportCount: openReports,
      tasks: tasks.take(2).toList(),
    );
  }

  T _unwrap<T>(Either<Failure, T> result) {
    return result.fold(
      (failure) => throw StateError(failure.message),
      (data) => data,
    );
  }

  void _retry() {
    setState(() {
      _future = _loadSnapshot();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_AdminHomeSnapshot>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: ProgressStateWidget());
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return CustomeErrorWidget(
            message:
                snapshot.error?.toString() ?? Strings.unexpected_error.tr(),
            onRetry: _retry,
          );
        }

        final data = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              Strings.today_summary.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            UIConstants.smallHeight,
            Row(
              children: [
                Expanded(
                  child: _AdminMetricCard(
                    title: Strings.admin_tasks.tr(),
                    count: data.actionableTaskCount,
                    onTap: () => context.pushNamed(AppRoutes.adminTasks.name),
                  ),
                ),
                UIConstants.mediumWidth,
                Expanded(
                  child: _AdminMetricCard(
                    title: Strings.support.tr(),
                    count: data.openSupportCount,
                    onTap: () =>
                        context.pushNamed(AppRoutes.supportTickets.name),
                  ),
                ),
              ],
            ),
            UIConstants.mediumHeight,
            _AdminLinkCard(
              title: Strings.specializations.tr(),
              subtitle: Strings.manage_consultations_clients_and_training.tr(),
              onTap: () => context.pushNamed(AppRoutes.specifications.name),
            ),
            UIConstants.xbigHeight,
            Text(
              Strings.admin_tasks.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            UIConstants.smallHeight,
            if (data.tasks.isEmpty)
              _AdminEmptyCard(
                onTap: () => context.pushNamed(AppRoutes.adminTasks.name),
              )
            else
              ...data.tasks.map(
                (task) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: UIConstants.smallPadding,
                  ),
                  child: AdminTaskCard(
                    task: task,
                    onTap: () => context.pushNamed(
                      AppRoutes.adminTaskDetails.name,
                      extra: AdminTaskDetailsArgs(task: task),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _AdminHomeSnapshot {
  const _AdminHomeSnapshot({
    required this.actionableTaskCount,
    required this.openSupportCount,
    required this.tasks,
  });

  final int actionableTaskCount;
  final int openSupportCount;
  final List<AdminTaskEntity> tasks;
}

class _AdminMetricCard extends StatelessWidget {
  const _AdminMetricCard({
    required this.title,
    required this.count,
    required this.onTap,
  });

  final String title;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(22),
          boxShadow: context.shadowSoft,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            UIConstants.mediumHeight,
            Text(
              count.toString(),
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminLinkCard extends StatelessWidget {
  const _AdminLinkCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
          boxShadow: context.shadowSoft,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            UIConstants.smallHeight,
            Text(
              subtitle,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminEmptyCard extends StatelessWidget {
  const _AdminEmptyCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          Strings.no_data_to_display.tr(),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
