import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/controls/app_segmented_control.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/presentation/cubits/trainees/trainees_cubit.dart';
import 'package:silah_app/features/training/presentation/views/application_details/models/training_application_details_args.dart';
import 'package:silah_app/features/training/presentation/views/trainees/widgets/trainee_application_card.dart';

enum _TraineesTab { applicants, accepted }

class TraineesBody extends StatefulWidget {
  const TraineesBody({super.key});

  @override
  State<TraineesBody> createState() => _TraineesBodyState();
}

class _TraineesBodyState extends State<TraineesBody> {
  _TraineesTab _selected = _TraineesTab.applicants;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        child: Column(
          children: [
            AppSegmentedControl<_TraineesTab>(
              value: _selected,
              onChanged: (value) => setState(() => _selected = value),
              items: [
                SegmentedItem(
                  value: _TraineesTab.applicants,
                  label: Strings.status_pending.tr(),
                ),
                SegmentedItem(
                  value: _TraineesTab.accepted,
                  label: Strings.status_accepted.tr(),
                ),
              ],
            ),
            UIConstants.mediumHeight,
            Expanded(
              child: BlocBuilder<TraineesCubit, TraineesState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const Center(child: ProgressStateWidget()),
                    loading: () => const Center(child: ProgressStateWidget()),
                    empty: () => EmptyWidget(
                      retryWidget: PrimaryButton(
                        text: Strings.try_again.tr(),
                        onTap: () => context.read<TraineesCubit>().load(),
                      ),
                    ),
                    error: (message) => CustomeErrorWidget(
                      message: message,
                      onRetry: () => context.read<TraineesCubit>().load(),
                    ),
                    loaded: (applications, updatingId) {
                      final filtered = applications.where((application) {
                        if (_selected == _TraineesTab.applicants) {
                          return application.status ==
                              TrainingApplicationStatus.pending;
                        }
                        return application.status ==
                            TrainingApplicationStatus.accepted;
                      }).toList();

                      if (filtered.isEmpty) {
                        return EmptyWidget(
                          title: _selected == _TraineesTab.accepted
                              ? Strings.trainees_no_accepted_requests.tr()
                              : Strings.no_data_to_display.tr(),
                          retryWidget: PrimaryButton(
                            text: Strings.try_again.tr(),
                            onTap: () => context.read<TraineesCubit>().load(),
                          ),
                        );
                      }

                      return ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => UIConstants.smallHeight,
                        itemBuilder: (context, index) {
                          final application = filtered[index];
                          return TraineeApplicationCard(
                            application: application,
                            isUpdating: updatingId == application.id,
                            variant: _selected == _TraineesTab.accepted
                                ? TraineeCardVariant.compact
                                : TraineeCardVariant.detailed,
                            onTap: () async {
                              await context.pushNamed(
                                AppRoutes.trainingApplicationDetails.name,
                                extra: TrainingApplicationDetailsArgs(
                                  application: application,
                                ).toJson(),
                              );
                              if (context.mounted) {
                                context.read<TraineesCubit>().load();
                              }
                            },
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
