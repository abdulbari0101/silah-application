import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/support/presentation/cubits/tickets/support_tickets_cubit.dart';
import 'package:silah_app/features/support/presentation/views/tickets/widgets/support_tickets_body.dart';

class SupportTicketsScreen extends StatelessWidget {
  const SupportTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SupportTicketsCubit(repository: locator())..load(),
      child: PlatformScreenWrapper(
        title: Strings.support.tr(),
        body: const SupportTicketsBody(),
      ),
    );
  }
}
