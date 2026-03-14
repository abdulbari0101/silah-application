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
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/presentation/cubits/tasks/admin_tasks_cubit.dart';
import 'package:silah_app/features/admin/presentation/views/details/models/admin_task_details_args.dart';
import 'package:silah_app/features/admin/presentation/views/tasks/widgets/admin_task_card.dart';

class AdminTasksBody extends StatelessWidget {
  const AdminTasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AdminTasksCubit, AdminTasksState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: ProgressStateWidget()),
            empty: () => Padding(
              padding: const EdgeInsets.all(
                UIConstants.screenHorizantalPadding,
              ),
              child: EmptyWidget(title: Strings.no_data_to_display.tr()),
            ),
            failure: (message) => Padding(
              padding: const EdgeInsets.all(
                UIConstants.screenHorizantalPadding,
              ),
              child: CustomeErrorWidget(
                message: message,
                onRetry: () => context.read<AdminTasksCubit>().load(),
              ),
            ),
            ready: (tasks) => _buildList(context, tasks),
          );
        },
      ),
    );
  }

  Widget _buildList(BuildContext context, List<AdminTaskEntity> tasks) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.screenHorizantalPadding,
        vertical: UIConstants.bigPadding,
      ),
      itemCount: tasks.length,
      separatorBuilder: (_, __) => UIConstants.mediumHeight,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return AdminTaskCard(
          task: task,
          onTap: () => _openDetails(context, task),
        );
      },
    );
  }

  void _openDetails(BuildContext context, AdminTaskEntity task) {
    final cubit = context.read<AdminTasksCubit>();
    context
        .pushNamed(
          AppRoutes.adminTaskDetails.name,
          extra: AdminTaskDetailsArgs(task: task).toJson(),
        )
        .then((_) => cubit.load());
  }
}
