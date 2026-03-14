import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/core/presentation/ui/widget/text/labeled_value_row.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/presentation/support/support_ticket_presenter.dart';

class SupportTicketDetailsBody extends StatelessWidget {
  const SupportTicketDetailsBody({super.key, required this.ticket});

  final SupportTicketEntity ticket;

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.select<AppStateBloc, bool>((bloc) {
      final profile = bloc.state.data.customer?.profile;
      final accountType = profile?['accountType']?.toString().toLowerCase();
      final role = profile?['role']?.toString().toLowerCase();
      return accountType == 'admin' || role == 'admin';
    });
    final title = SupportTicketPresenter.title(context, ticket);
    final description = ticket.description?.trim() ?? '';
    final adminNotes = ticket.adminNotes?.trim() ?? '';
    final statusLabel = SupportTicketPresenter.statusLabel(
      context,
      ticket.status,
    );
    final statusColor = SupportTicketPresenter.statusColor(
      context,
      ticket.status,
    );
    final reference = SupportTicketPresenter.reference(ticket);
    final createdAt = SupportTicketPresenter.formattedDate(
      context,
      ticket.createdAt,
    );
    final updatedAt = SupportTicketPresenter.formattedDate(
      context,
      ticket.updatedAt,
    );
    final reporterRole = SupportTicketPresenter.reporterRoleLabel(
      context,
      ticket.reporterRole,
    );

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
          vertical: UIConstants.bigPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(
              innerWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      StatusChip(label: statusLabel, color: statusColor),
                    ],
                  ),
                  UIConstants.mediumHeight,
                  _buildMetaRow(
                    context,
                    label: Strings.reference_number.tr(),
                    value: reference,
                  ),
                  UIConstants.smallHeight,
                  _buildMetaRow(
                    context,
                    label: Strings.created_at.tr(),
                    value: createdAt,
                  ),
                  UIConstants.smallHeight,
                  _buildMetaRow(
                    context,
                    label: Strings.updated_at.tr(),
                    value: updatedAt,
                  ),
                  if (isAdmin &&
                      ticket.reporterUid?.trim().isNotEmpty == true) ...[
                    UIConstants.smallHeight,
                    _buildMetaRow(
                      context,
                      label: Strings.support_reporter_id.tr(),
                      value: ticket.reporterUid!.trim(),
                    ),
                  ],
                  if (isAdmin) ...[
                    UIConstants.smallHeight,
                    _buildMetaRow(
                      context,
                      label: Strings.support_reporter_role.tr(),
                      value: reporterRole,
                    ),
                  ],
                ],
              ),
            ),
            if (description.isNotEmpty) ...[
              UIConstants.bigHeight,
              _buildSectionTitle(
                context,
                label: Strings.support_report_details.tr(),
              ),
              UIConstants.mediumHeight,
              CustomCard(
                innerWidget: Text(
                  description,
                  style: context.textTheme.bodyLarge?.copyWith(height: 1.6),
                ),
              ),
            ],
            if (adminNotes.isNotEmpty) ...[
              UIConstants.bigHeight,
              _buildSectionTitle(context, label: Strings.support_notes.tr()),
              UIConstants.mediumHeight,
              CustomCard(
                innerWidget: Text(
                  adminNotes,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colors.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMetaRow(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return LabeledValueRow(
      label: label,
      value: value,
      labelSuffix: ':',
      labelStyle: context.textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      valueStyle: context.textTheme.bodySmall?.copyWith(
        color: context.colors.onSurfaceVariant,
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, {required String label}) {
    return Text(
      label,
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
