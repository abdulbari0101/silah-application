import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/verification/presentation/cubits/status/verification_status_cubit.dart';
import 'package:silah_app/features/verification/presentation/views/status/widgets/verification_status_body.dart';

class VerificationStatusScreen extends StatelessWidget {
  const VerificationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerificationStatusCubit(repository: locator())..load(),
      child: PlatformScreenWrapper(
        title: Strings.verification_status.tr(),
        body: const VerificationStatusBody(),
      ),
    );
  }
}
