import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/training/presentation/cubits/application/training_application_cubit.dart';
import 'package:silah_app/features/training/presentation/cubits/lookups/training_lookups_cubit.dart';
import 'package:silah_app/features/training/presentation/views/application/models/training_application_args.dart';
import 'package:silah_app/features/training/presentation/views/application/widgets/training_application_form_body.dart';

class TrainingApplicationFormScreen extends StatelessWidget {
  const TrainingApplicationFormScreen({super.key, required this.args});

  final TrainingApplicationArgs args;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TrainingApplicationCubit(repository: locator()),
        ),
        BlocProvider(
          create: (_) => TrainingLookupsCubit(repository: locator())..load(),
        ),
      ],
      child: PlatformScreenWrapper(
        title: Strings.request_training.tr(),
        body: TrainingApplicationFormBody(opportunity: args.opportunity),
      ),
    );
  }
}
