import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/admin/presentation/cubits/tasks/admin_tasks_cubit.dart';
import 'package:silah_app/features/admin/presentation/views/tasks/widgets/admin_tasks_body.dart';

class AdminTasksScreen extends StatelessWidget {
  const AdminTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminTasksCubit(repository: locator())..load(),
      child: PlatformScreenWrapper(
        title: Strings.admin_tasks.tr(),
        body: const AdminTasksBody(),
      ),
    );
  }
}
