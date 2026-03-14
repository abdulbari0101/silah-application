import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/confirmation_dialog.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/core/presentation/ui/widget/text/labeled_value_row.dart';
import 'package:silah_app/core/presentation/ui/widget/webview/agreement_webview.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/messaging/domain/entities/chat_thread_entity.dart';
import 'package:silah_app/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:silah_app/features/messaging/presentation/views/conversation/models/chat_conversation_args.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/presentation/cubits/application_details/training_application_details_cubit.dart';
import 'package:silah_app/features/training/presentation/support/training_access_policy.dart';
import 'package:go_router/go_router.dart';

class TrainingApplicationDetailsBody extends StatelessWidget {
  const TrainingApplicationDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      TrainingApplicationDetailsCubit,
      TrainingApplicationDetailsState
    >(
      builder: (context, state) {
        return state.when(
          ready: (application, isUpdating) =>
              _buildContent(context, application, isUpdating: isUpdating),
          failure: (message, application) {
            if (application == null) {
              return Center(child: Text(message));
            }
            return _buildContent(
              context,
              application,
              isUpdating: false,
              errorMessage: message,
            );
          },
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    TrainingApplicationEntity application, {
    required bool isUpdating,
    String? errorMessage,
  }) {
    final currentUser = context.select<AppStateBloc, AuthUserEntity?>(
      (bloc) => bloc.state.data.customer,
    );
    final acceptsTrainees = TrainingAccessPolicy.currentLawyerAcceptsTrainees(
      currentUser,
    );
    final statusLabel = _statusLabel(application.status, context);
    final statusColor = _statusColor(application.status, context);

    final actions = <Widget>[];
    if (application.status == TrainingApplicationStatus.pending) {
      actions.add(
        SecondaryButton(
          text: Strings.action_reject.tr(),
          onTap: isUpdating
              ? null
              : () => _confirmAction(
                  context,
                  message: Strings.confirm_reject_application.tr(),
                  confirmStyle: FintureButtonStyle.danger,
                  onConfirm: () => context
                      .read<TrainingApplicationDetailsCubit>()
                      .updateStatus(TrainingApplicationStatus.rejected),
                ),
          isDisabled: isUpdating,
        ),
      );
      if (acceptsTrainees) {
        actions.add(
          PrimaryButton(
            text: Strings.action_accept.tr(),
            onTap: isUpdating
                ? null
                : () => _confirmAction(
                    context,
                    message: Strings.confirm_accept_application.tr(),
                    confirmStyle: FintureButtonStyle.success,
                    onConfirm: () => context
                        .read<TrainingApplicationDetailsCubit>()
                        .updateStatus(TrainingApplicationStatus.accepted),
                  ),
            isDisabled: isUpdating,
          ),
        );
      }
    }

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
                          application.fullName ?? Strings.user.tr(),
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                      StatusChip(label: statusLabel, color: statusColor),
                    ],
                  ),
                  UIConstants.smallHeight,
                  LabeledValueRow(
                    label: Strings.label_university.tr(),
                    value: application.university ?? Strings.not_available.tr(),
                    padding: const EdgeInsets.only(bottom: 6),
                    labelWidth: 120,
                  ),
                  LabeledValueRow(
                    label: Strings.label_city.tr(),
                    value: application.city ?? Strings.not_available.tr(),
                    padding: const EdgeInsets.only(bottom: 6),
                    labelWidth: 120,
                  ),
                  LabeledValueRow(
                    label: Strings.label_graduation_year.tr(),
                    value:
                        application.graduationYear?.toString() ??
                        Strings.not_available.tr(),
                    padding: const EdgeInsets.only(bottom: 6),
                    labelWidth: 120,
                  ),
                  if (application.cvUrl != null &&
                      application.cvUrl!.isNotEmpty) ...[
                    UIConstants.smallHeight,
                    PrimaryButton(
                      text: Strings.resume_pdf.tr(),
                      onTap: () => _openCv(context, application.cvUrl!),
                    ),
                  ],
                ],
              ),
            ),
            if (application.status == TrainingApplicationStatus.pending &&
                !acceptsTrainees) ...[
              UIConstants.mediumHeight,
              CustomCard(
                innerWidget: Text(
                  Strings.training_accept_disabled_message.tr(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.error,
                    height: 1.5,
                  ),
                ),
              ),
            ],
            if (actions.isNotEmpty) ...[
              UIConstants.mediumHeight,
              Row(
                children: actions
                    .map(
                      (action) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: action,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            if (application.status == TrainingApplicationStatus.accepted) ...[
              UIConstants.mediumHeight,
              PrimaryButton(
                text: Strings.messages.tr(),
                onTap: () => _openChat(context, application),
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

  Future<void> _confirmAction(
    BuildContext context, {
    required String message,
    FintureButtonStyle confirmStyle = FintureButtonStyle.primary,
    required VoidCallback onConfirm,
  }) async {
    final confirmed = await showAppConfirmationDialog(
      context,
      message: message,
      confirmStyle: confirmStyle,
    );

    if (confirmed) {
      onConfirm();
    }
  }

  void _openCv(BuildContext context, String url) {
    if (url.trim().isEmpty) {
      Toasts.error(context, Strings.unexpected_error.tr());
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PlatformScreenWrapper(
          title: Strings.resume_pdf.tr(),
          body: AgreementWebView(url: url, title: Strings.resume_pdf.tr()),
        ),
      ),
    );
  }

  Future<void> _openChat(
    BuildContext context,
    TrainingApplicationEntity application,
  ) async {
    final applicationId = application.id?.trim();
    if (applicationId == null || applicationId.isEmpty) {
      Toasts.error(context, Strings.unexpected_error.tr());
      return;
    }

    final currentUid = FirebaseAuth.instance.currentUser?.uid.trim();
    if (currentUid == null || currentUid.isEmpty) {
      Toasts.error(context, Strings.unexpected_error.tr());
      return;
    }

    final participantIds = <String>[
      currentUid,
      if (application.traineeId?.trim().isNotEmpty ?? false)
        application.traineeId!.trim(),
    ];

    final thread = ChatThreadEntity(
      id: _buildTrainingThreadId(applicationId),
      participantIds: participantIds,
      trainingApplicationId: applicationId,
    );

    final result = await locator<MessagingRepository>().ensureThread(thread);
    result.fold(
      (failure) => Toasts.error(context, failure.message),
      (resolvedThread) => context.pushNamed(
        AppRoutes.chatThread.name,
        extra: ChatConversationArgs(thread: resolvedThread).toJson(),
      ),
    );
  }

  String _buildTrainingThreadId(String applicationId) {
    return 'training_$applicationId';
  }

  String _statusLabel(TrainingApplicationStatus status, BuildContext context) {
    switch (status) {
      case TrainingApplicationStatus.pending:
        return Strings.status_pending.tr();
      case TrainingApplicationStatus.accepted:
        return Strings.status_accepted.tr();
      case TrainingApplicationStatus.rejected:
        return Strings.status_rejected.tr();
      case TrainingApplicationStatus.cancelled:
        return Strings.status_cancelled.tr();
    }
  }

  Color _statusColor(TrainingApplicationStatus status, BuildContext context) {
    switch (status) {
      case TrainingApplicationStatus.pending:
        return context.semantic.warning;
      case TrainingApplicationStatus.accepted:
        return context.semantic.success;
      case TrainingApplicationStatus.rejected:
        return context.colors.error;
      case TrainingApplicationStatus.cancelled:
        return context.colors.outlineVariant;
    }
  }
}
