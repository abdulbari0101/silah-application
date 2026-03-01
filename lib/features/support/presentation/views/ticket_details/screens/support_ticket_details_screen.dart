import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/support/presentation/views/ticket_details/models/support_ticket_details_args.dart';
import 'package:silah_app/features/support/presentation/views/ticket_details/widgets/support_ticket_details_body.dart';

class SupportTicketDetailsScreen extends StatelessWidget {
  const SupportTicketDetailsScreen({super.key, required this.args});

  final SupportTicketDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    return PlatformScreenWrapper(
      title: Strings.support.tr(),
      body: SupportTicketDetailsBody(ticket: args.ticket),
    );
  }
}
