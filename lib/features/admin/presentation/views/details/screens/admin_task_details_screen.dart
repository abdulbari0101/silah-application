import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/admin/presentation/cubits/details/admin_task_details_cubit.dart';
import 'package:silah_app/features/admin/presentation/views/details/models/admin_task_details_args.dart';
import 'package:silah_app/features/admin/presentation/views/details/widgets/admin_task_details_body.dart';

class AdminTaskDetailsScreen extends StatelessWidget {
  const AdminTaskDetailsScreen({super.key, required this.args});

  final AdminTaskDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AdminTaskDetailsCubit(repository: locator(), initial: args.task),
      child: PlatformScreenWrapper(
        title: Strings.admin_tasks.tr(),
        body: const AdminTaskDetailsBody(),
      ),
    );
  }
}
