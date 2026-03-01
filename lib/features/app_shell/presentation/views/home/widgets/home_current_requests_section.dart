import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/consultations/presentation/cubits/requests/consultation_requests_cubit.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';

class HomeCurrentRequestsSection extends StatelessWidget {
  const HomeCurrentRequestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                Strings.current_requests.tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.pushNamed(AppRoutes.requests.name),
              child: Text(Strings.view_all.tr()),
            ),
          ],
        ),
        UIConstants.smallHeight,
        BlocBuilder<ConsultationRequestsCubit, ConsultationRequestsState>(
          builder: (context, state) {
            return state.when(
              initial: (_) => const Center(child: ProgressStateWidget()),
              loading: (_) => const Center(child: ProgressStateWidget()),
              empty: (_) => EmptyWidget(
                retryWidget: PrimaryButtonWithProgress(
                  text: Strings.try_again.tr(),
                  onTap: () => context.read<ConsultationRequestsCubit>().load(),
                  isLoading: false,
                ),
              ),
              error: (_, message) => CustomeErrorWidget(
                message: message,
                onRetry: () => context.read<ConsultationRequestsCubit>().load(),
              ),
              loaded: (_, requests, __) {
                if (requests.isEmpty) {
                  return EmptyWidget(
                    retryWidget: PrimaryButtonWithProgress(
                      text: Strings.try_again.tr(),
                      onTap: () =>
                          context.read<ConsultationRequestsCubit>().load(),
                      isLoading: false,
                    ),
                  );
                }
                final preview = requests.first;
                return _RequestPreviewCard(request: preview);
              },
            );
          },
        ),
      ],
    );
  }
}

class _RequestPreviewCard extends StatelessWidget {
  const _RequestPreviewCard({required this.request});

  final ConsultationRequestEntity request;

  @override
  Widget build(BuildContext context) {
    final title = request.specializationId ?? Strings.request_consultation.tr();
    final description = request.description?.trim();
    final arrowIcon = context.isRTL ? Icons.arrow_back : Icons.arrow_forward;

    return Container(
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  arrowIcon,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 16,
                ),
                UIConstants.xsmallWidth,
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (description != null && description.isNotEmpty) ...[
            UIConstants.smallHeight,
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          UIConstants.mediumHeight,
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: Theme.of(context).colorScheme.primary,
                  size: 16,
                ),
              ),
              UIConstants.smallWidth,
              Expanded(
                child: Text(
                  Strings.view_details.tr(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_outline,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  size: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
