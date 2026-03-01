import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/training/presentation/cubits/application_details/training_application_details_cubit.dart';
import 'package:silah_app/features/training/presentation/views/application_details/models/training_application_details_args.dart';
import 'package:silah_app/features/training/presentation/views/application_details/widgets/training_application_details_body.dart';

class TrainingApplicationDetailsScreen extends StatelessWidget {
  const TrainingApplicationDetailsScreen({super.key, required this.args});

  final TrainingApplicationDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrainingApplicationDetailsCubit(
        repository: locator(),
        initial: args.application,
      ),
      child: PlatformScreenWrapper(
        title: Strings.training_requests.tr(),
        body: const TrainingApplicationDetailsBody(),
      ),
    );
  }
}
