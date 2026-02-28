import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/widget/actions/action_row.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/presentation/cubits/requests/consultation_requests_cubit.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request, required this.isUpdating});

  final ConsultationRequestEntity request;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    final authUser = context.select<AppStateBloc, AuthUserEntity?>(
      (bloc) => bloc.state.data.customer,
    );
    final accountType = authUser?.profile?['accountType']?.toString().toLowerCase();
    final isLawyer = accountType == 'lawyer' || authUser?.accountType == AuthAccountType.lawyer;

    final statusLabel = _statusLabel(request.status, context);
    final statusColor = _statusColor(request.status, context);

    final actions = <Widget>[];
    if (request.status == ConsultationStatus.pending && isLawyer) {
      actions.add(
        SecondaryButton(
          text: Strings.action_reject.tr(),
          onTap: isUpdating
              ? null
              : () => _confirmAction(
                    context,
                    message: Strings.confirm_reject_request.tr(),
                    onConfirm: () => context
                        .read<ConsultationRequestsCubit>()
                        .updateStatus(request.id ?? '', ConsultationStatus.rejected),
                  ),
          isDisabled: isUpdating,
        ),
      );
      actions.add(
        PrimaryButton(
          text: Strings.action_accept.tr(),
          onTap: isUpdating
              ? null
              : () => _confirmAction(
                    context,
                    message: Strings.confirm_accept_request.tr(),
                    onConfirm: () => context
                        .read<ConsultationRequestsCubit>()
                        .updateStatus(request.id ?? '', ConsultationStatus.accepted),
                  ),
          isDisabled: isUpdating,
        ),
      );
    }

    if (request.status == ConsultationStatus.accepted) {
      actions.add(
        PrimaryButton(
          text: Strings.action_close.tr(),
          onTap: isUpdating
              ? null
              : () => _confirmAction(
                    context,
                    message: Strings.confirm_close_request.tr(),
                    onConfirm: () => context
                        .read<ConsultationRequestsCubit>()
                        .updateStatus(request.id ?? '', ConsultationStatus.closed),
                  ),
          isDisabled: isUpdating,
        ),
      );
    }

    return CustomCard(
      innerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  request.specializationId ?? Strings.specializations.tr(),
                  style: context.textTheme.titleSmall,
                ),
              ),
              StatusChip(label: statusLabel, color: statusColor),
            ],
          ),
          if (request.description != null && request.description!.trim().isNotEmpty) ...[
            UIConstants.smallHeight,
            Text(
              request.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodySmall,
            ),
          ],
          if (request.createdAt != null) ...[
            UIConstants.smallHeight,
            Text(
              request.createdAt!,
              style: context.textTheme.labelSmall?.onSurfaceVariant(context),
            ),
          ],
          if (actions.isNotEmpty) ...[
            UIConstants.mediumHeight,
            ActionRow(actions: actions),
          ],
        ],
      ),
    );
  }

  Future<void> _confirmAction(
    BuildContext context, {
    required String message,
    required VoidCallback onConfirm,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Strings.confirm_action_title.tr()),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(Strings.action_cancel.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(Strings.action_confirm.tr()),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      onConfirm();
    }
  }

  String _statusLabel(ConsultationStatus status, BuildContext context) {
    switch (status) {
      case ConsultationStatus.pending:
        return Strings.status_pending.tr();
      case ConsultationStatus.accepted:
        return Strings.status_accepted.tr();
      case ConsultationStatus.rejected:
        return Strings.status_rejected.tr();
      case ConsultationStatus.active:
        return Strings.status_active.tr();
      case ConsultationStatus.closed:
        return Strings.status_closed.tr();
      case ConsultationStatus.cancelled:
        return Strings.status_cancelled.tr();
    }
  }

  Color _statusColor(ConsultationStatus status, BuildContext context) {
    switch (status) {
      case ConsultationStatus.pending:
        return context.semantic.warning;
      case ConsultationStatus.accepted:
        return context.semantic.success;
      case ConsultationStatus.rejected:
        return context.colors.error;
      case ConsultationStatus.active:
        return context.semantic.info;
      case ConsultationStatus.closed:
        return context.colors.outlineVariant;
      case ConsultationStatus.cancelled:
        return context.colors.outlineVariant;
    }
  }
}
