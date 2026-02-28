import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/consultations/presentation/cubits/requests/consultation_requests_cubit.dart';
import 'package:silah_app/features/consultations/presentation/views/requests/widgets/request_card.dart';

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
                style: Theme.of(context).textTheme.titleMedium,
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
                      onTap: () => context.read<ConsultationRequestsCubit>().load(),
                      isLoading: false,
                    ),
                  );
                }
                final preview = requests.first;
                return RequestCard(request: preview, isUpdating: false);
              },
            );
          },
        ),
      ],
    );
  }
}
