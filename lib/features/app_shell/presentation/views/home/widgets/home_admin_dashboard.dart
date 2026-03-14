import 'package:dartz/dartz.dart' show Either;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';
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
  late Stream<List<AdminTaskEntity>> _tasksStream;
  Future<int>? _supportCountFuture;

  @override
  void initState() {
    super.initState();
    _tasksStream = locator<AdminRepository>().watchTasks();
    _supportCountFuture = _loadSupportCount();
  }

  Future<int> _loadSupportCount() async {
    final supportRepository = locator<SupportTicketsRepository>();
    final tickets = _unwrap(await supportRepository.fetchTickets());
    return tickets
        .where(
          (item) =>
              item.status == SupportTicketStatus.open ||
              item.status == SupportTicketStatus.inProgress,
        )
        .length;
  }

  T _unwrap<T>(Either<Failure, T> result) {
    return result.fold(
      (failure) => throw StateError(failure.message),
      (data) => data,
    );
  }

  void _retry() {
    setState(() {
      _tasksStream = locator<AdminRepository>().watchTasks();
      _supportCountFuture = _loadSupportCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: _supportCountFuture,
      builder: (context, supportSnapshot) {
        if (supportSnapshot.connectionState != ConnectionState.done) {
          return const Center(child: ProgressStateWidget());
        }
        if (supportSnapshot.hasError || !supportSnapshot.hasData) {
          return CustomeErrorWidget(
            message:
                supportSnapshot.error?.toString() ??
                Strings.unexpected_error.tr(),
            onRetry: _retry,
          );
        }

        return StreamBuilder<List<AdminTaskEntity>>(
          stream: _tasksStream,
          builder: (context, tasksSnapshot) {
            if (tasksSnapshot.connectionState == ConnectionState.waiting &&
                !tasksSnapshot.hasData) {
              return const Center(child: ProgressStateWidget());
            }
            if (tasksSnapshot.hasError) {
              return CustomeErrorWidget(
                message:
                    tasksSnapshot.error?.toString() ??
                    Strings.unexpected_error.tr(),
                onRetry: _retry,
              );
            }

            final tasks = tasksSnapshot.data ?? const <AdminTaskEntity>[];
            final actionableTaskCount = tasks
                .where(
                  (item) =>
                      item.status == AdminTaskStatus.pending ||
                      item.status == AdminTaskStatus.inReview,
                )
                .length;
            final previewTasks = tasks.take(2).toList(growable: false);

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
                        count: actionableTaskCount,
                        onTap: () => context.openRoute(AppRoutes.adminTasks),
                      ),
                    ),
                    UIConstants.mediumWidth,
                    Expanded(
                      child: _AdminMetricCard(
                        title: Strings.support.tr(),
                        count: supportSnapshot.data!,
                        onTap: () =>
                            context.openRoute(AppRoutes.supportTickets),
                      ),
                    ),
                  ],
                ),
                UIConstants.mediumHeight,
              
                Text(
                  Strings.admin_tasks.tr(),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIConstants.smallHeight,
                if (previewTasks.isEmpty)
                  _AdminEmptyCard(
                    onTap: () => context.openRoute(AppRoutes.adminTasks),
                  )
                else
                  ...previewTasks.map(
                    (task) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: UIConstants.smallPadding,
                      ),
                      child: AdminTaskCard(
                        task: task,
                        onTap: () => context.pushNamed(
                          AppRoutes.adminTaskDetails.name,
                          extra: AdminTaskDetailsArgs(task: task).toJson(),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
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
