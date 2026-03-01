import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/consultations/presentation/cubits/details/consultation_request_details_cubit.dart';
import 'package:silah_app/features/consultations/presentation/views/details/models/consultation_request_details_args.dart';
import 'package:silah_app/features/consultations/presentation/views/details/widgets/consultation_request_details_body.dart';

class ConsultationRequestDetailsScreen extends StatelessWidget {
  const ConsultationRequestDetailsScreen({super.key, required this.args});

  final ConsultationRequestDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    final requestId = args.request.id;
    return BlocProvider(
      create: (_) {
        final cubit = ConsultationRequestDetailsCubit(
          repository: locator(),
          initial: args.request,
        );
        if (requestId != null && requestId.isNotEmpty) {
          cubit.load(requestId);
        }
        return cubit;
      },
      child: PlatformScreenWrapper(
        title: Strings.my_requests.tr(),
        body: const ConsultationRequestDetailsBody(),
      ),
    );
  }
}
