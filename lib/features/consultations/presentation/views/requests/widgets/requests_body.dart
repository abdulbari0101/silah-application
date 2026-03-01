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

class RequestsBody extends StatelessWidget {
  const RequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        child: Column(
          children: [
            _StatusFilter(),
            UIConstants.mediumHeight,
            Expanded(
              child:
                  BlocBuilder<
                    ConsultationRequestsCubit,
                    ConsultationRequestsState
                  >(
                    builder: (context, state) {
                      return state.when(
                        initial: (_) =>
                            const Center(child: ProgressStateWidget()),
                        loading: (_) =>
                            const Center(child: ProgressStateWidget()),
                        empty: (_) => EmptyWidget(
                          retryWidget: PrimaryButton(
                            text: Strings.try_again.tr(),
                            onTap: () => context
                                .read<ConsultationRequestsCubit>()
                                .load(),
                          ),
                        ),
                        error: (_, message) => CustomeErrorWidget(
                          message: message,
                          onRetry: () =>
                              context.read<ConsultationRequestsCubit>().load(),
                        ),
                        loaded: (filter, requests, updatingId) {
                          return ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: requests.length,
                            separatorBuilder: (_, __) =>
                                UIConstants.smallHeight,
                            itemBuilder: (context, index) {
                              final request = requests[index];
                              return RequestCard(
                                request: request,
                                onTap: () => context.pushNamed(
                                  AppRoutes.consultationDetails.name,
                                  extra: ConsultationRequestDetailsArgs(
                                    request: request,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
            ),
          ],
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
