import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/training/presentation/cubits/opportunities/training_opportunities_cubit.dart';
import 'package:silah_app/features/training/presentation/views/opportunities/models/training_opportunities_args.dart';
import 'package:silah_app/features/training/presentation/views/opportunities/widgets/training_opportunities_body.dart';

class TrainingOpportunitiesScreen extends StatelessWidget {
  const TrainingOpportunitiesScreen({super.key, this.args});

  final TrainingOpportunitiesArgs? args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrainingOpportunitiesCubit(
        repository: locator(),
        lawyerUid: args?.lawyerUid,
      )..load(),
      child: PlatformScreenWrapper(
        title: Strings.training_opportunities.tr(),
        body: const TrainingOpportunitiesBody(),
      ),
    );
  }
}
