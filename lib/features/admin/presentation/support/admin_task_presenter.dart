import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_status.dart';

class AdminTaskPresenter {
  static String title(BuildContext context, AdminTaskEntity task) {
    switch (_taskTypeKey(task.type)) {
      case _AdminTaskType.licenseReview:
        return _localized(
          context,
          ar: 'مراجعة ترخيص المحامي',
          en: 'Lawyer License Review',
        );
      case _AdminTaskType.supportReport:
        return _localized(context, ar: 'بلاغ دعم', en: 'Support Report');
      case _AdminTaskType.profileReview:
        return _localized(
          context,
          ar: 'مراجعة الملف الشخصي',
          en: 'Profile Review',
        );
      case _AdminTaskType.unknown:
        final rawType = task.type?.trim();
        if (rawType == null || rawType.isEmpty) {
          return Strings.admin_tasks.tr();
        }
        return rawType;
    }
  }

  static String summary(BuildContext context, AdminTaskEntity task) {
    switch (_taskTypeKey(task.type)) {
      case _AdminTaskType.licenseReview:
        return _localized(
          context,
          ar: 'راجع طلب التحقق من الرخصة وبيانات المحامي قبل اتخاذ القرار.',
          en: 'Review the lawyer verification request and account details before making a decision.',
        );
      case _AdminTaskType.supportReport:
        return _localized(
          context,
          ar: 'راجع بيانات البلاغ وهوية المبلّغ ومحتوى الشكوى قبل اعتماد الحالة.',
          en: 'Review the report details, reporter identity, and complaint content before updating the status.',
        );
      case _AdminTaskType.profileReview:
        return _localized(
          context,
          ar: 'راجع بيانات الحساب والتعديلات المعلّقة قبل اعتماد أو رفض المهمة.',
          en: 'Review the account data and pending changes before approving or rejecting the task.',
        );
      case _AdminTaskType.unknown:
        return task.notes?.trim() ?? '';
    }
  }

  static String statusLabel(BuildContext context, AdminTaskStatus status) {
    switch (status) {
      case AdminTaskStatus.pending:
        return Strings.status_pending.tr();
      case AdminTaskStatus.inReview:
        return Strings.status_in_review.tr();
      case AdminTaskStatus.approved:
        return Strings.status_approved.tr();
      case AdminTaskStatus.rejected:
        return Strings.status_rejected.tr();
    }
  }

  static Color statusColor(BuildContext context, AdminTaskStatus status) {
    switch (status) {
      case AdminTaskStatus.pending:
        return context.semantic.warning;
      case AdminTaskStatus.inReview:
        return context.semantic.info;
      case AdminTaskStatus.approved:
        return context.semantic.success;
      case AdminTaskStatus.rejected:
        return context.colors.error;
    }
  }

  static String formattedCreatedAt(BuildContext context, String? rawValue) {
    final value = rawValue?.trim();
    if (value == null || value.isEmpty) {
      return '-';
    }
    final parsed = DateTime.tryParse(value);
    if (parsed == null) {
      return value;
    }
    final localeCode = context.locale.languageCode;
    return DateFormat(
      'dd MMM yyyy • hh:mm a',
      localeCode,
    ).format(parsed.toLocal());
  }

  static String taskCode(AdminTaskEntity task) {
    final code = task.id?.trim();
    return code?.isNotEmpty == true ? code! : '-';
  }

  static String referenceCode(AdminTaskEntity task) {
    final reference = task.targetId?.trim();
    return reference?.isNotEmpty == true ? reference! : '-';
  }

  static _AdminTaskType _taskTypeKey(String? value) {
    final normalized = (value ?? '').trim().toLowerCase().replaceAll('-', '_');
    switch (normalized) {
      case 'license_review':
      case 'license verification':
      case 'licenseverification':
        return _AdminTaskType.licenseReview;
      case 'support_report':
      case 'support report':
      case 'supportreport':
        return _AdminTaskType.supportReport;
      case 'profile_review':
      case 'profile review':
      case 'profilereview':
        return _AdminTaskType.profileReview;
      default:
        return _AdminTaskType.unknown;
    }
  }

  static String _localized(
    BuildContext context, {
    required String ar,
    required String en,
  }) {
    return context.locale.languageCode == 'ar' ? ar : en;
  }
}

enum _AdminTaskType { licenseReview, supportReport, profileReview, unknown }
