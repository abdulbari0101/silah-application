import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/controls/app_segmented_control.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/presentation/cubits/requests/consultation_requests_cubit.dart';
import 'package:silah_app/features/consultations/presentation/views/details/models/consultation_request_details_args.dart';
import 'package:silah_app/features/consultations/presentation/views/requests/widgets/request_card.dart';
import 'package:go_router/go_router.dart';

import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/foundation/formatting/relative_time.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/presentation/cubits/application/trainee_applications_cubit.dart';
import 'package:silah_app/features/training/presentation/views/application_details/models/training_application_details_args.dart';

enum RequestCategory { consultation, training }

class RequestsBody extends StatefulWidget {
  const RequestsBody({super.key});

  @override
  State<RequestsBody> createState() => _RequestsBodyState();
}

class _RequestsBodyState extends State<RequestsBody> {
  RequestCategory _category = RequestCategory.consultation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        child: Column(
          children: [
            Row(
              children: [
                _buildCategoryTab(
                  label: Strings.consultation_requests.tr(),
                  icon: Icons.gavel_outlined,
                  isSelected: _category == RequestCategory.consultation,
                  onTap: () => setState(() => _category = RequestCategory.consultation),
                ),
                UIConstants.mediumWidth,
                _buildCategoryTab(
                  label: Strings.training_requests.tr(),
                  icon: Icons.school_outlined,
                  isSelected: _category == RequestCategory.training,
                  onTap: () => setState(() => _category = RequestCategory.training),
                ),
              ],
            ),
            UIConstants.mediumHeight,
            if (_category == RequestCategory.consultation) ...[
              _StatusFilter(),
              UIConstants.mediumHeight,
            ],
            Expanded(
              child: _category == RequestCategory.consultation
                  ? _buildConsultationsList(context)
                  : _buildTrainingList(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsultationsList(BuildContext context) {
    return BlocBuilder<ConsultationRequestsCubit, ConsultationRequestsState>(
      builder: (context, state) {
        return state.when(
          initial: (_) => const Center(child: ProgressStateWidget()),
          loading: (_) => const Center(child: ProgressStateWidget()),
          empty: (_) => EmptyWidget(
            retryWidget: PrimaryButton(
              text: Strings.try_again.tr(),
              onTap: () => context.read<ConsultationRequestsCubit>().load(),
            ),
          ),
          error: (_, message) => CustomeErrorWidget(
            message: message,
            onRetry: () => context.read<ConsultationRequestsCubit>().load(),
          ),
          loaded: (filter, requests, updatingId) {
            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: requests.length,
              separatorBuilder: (_, __) => UIConstants.smallHeight,
              itemBuilder: (context, index) {
                final request = requests[index];
                return RequestCard(
                  request: request,
                  onTap: () async {
                    await context.pushNamed(
                      AppRoutes.consultationDetails.name,
                      extra: ConsultationRequestDetailsArgs(
                        request: request,
                      ),
                    );
                    if (context.mounted) {
                      context.read<ConsultationRequestsCubit>().load();
                    }
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildTrainingList(BuildContext context) {
    return BlocBuilder<TraineeApplicationsCubit, TraineeApplicationsState>(
      builder: (context, state) {
        if (state is TraineeApplicationsInitial || state is TraineeApplicationsLoading) {
          return const Center(child: ProgressStateWidget());
        }
        if (state is TraineeApplicationsError) {
          return CustomeErrorWidget(
            message: state.message,
            onRetry: () => context.read<TraineeApplicationsCubit>().load(),
          );
        }
        if (state is TraineeApplicationsEmpty) {
          return EmptyWidget(
            retryWidget: PrimaryButton(
              text: Strings.try_again.tr(),
              onTap: () => context.read<TraineeApplicationsCubit>().load(),
            ),
          );
        }
        if (state is TraineeApplicationsLoaded) {
          final applications = state.applications;
          return ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: applications.length,
            separatorBuilder: (_, __) => UIConstants.smallHeight,
            itemBuilder: (context, index) {
              final application = applications[index];
              return _TraineeApplicationRequestCard(
                application: application,
                onTap: () async {
                  await context.pushNamed(
                    AppRoutes.trainingApplicationDetails.name,
                    extra: TrainingApplicationDetailsArgs(
                      application: application,
                    ),
                  );
                  if (context.mounted) {
                    context.read<TraineeApplicationsCubit>().load();
                  }
                },
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildCategoryTab({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colors.primary.withValues(alpha: 0.1)
                : context.colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? context.colors.primary
                  : context.colors.outlineVariant.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? context.colors.primary : context.colors.onSurfaceVariant,
                size: 20,
              ),
              UIConstants.smallWidth,
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: isSelected ? context.colors.primary : context.colors.onSurfaceVariant,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConsultationRequestsCubit, ConsultationRequestsState>(
      builder: (context, state) {
        final selected = state.maybeWhen(
          initial: (filter) => filter,
          loading: (filter) => filter,
          empty: (filter) => filter,
          error: (filter, _) => filter,
          loaded: (filter, _, __) => filter,
          orElse: () => ConsultationStatus.pending,
        );

        return AppSegmentedControl<ConsultationStatus>(
          value: selected,
          onChanged: (value) =>
              context.read<ConsultationRequestsCubit>().setFilter(value),
          items: [
            SegmentedItem(
              value: ConsultationStatus.pending,
              label: Strings.requests_new.tr(),
            ),
            SegmentedItem(
              value: ConsultationStatus.accepted,
              label: Strings.requests_in_progress.tr(),
            ),
            SegmentedItem(
              value: ConsultationStatus.closed,
              label: Strings.requests_completed.tr(),
            ),
          ],
        );
      },
    );
  }
}

class _TraineeApplicationRequestCard extends StatelessWidget {
  final TrainingApplicationEntity application;
  final VoidCallback? onTap;

  const _TraineeApplicationRequestCard({
    required this.application,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final university = application.university?.trim();
    final faculty = application.faculty?.trim();
    final submittedAt = formatRelativeTime(context, application.submittedAt);
    final arrowIcon = context.isRTL ? Icons.arrow_back : Icons.arrow_forward;

    String statusLabel = '';
    Color statusColor = Colors.grey;
    IconData statusIcon = Icons.hourglass_empty;

    switch (application.status) {
      case TrainingApplicationStatus.pending:
        statusLabel = Strings.status_pending.tr();
        statusColor = context.semantic.warning;
        statusIcon = Icons.hourglass_empty;
        break;
      case TrainingApplicationStatus.accepted:
        statusLabel = Strings.status_accepted.tr();
        statusColor = context.semantic.success;
        statusIcon = Icons.check_circle_outline;
        break;
      case TrainingApplicationStatus.rejected:
        statusLabel = Strings.status_rejected.tr();
        statusColor = context.colors.error;
        statusIcon = Icons.cancel_outlined;
        break;
      case TrainingApplicationStatus.cancelled:
        statusLabel = Strings.status_cancelled.tr();
        statusColor = context.colors.outlineVariant;
        statusIcon = Icons.remove_circle_outline;
        break;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (submittedAt.isNotEmpty) ...[
              Text(
                submittedAt,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              UIConstants.xsmallHeight,
            ],
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    statusIcon,
                    color: statusColor,
                    size: 16,
                  ),
                ),
                UIConstants.smallWidth,
                Expanded(
                  child: Text(
                    Strings.training_requests.tr(),
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    statusLabel,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            if (university != null && university.isNotEmpty) ...[
              UIConstants.smallHeight,
              Text(
                '$university${faculty != null && faculty.isNotEmpty ? ' - $faculty' : ''}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
            UIConstants.smallHeight,
            Row(
              children: [
                Text(
                  Strings.view_details.tr(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                UIConstants.xsmallWidth,
                Icon(arrowIcon, color: context.colors.primary, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
