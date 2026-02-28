import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/consultations/presentation/cubits/requests/consultation_requests_cubit.dart';
import 'package:silah_app/features/consultations/presentation/views/requests/widgets/requests_body.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConsultationRequestsCubit(repository: locator())..load(),
      child: PlatformScreenWrapper(
        title: Strings.my_requests.tr(),
        body: const RequestsBody(),
      ),
    );
  }
}
