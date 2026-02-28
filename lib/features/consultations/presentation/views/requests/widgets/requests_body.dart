import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/presentation/cubits/requests/consultation_requests_cubit.dart';
import 'package:silah_app/features/consultations/presentation/views/requests/widgets/request_card.dart';

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
              child: BlocBuilder<ConsultationRequestsCubit, ConsultationRequestsState>(
                builder: (context, state) {
                  return state.when(
                    initial: (_) => const Center(child: ProgressStateWidget()),
                    loading: (_) => const Center(child: ProgressStateWidget()),
                    empty: (_) => EmptyWidget(
                      retryWidget: TextButton(
                        onPressed: () => context.read<ConsultationRequestsCubit>().load(),
                        child: Text(Strings.try_again.tr()),
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
                            isUpdating: updatingId == request.id,
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

        return CupertinoSlidingSegmentedControl<ConsultationStatus>(
          groupValue: selected,
          onValueChanged: (value) {
            if (value != null) {
              context.read<ConsultationRequestsCubit>().setFilter(value);
            }
          },
          children: {
            ConsultationStatus.pending: _SegmentLabel(Strings.status_pending.tr()),
            ConsultationStatus.accepted: _SegmentLabel(Strings.status_accepted.tr()),
            ConsultationStatus.closed: _SegmentLabel(Strings.status_closed.tr()),
          },
        );
      },
    );
  }
}

class _SegmentLabel extends StatelessWidget {
  const _SegmentLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: Text(label, textAlign: TextAlign.center),
    );
  }
}
