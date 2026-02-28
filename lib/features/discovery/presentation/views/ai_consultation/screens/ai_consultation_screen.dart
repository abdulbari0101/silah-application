import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/discovery/presentation/blocs/ai_consultation/ai_consultation_cubit.dart';
import 'package:silah_app/features/discovery/presentation/views/ai_consultation/widgets/ai_consultation_body.dart';

class AiConsultationScreen extends StatelessWidget {
  const AiConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AiConsultationCubit(repository: locator()),
      child: PlatformScreenWrapper(body: const AiConsultationBody()),
    );
  }
}
