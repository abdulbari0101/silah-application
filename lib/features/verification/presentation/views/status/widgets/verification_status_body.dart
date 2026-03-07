import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/core/presentation/ui/widget/text/labeled_value_row.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';
import 'package:silah_app/features/verification/domain/entities/verification_status.dart';
import 'package:silah_app/features/verification/presentation/cubits/status/verification_status_cubit.dart';

class VerificationStatusBody extends StatelessWidget {
  const VerificationStatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationStatusCubit, VerificationStatusState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: ProgressStateWidget()),
          failure: (message, verification) {
            if (verification == null) {
              return Center(
                child: CustomeErrorWidget(
                  message: message,
                  onRetry: () => context.read<VerificationStatusCubit>().load(),
                ),
              );
            }
            return _buildContent(
              context,
              verification,
              isUnverified: false,
              errorMessage: message,
            );
          },
          ready: (verification, isUnverified) =>
              _buildContent(context, verification, isUnverified: isUnverified),
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    LicenseVerificationEntity verification, {
    required bool isUnverified,
    String? errorMessage,
  }) {
    final status = isUnverified
        ? VerificationStatus.pending
        : verification.status;
    final statusLabel = _statusLabel(
      context,
      status,
      isUnverified: isUnverified,
    );
    final statusColor = _statusColor(
      context,
      status,
      isUnverified: isUnverified,
    );

    final canRequest = isUnverified || status == VerificationStatus.rejected;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
          vertical: UIConstants.bigPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCard(
              innerWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          Strings.verification_status.tr(),
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                      StatusChip(label: statusLabel, color: statusColor),
                    ],
                  ),
                  UIConstants.smallHeight,
                  Text(
                    _statusDescription(
                      context,
                      status,
                      isUnverified: isUnverified,
                    ),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                  if ((verification.licenseNumber ?? '').isNotEmpty) ...[
                    UIConstants.mediumHeight,
                    LabeledValueRow(
                      label: Strings.license_number.tr(),
                      value: verification.licenseNumber!,
                      labelSuffix: ':',
                      labelStyle: context.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      valueStyle: context.textTheme.labelSmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if ((verification.nationalId ?? '').isNotEmpty) ...[
                    UIConstants.smallHeight,
                    LabeledValueRow(
                      label: Strings.national_id.tr(),
                      value: verification.nationalId!,
                      labelSuffix: ':',
                      labelStyle: context.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      valueStyle: context.textTheme.labelSmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if ((verification.reviewNotes ?? '').isNotEmpty) ...[
                    UIConstants.mediumHeight,
                    Text(
                      verification.reviewNotes!,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
            if (canRequest) ...[
              UIConstants.bigHeight,
              PrimaryButton(
                text: Strings.request_verification.tr(),
                onTap: () => _openRequest(context),
              ),
            ],
            if (errorMessage != null) ...[
              UIConstants.mediumHeight,
              Text(
                errorMessage,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.error,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _openRequest(BuildContext context) {
    context.pushNamed(AppRoutes.verificationRequest.name).then((value) {
      if (!context.mounted) return;
      if (value == true) {
        Toasts.success(context, Strings.send_verification.tr());
        context.read<VerificationStatusCubit>().load();
      }
    });
  }

  String _statusLabel(
    BuildContext context,
    VerificationStatus status, {
    required bool isUnverified,
  }) {
    if (isUnverified) return Strings.verification_unverified.tr();
    switch (status) {
      case VerificationStatus.pending:
        return Strings.verification_pending.tr();
      case VerificationStatus.verified:
        return Strings.verification_verified.tr();
      case VerificationStatus.rejected:
        return Strings.verification_rejected.tr();
      case VerificationStatus.needsReview:
        return Strings.verification_needs_review.tr();
    }
  }

  String _statusDescription(
    BuildContext context,
    VerificationStatus status, {
    required bool isUnverified,
  }) {
    if (isUnverified) return Strings.verification_unverified_desc.tr();
    switch (status) {
      case VerificationStatus.pending:
        return Strings.verification_pending_desc.tr();
      case VerificationStatus.verified:
        return Strings.verification_verified_desc.tr();
      case VerificationStatus.rejected:
        return Strings.verification_rejected_desc.tr();
      case VerificationStatus.needsReview:
        return Strings.verification_needs_review_desc.tr();
    }
  }

  Color _statusColor(
    BuildContext context,
    VerificationStatus status, {
    required bool isUnverified,
  }) {
    if (isUnverified) return context.colors.outlineVariant;
    switch (status) {
      case VerificationStatus.pending:
        return context.semantic.warning;
      case VerificationStatus.verified:
        return context.semantic.success;
      case VerificationStatus.rejected:
        return context.colors.error;
      case VerificationStatus.needsReview:
        return context.semantic.info;
    }
  }
}
