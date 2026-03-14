import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/confirmation_dialog.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/core/presentation/ui/widget/image/app_remote_avatar.dart';
import 'package:silah_app/core/presentation/ui/widget/text/labeled_value_row.dart';
import 'package:silah_app/core/presentation/ui/widget/text/section_title.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_status.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_subject_details_entity.dart';
import 'package:silah_app/features/admin/presentation/cubits/details/admin_task_details_cubit.dart';
import 'package:silah_app/features/admin/presentation/support/admin_task_presenter.dart';
import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';
import 'package:silah_app/features/verification/domain/entities/verification_status.dart';

class AdminTaskDetailsBody extends StatelessWidget {
  const AdminTaskDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminTaskDetailsCubit, AdminTaskDetailsState>(
      builder: (context, state) {
        final subjectFuture = context
            .read<AdminTaskDetailsCubit>()
            .loadSubject();
        return state.when(
          ready: (task, isUpdating) => _buildContent(
            context,
            task,
            subjectFuture: subjectFuture,
            isUpdating: isUpdating,
          ),
          failure: (message, task) {
            if (task == null) {
              return Center(child: Text(message));
            }
            return _buildContent(
              context,
              task,
              subjectFuture: subjectFuture,
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
    AdminTaskEntity task, {
    required Future<AdminTaskSubjectDetailsEntity?> subjectFuture,
    required bool isUpdating,
    String? errorMessage,
  }) {
    final statusLabel = AdminTaskPresenter.statusLabel(context, task.status);
    final statusColor = AdminTaskPresenter.statusColor(context, task.status);
    final title = AdminTaskPresenter.title(context, task);
    final summary = AdminTaskPresenter.summary(context, task);
    final notes = task.notes?.trim();

    final actions = <Widget>[];
    if (task.status == AdminTaskStatus.pending ||
        task.status == AdminTaskStatus.inReview) {
      actions.add(
        SecondaryButton(
          text: Strings.action_reject.tr(),
          onTap: isUpdating
              ? null
              : () => _confirmAction(
                  context,
                  message: Strings.confirm_reject_request.tr(),
                  confirmStyle: FintureButtonStyle.danger,
                  onConfirm: () => context
                      .read<AdminTaskDetailsCubit>()
                      .updateStatus(AdminTaskStatus.rejected),
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
                  confirmStyle: FintureButtonStyle.success,
                  onConfirm: () => context
                      .read<AdminTaskDetailsCubit>()
                      .updateStatus(AdminTaskStatus.approved),
                ),
          isDisabled: isUpdating,
        ),
      );
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
                          title,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                      StatusChip(label: statusLabel, color: statusColor),
                    ],
                  ),
                  UIConstants.mediumHeight,
                  Text(
                    summary,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                  UIConstants.mediumHeight,
                  _buildInfoRow(
                    context,
                    label: Strings.reference_number.tr(),
                    value: AdminTaskPresenter.referenceCode(task),
                  ),
                  UIConstants.smallHeight,
                  _buildInfoRow(
                    context,
                    label: _localized(context, ar: 'رقم المهمة', en: 'Task ID'),
                    value: AdminTaskPresenter.taskCode(task),
                  ),
                  UIConstants.smallHeight,
                  _buildInfoRow(
                    context,
                    label: Strings.created_at.tr(),
                    value: AdminTaskPresenter.formattedCreatedAt(
                      context,
                      task.createdAt,
                    ),
                  ),
                  UIConstants.smallHeight,
                  _buildInfoRow(
                    context,
                    label: _localized(
                      context,
                      ar: 'الحالة الحالية',
                      en: 'Current status',
                    ),
                    value: statusLabel,
                    valueColor: statusColor,
                    valueWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            UIConstants.xbigHeight,
            SectionTitle(
              title: _localized(
                context,
                ar: 'تفاصيل الطلب المرتبط',
                en: 'Linked request details',
              ),
            ),
            UIConstants.smallHeight,
            FutureBuilder<AdminTaskSubjectDetailsEntity?>(
              future: subjectFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CustomCard(
                    innerWidget: Row(
                      children: [
                        SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              context.colors.primary,
                            ),
                          ),
                        ),
                        UIConstants.mediumWidth,
                        Expanded(
                          child: Text(
                            _localized(
                              context,
                              ar: 'جاري تحميل تفاصيل المهمة المرتبطة...',
                              en: 'Loading linked task details...',
                            ),
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return CustomCard(
                    innerWidget: Text(
                      snapshot.error.toString(),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.error,
                      ),
                    ),
                  );
                }

                final subject = snapshot.data;
                if (subject == null || !subject.hasContent) {
                  return CustomCard(
                    innerWidget: Text(
                      _localized(
                        context,
                        ar: 'لا توجد بيانات مرتبطة بهذه المهمة حتى الآن.',
                        en: 'No linked request data is available for this task yet.',
                      ),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subject.account != null) ...[
                      _buildAccountSection(context, task, subject.account!),
                      UIConstants.mediumHeight,
                    ],
                    if (subject.verification != null) ...[
                      _buildVerificationSection(context, subject.verification!),
                      UIConstants.mediumHeight,
                    ],
                    if (subject.supportReport != null)
                      _buildSupportReportSection(
                        context,
                        subject.supportReport!,
                      ),
                  ],
                );
              },
            ),
            if (notes != null && notes.isNotEmpty) ...[
              UIConstants.xbigHeight,
              SectionTitle(
                title: _localized(
                  context,
                  ar: 'ملاحظات المهمة',
                  en: 'Task notes',
                ),
              ),
              UIConstants.smallHeight,
              CustomCard(
                innerWidget: Text(
                  notes,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
            if (actions.isNotEmpty) ...[
              UIConstants.xbigHeight,
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
            if (errorMessage != null) ...[
              UIConstants.mediumHeight,
              CustomCard(
                innerWidget: Text(
                  errorMessage,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection(
    BuildContext context,
    AdminTaskEntity task,
    AdminRelatedAccountEntity account,
  ) {
    final accountTitle = _resolveAccountSectionTitle(context, task);
    final accountRole = _accountTypeLabel(context, account.accountType);
    final verificationLabel = account.verified == null
        ? '-'
        : (account.verified!
              ? _localized(context, ar: 'موثق', en: 'Verified')
              : _localized(context, ar: 'غير موثق', en: 'Not verified'));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: accountTitle),
        UIConstants.smallHeight,
        CustomCard(
          innerWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppRemoteAvatar(
                    radius: 28,
                    imageUrl: account.avatarUrl,
                    label: account.name,
                    variant: account.accountType == 'lawyer'
                        ? AppAvatarVariant.lawyer
                        : AppAvatarVariant.user,
                  ),
                  UIConstants.mediumWidth,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          account.name ??
                              _localized(
                                context,
                                ar: 'بدون اسم',
                                en: 'Unnamed',
                              ),
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        UIConstants.xsmallHeight,
                        Text(
                          accountRole,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              UIConstants.mediumHeight,
              _buildInfoRow(
                context,
                label: _localized(context, ar: 'معرف الحساب', en: 'Account ID'),
                value: account.uid,
              ),
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: Strings.email_address.tr(),
                value: account.email ?? '-',
              ),
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: Strings.phone.tr(),
                value: account.phone ?? '-',
              ),
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: _localized(context, ar: 'المدينة', en: 'City'),
                value: account.city ?? '-',
              ),
              if ((account.licenseNumber ?? '').isNotEmpty) ...[
                UIConstants.smallHeight,
                _buildInfoRow(
                  context,
                  label: Strings.license_number.tr(),
                  value: account.licenseNumber!,
                ),
              ],
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: Strings.verification_status.tr(),
                value: verificationLabel,
                valueColor: account.verified == true
                    ? context.semantic.success
                    : context.colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationSection(
    BuildContext context,
    LicenseVerificationEntity verification,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: _localized(
            context,
            ar: 'تفاصيل طلب التحقق',
            en: 'Verification request details',
          ),
        ),
        UIConstants.smallHeight,
        CustomCard(
          innerWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(
                context,
                label: Strings.license_number.tr(),
                value: verification.licenseNumber ?? '-',
              ),
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: _localized(context, ar: 'رقم الهوية', en: 'National ID'),
                value: verification.nationalId ?? '-',
              ),
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: Strings.verification_status.tr(),
                value: _verificationStatusLabel(context, verification.status),
              ),
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: _localized(
                  context,
                  ar: 'تاريخ الطلب',
                  en: 'Requested at',
                ),
                value: AdminTaskPresenter.formattedCreatedAt(
                  context,
                  verification.requestedAt,
                ),
              ),
              if ((verification.verifiedAt ?? '').isNotEmpty) ...[
                UIConstants.smallHeight,
                _buildInfoRow(
                  context,
                  label: _localized(
                    context,
                    ar: 'تاريخ القرار',
                    en: 'Decision time',
                  ),
                  value: AdminTaskPresenter.formattedCreatedAt(
                    context,
                    verification.verifiedAt,
                  ),
                ),
              ],
              if ((verification.reviewNotes ?? '').isNotEmpty) ...[
                UIConstants.mediumHeight,
                _buildTextBlock(
                  context,
                  label: _localized(
                    context,
                    ar: 'ملاحظات المراجعة',
                    en: 'Review notes',
                  ),
                  value: verification.reviewNotes!,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSupportReportSection(
    BuildContext context,
    AdminSupportReportDetailsEntity report,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: _localized(
            context,
            ar: 'تفاصيل البلاغ',
            en: 'Support report details',
          ),
        ),
        UIConstants.smallHeight,
        CustomCard(
          innerWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(
                context,
                label: Strings.reference_number.tr(),
                value: report.reportId,
              ),
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: _localized(
                  context,
                  ar: 'نوع المبلّغ',
                  en: 'Reporter role',
                ),
                value: _accountTypeLabel(context, report.reporterRole),
              ),
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: _localized(
                  context,
                  ar: 'حالة البلاغ',
                  en: 'Report status',
                ),
                value: _supportStatusLabel(context, report.status),
              ),
              if ((report.subject ?? '').isNotEmpty) ...[
                UIConstants.mediumHeight,
                _buildTextBlock(
                  context,
                  label: _localized(context, ar: 'الموضوع', en: 'Subject'),
                  value: report.subject!,
                ),
              ],
              if ((report.details ?? '').isNotEmpty) ...[
                UIConstants.mediumHeight,
                _buildTextBlock(
                  context,
                  label: Strings.tv_description.tr(),
                  value: report.details!,
                ),
              ],
              if ((report.adminNotes ?? '').isNotEmpty) ...[
                UIConstants.mediumHeight,
                _buildTextBlock(
                  context,
                  label: _localized(
                    context,
                    ar: 'ملاحظات المشرف',
                    en: 'Admin notes',
                  ),
                  value: report.adminNotes!,
                ),
              ],
              UIConstants.mediumHeight,
              _buildInfoRow(
                context,
                label: Strings.created_at.tr(),
                value: AdminTaskPresenter.formattedCreatedAt(
                  context,
                  report.createdAt,
                ),
              ),
              UIConstants.smallHeight,
              _buildInfoRow(
                context,
                label: Strings.updated_at.tr(),
                value: AdminTaskPresenter.formattedCreatedAt(
                  context,
                  report.updatedAt,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String label,
    required String value,
    Color? valueColor,
    FontWeight? valueWeight,
  }) {
    return LabeledValueRow(
      label: label,
      value: value,
      labelSuffix: ':',
      crossAxisAlignment: CrossAxisAlignment.start,
      labelStyle: context.textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      valueStyle: context.textTheme.labelMedium?.copyWith(
        color: valueColor ?? context.colors.onSurfaceVariant,
        fontWeight: valueWeight,
      ),
    );
  }

  Widget _buildTextBlock(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        UIConstants.smallHeight,
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ],
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

  String _resolveAccountSectionTitle(
    BuildContext context,
    AdminTaskEntity task,
  ) {
    final normalized = (task.type ?? '').trim().toLowerCase().replaceAll(
      '-',
      '_',
    );
    if (normalized == 'license_review') {
      return _localized(context, ar: 'بيانات المحامي', en: 'Lawyer details');
    }
    if (normalized == 'support_report') {
      return _localized(context, ar: 'بيانات المبلّغ', en: 'Reporter details');
    }
    return _localized(context, ar: 'بيانات الحساب', en: 'Account details');
  }

  String _accountTypeLabel(BuildContext context, String? value) {
    switch ((value ?? '').trim().toLowerCase()) {
      case 'lawyer':
        return _localized(context, ar: 'محامي', en: 'Lawyer');
      case 'admin':
        return _localized(context, ar: 'مشرف', en: 'Admin');
      case 'user':
      default:
        return _localized(context, ar: 'مستخدم', en: 'User');
    }
  }

  String _verificationStatusLabel(
    BuildContext context,
    VerificationStatus status,
  ) {
    switch (status) {
      case VerificationStatus.pending:
        return Strings.status_pending.tr();
      case VerificationStatus.verified:
        return _localized(context, ar: 'موثق', en: 'Verified');
      case VerificationStatus.rejected:
        return Strings.status_rejected.tr();
      case VerificationStatus.needsReview:
        return Strings.verification_needs_review.tr();
    }
  }

  String _supportStatusLabel(BuildContext context, String? status) {
    switch ((status ?? '').trim().toLowerCase()) {
      case 'inprogress':
      case 'in_progress':
        return Strings.status_in_progress.tr();
      case 'resolved':
        return Strings.status_resolved.tr();
      case 'closed':
        return Strings.status_closed.tr();
      case 'open':
      default:
        return Strings.status_open.tr();
    }
  }

  String _localized(
    BuildContext context, {
    required String ar,
    required String en,
  }) {
    return context.locale.languageCode == 'ar' ? ar : en;
  }
}
