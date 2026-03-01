import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/training/presentation/cubits/trainees/trainees_cubit.dart';
import 'package:silah_app/features/training/presentation/views/trainees/widgets/trainees_body.dart';

class TraineesScreen extends StatelessWidget {
  const TraineesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TraineesCubit(repository: locator())..load(),
      child: PlatformScreenWrapper(
        title: Strings.trainees.tr(),
        body: const TraineesBody(),
      ),
    );
  }
}
