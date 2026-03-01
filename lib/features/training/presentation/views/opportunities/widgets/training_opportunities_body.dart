import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/training/presentation/cubits/opportunities/training_opportunities_cubit.dart';
import 'package:silah_app/features/training/presentation/views/application/models/training_application_args.dart';
import 'package:silah_app/features/training/presentation/views/opportunities/widgets/training_opportunity_card.dart';

class TrainingOpportunitiesBody extends StatelessWidget {
  const TrainingOpportunitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TrainingOpportunitiesCubit, TrainingOpportunitiesState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: ProgressStateWidget()),
            failure: (message) => Center(
              child: CustomeErrorWidget(
                message: message,
                onRetry: () => context.read<TrainingOpportunitiesCubit>().load(),
              ),
            ),
            empty: () => EmptyWidget(title: Strings.no_data_to_display.tr()),
            ready: (opportunities) => ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.screenHorizantalPadding,
                vertical: UIConstants.bigPadding,
              ),
              itemCount: opportunities.length,
              separatorBuilder: (_, __) => UIConstants.mediumHeight,
              itemBuilder: (context, index) {
                final opportunity = opportunities[index];
                return TrainingOpportunityCard(
                  opportunity: opportunity,
                  onTap: () => context.pushNamed(
                    AppRoutes.trainingApplication.name,
                    extra: TrainingApplicationArgs(opportunity: opportunity),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
