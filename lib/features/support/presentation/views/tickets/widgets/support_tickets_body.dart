import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/presentation/cubits/tickets/support_tickets_cubit.dart';
import 'package:silah_app/features/support/presentation/views/ticket_details/models/support_ticket_details_args.dart';
import 'package:silah_app/features/support/presentation/views/tickets/widgets/support_ticket_card.dart';

class SupportTicketsBody extends StatelessWidget {
  const SupportTicketsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.select<AppStateBloc, bool>((bloc) {
      final accountType = bloc.state.data.customer?.profile?['accountType']
          ?.toString()
          .toLowerCase();
      return accountType == 'admin';
    });

    return SafeArea(
      child: BlocBuilder<SupportTicketsCubit, SupportTicketsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: ProgressStateWidget()),
            empty: () => _buildEmptyState(context, isAdmin: isAdmin),
            failure: (message) => _buildErrorState(context, message),
            ready: (tickets) =>
                _buildTicketsList(context, tickets, isAdmin: isAdmin),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, {required bool isAdmin}) {
    return _buildContainer(
      context,
      child: EmptyWidget(
        title: Strings.no_data_to_display.tr(),
        retryWidget: isAdmin
            ? PrimaryButton(
                text: Strings.try_again.tr(),
                onTap: () => context.read<SupportTicketsCubit>().load(),
              )
            : PrimaryButton(
                text: Strings.send_report.tr(),
                onTap: () => _openReportScreen(context),
              ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return _buildContainer(
      context,
      child: CustomeErrorWidget(
        message: message,
        onRetry: () => context.read<SupportTicketsCubit>().load(),
      ),
    );
  }

  Widget _buildTicketsList(
    BuildContext context,
    List<SupportTicketEntity> tickets, {
    required bool isAdmin,
  }) {
    return _buildContainer(
      context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!isAdmin) ...[
            PrimaryButton(
              text: Strings.send_report.tr(),
              onTap: () => _openReportScreen(context),
            ),
            UIConstants.mediumHeight,
          ],
          Expanded(
            child: ListView.separated(
              itemCount: tickets.length,
              separatorBuilder: (_, __) => UIConstants.mediumHeight,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return SupportTicketCard(
                  ticket: ticket,
                  onTap: () => _openDetails(context, ticket),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(BuildContext context, {required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.screenHorizantalPadding,
        vertical: UIConstants.bigPadding,
      ),
      child: child,
    );
  }

  Future<void> _openReportScreen(BuildContext context) async {
    final didSubmitReport =
        await context.pushNamed<bool>(AppRoutes.supportReport.name) ?? false;

    if (!context.mounted) return;

    if (didSubmitReport) {
      Toasts.success(context, Strings.sent_successfully.tr());
    }

    context.read<SupportTicketsCubit>().load();
  }

  void _openDetails(BuildContext context, SupportTicketEntity ticket) {
    context.pushNamed(
      AppRoutes.supportTicketDetails.name,
      extra: SupportTicketDetailsArgs(ticket: ticket),
    );
  }
}
