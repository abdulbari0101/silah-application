import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';

class AdminTaskSubjectDetailsEntity {
  final AdminRelatedAccountEntity? account;
  final AdminSupportReportDetailsEntity? supportReport;
  final LicenseVerificationEntity? verification;

  const AdminTaskSubjectDetailsEntity({
    this.account,
    this.supportReport,
    this.verification,
  });

  bool get hasContent =>
      account != null || supportReport != null || verification != null;
}

class AdminRelatedAccountEntity {
  final String uid;
  final String? name;
  final String? email;
  final String? phone;
  final String? city;
  final String? accountType;
  final String? avatarUrl;
  final String? licenseNumber;
  final bool? verified;

  const AdminRelatedAccountEntity({
    required this.uid,
    this.name,
    this.email,
    this.phone,
    this.city,
    this.accountType,
    this.avatarUrl,
    this.licenseNumber,
    this.verified,
  });
}

class AdminSupportReportDetailsEntity {
  final String reportId;
  final String? reporterUid;
  final String? reporterRole;
  final String? subject;
  final String? details;
  final String? status;
  final String? adminNotes;
  final String? createdAt;
  final String? updatedAt;

  const AdminSupportReportDetailsEntity({
    required this.reportId,
    this.reporterUid,
    this.reporterRole,
    this.subject,
    this.details,
    this.status,
    this.adminNotes,
    this.createdAt,
    this.updatedAt,
  });
}
