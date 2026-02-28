import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/training/presentation/cubits/trainees/trainees_cubit.dart';
import 'package:silah_app/features/training/presentation/views/trainees/widgets/trainee_application_card.dart';

class TraineesBody extends StatelessWidget {
  const TraineesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        child: BlocBuilder<TraineesCubit, TraineesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: ProgressStateWidget()),
              loading: () => const Center(child: ProgressStateWidget()),
              empty: () => EmptyWidget(
                retryWidget: TextButton(
                  onPressed: () => context.read<TraineesCubit>().load(),
                  child: Text(Strings.try_again.tr()),
                ),
              ),
              error: (message) => CustomeErrorWidget(
                message: message,
                onRetry: () => context.read<TraineesCubit>().load(),
              ),
              loaded: (applications, updatingId) {
                return ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: applications.length,
                  separatorBuilder: (_, __) => UIConstants.smallHeight,
                  itemBuilder: (context, index) {
                    final application = applications[index];
                    return TraineeApplicationCard(
                      application: application,
                      isUpdating: updatingId == application.id,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
