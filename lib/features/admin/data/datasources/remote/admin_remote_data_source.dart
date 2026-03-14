import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/foundation/parsing/profile_field_reader.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_status.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_subject_details_entity.dart';
import 'package:silah_app/features/support/data/datasources/remote/support_service.dart';
import 'package:silah_app/features/support/data/models/support_report_models.dart';
import 'package:silah_app/features/verification/data/datasources/remote/verification_service.dart';
import 'package:silah_app/features/verification/data/models/verification_models.dart';
import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';
import 'package:silah_app/features/verification/domain/entities/verification_status.dart';

abstract class AdminRemoteDataSource {
  Future<List<AdminTaskEntity>> fetchTasks();
  Stream<List<AdminTaskEntity>> watchTasks();
  Future<AdminTaskEntity> updateTask(AdminTaskEntity task);
  Future<AdminTaskSubjectDetailsEntity?> fetchTaskSubject(AdminTaskEntity task);
  String? currentUserId();
}

class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final AppLogger logger;
  final SupportService supportService;
  final VerificationService verificationService;

  AdminRemoteDataSourceImpl({
    required this.logger,
    required this.supportService,
    required this.verificationService,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  }) : firestore = firestore ?? FirebaseFirestore.instance,
       auth = auth ?? FirebaseAuth.instance;

  @override
  String? currentUserId() => auth.currentUser?.uid;

  @override
  Future<List<AdminTaskEntity>> fetchTasks() {
    return firebaseCall<List<AdminTaskEntity>>(
      method: 'AdminRemoteDataSource.fetchTasks',
      logger: logger,
      call: () async {
        final snapshot = await firestore
            .collection('admin_tasks')
            .orderBy('createdAt', descending: true)
            .get();

        return snapshot.docs
            .map((doc) => _mapTaskDocument(doc))
            .toList(growable: false);
      },
    );
  }

  @override
  Stream<List<AdminTaskEntity>> watchTasks() {
    return firestore
        .collection('admin_tasks')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => _mapTaskDocument(doc))
              .toList(growable: false),
        );
  }

  @override
  Future<AdminTaskEntity> updateTask(AdminTaskEntity task) {
    return firebaseCall<AdminTaskEntity>(
      method: 'AdminRemoteDataSource.updateTask',
      logger: logger,
      payload: {'taskId': task.id, 'status': task.status.toValue()},
      call: () async {
        final taskId = task.id?.trim();
        if (taskId == null || taskId.isEmpty) {
          throw const MissingDataException('Missing admin task id');
        }

        if (_taskTypeKey(task.type) == _AdminTaskType.supportReport) {
          final reportId = task.targetId?.trim();
          if (reportId == null || reportId.isEmpty) {
            throw const MissingDataException(
              'Missing support report id for admin task',
            );
          }
          final reportStatus = _reportStatusForTaskStatus(task.status);
          if (reportStatus == null) {
            throw const MissingDataException(
              'Unsupported admin action for support report task',
            );
          }
          await handleBaseApiResponse<SupportReportReviewResponseModel>(
            method: 'AdminRemoteDataSource.reviewSupportReport',
            logger: logger,
            call: () => supportService.reviewReport(
              reportId,
              SupportReportReviewRequestModel(status: reportStatus),
            ),
          );
        } else if (_taskTypeKey(task.type) == _AdminTaskType.licenseReview) {
          final lawyerUid = task.targetId?.trim();
          if (lawyerUid == null || lawyerUid.isEmpty) {
            throw const MissingDataException(
              'Missing lawyer id for license review task',
            );
          }
          final verificationStatus = _verificationReviewStatusForTaskStatus(
            task.status,
          );
          if (verificationStatus == null) {
            throw const MissingDataException(
              'Unsupported admin action for license review task',
            );
          }
          await handleBaseApiResponse<VerificationResponseModel>(
            method: 'AdminRemoteDataSource.reviewLicenseVerification',
            logger: logger,
            call: () => verificationService.reviewVerification({
              'lawyerUid': lawyerUid,
              'status': verificationStatus,
            }),
          );
        } else {
          await firestore.collection('admin_tasks').doc(taskId).set({
            'status': task.status.toValue(),
            'updatedAt': DateTime.now().toUtc().toIso8601String(),
          }, SetOptions(merge: true));
        }

        final updatedDoc = await firestore
            .collection('admin_tasks')
            .doc(taskId)
            .get();
        if (!updatedDoc.exists) {
          return task;
        }
        return _mapTaskDocument(updatedDoc);
      },
    );
  }

  @override
  Future<AdminTaskSubjectDetailsEntity?> fetchTaskSubject(
    AdminTaskEntity task,
  ) {
    return firebaseCall<AdminTaskSubjectDetailsEntity?>(
      method: 'AdminRemoteDataSource.fetchTaskSubject',
      logger: logger,
      payload: {
        'taskId': task.id,
        'type': task.type,
        'targetId': task.targetId,
      },
      call: () async {
        final targetId = task.targetId?.trim();
        if (targetId == null || targetId.isEmpty) {
          return null;
        }

        switch (_taskTypeKey(task.type)) {
          case _AdminTaskType.licenseReview:
            final account = await _fetchAccount(targetId);
            final verification = await _fetchVerification(targetId);
            return AdminTaskSubjectDetailsEntity(
              account: account,
              verification: verification,
            );
          case _AdminTaskType.supportReport:
            final supportReport = await _fetchSupportReport(targetId);
            AdminRelatedAccountEntity? account;
            final reporterUid = supportReport?.reporterUid?.trim();
            if (reporterUid != null && reporterUid.isNotEmpty) {
              account = await _fetchAccount(reporterUid);
            }
            return AdminTaskSubjectDetailsEntity(
              account: account,
              supportReport: supportReport,
            );
          case _AdminTaskType.profileReview:
            final account = await _fetchAccount(targetId);
            return AdminTaskSubjectDetailsEntity(account: account);
          case _AdminTaskType.unknown:
            final account = await _fetchAccount(targetId);
            if (account != null) {
              return AdminTaskSubjectDetailsEntity(account: account);
            }
            final supportReport = await _fetchSupportReport(targetId);
            if (supportReport != null) {
              return AdminTaskSubjectDetailsEntity(
                supportReport: supportReport,
              );
            }
            return null;
        }
      },
    );
  }

  AdminTaskEntity _mapTaskDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const <String, dynamic>{};
    return AdminTaskEntity(
      id: doc.id,
      type: ProfileFieldReader.firstNonEmpty([data['type']]),
      targetId: ProfileFieldReader.firstNonEmpty([data['targetId']]),
      status: _parseTaskStatus(data['status']),
      notes: ProfileFieldReader.firstNonEmpty([data['notes']]),
      createdAt: parseFirestoreTimestamp(data['createdAt']),
    );
  }

  Future<AdminRelatedAccountEntity?> _fetchAccount(String uid) async {
    final userFuture = firestore.collection('users').doc(uid).get();
    final lawyerFuture = firestore.collection('lawyers').doc(uid).get();
    final userDoc = await userFuture;
    final lawyerDoc = await lawyerFuture;

    if (lawyerDoc.exists) {
      final data = lawyerDoc.data() ?? const <String, dynamic>{};
      return AdminRelatedAccountEntity(
        uid: lawyerDoc.id,
        name: ProfileFieldReader.readDisplayName(data),
        email: ProfileFieldReader.firstNonEmpty([data['email']]),
        phone: ProfileFieldReader.firstNonEmpty([data['phone']]),
        city: ProfileFieldReader.firstNonEmpty([data['city']]),
        accountType:
            ProfileFieldReader.firstNonEmpty([data['accountType']]) ?? 'lawyer',
        avatarUrl: ProfileFieldReader.readAvatarUrl(data),
        licenseNumber: ProfileFieldReader.firstNonEmpty([
          data['licenseNumber'],
        ]),
        verified: _parseBool(data['verified']),
      );
    }

    if (userDoc.exists) {
      final data = userDoc.data() ?? const <String, dynamic>{};
      return AdminRelatedAccountEntity(
        uid: userDoc.id,
        name: ProfileFieldReader.readDisplayName(data),
        email: ProfileFieldReader.firstNonEmpty([data['email']]),
        phone: ProfileFieldReader.firstNonEmpty([data['phone']]),
        city: ProfileFieldReader.firstNonEmpty([data['city']]),
        accountType:
            ProfileFieldReader.firstNonEmpty([
              data['accountType'],
              data['role'],
            ]) ??
            'user',
        avatarUrl: ProfileFieldReader.readAvatarUrl(data),
        verified: _parseBool(data['verified']),
      );
    }

    return null;
  }

  Future<LicenseVerificationEntity?> _fetchVerification(
    String lawyerUid,
  ) async {
    final doc = await firestore
        .collection('license_verifications')
        .doc(lawyerUid)
        .get();
    if (!doc.exists) {
      return null;
    }

    final data = doc.data() ?? const <String, dynamic>{};
    return LicenseVerificationEntity(
      licenseNumber: ProfileFieldReader.firstNonEmpty([data['licenseNumber']]),
      nationalId: ProfileFieldReader.firstNonEmpty([data['nationalId']]),
      status: _parseVerificationStatus(data['status']),
      reviewNotes: ProfileFieldReader.firstNonEmpty([data['reviewNotes']]),
      requestedAt: parseFirestoreTimestamp(data['requestedAt']),
      verifiedAt: parseFirestoreTimestamp(data['verifiedAt']),
    );
  }

  Future<AdminSupportReportDetailsEntity?> _fetchSupportReport(
    String reportId,
  ) async {
    final doc = await firestore
        .collection('support_reports')
        .doc(reportId)
        .get();
    if (!doc.exists) {
      return null;
    }

    final data = doc.data() ?? const <String, dynamic>{};
    return AdminSupportReportDetailsEntity(
      reportId: doc.id,
      reporterUid: ProfileFieldReader.firstNonEmpty([data['reporterUid']]),
      reporterRole: ProfileFieldReader.firstNonEmpty([data['role']]),
      subject: ProfileFieldReader.firstNonEmpty([data['subject']]),
      details: ProfileFieldReader.firstNonEmpty([data['details']]),
      status: ProfileFieldReader.firstNonEmpty([data['status']]),
      adminNotes: ProfileFieldReader.firstNonEmpty([data['adminNotes']]),
      createdAt: parseFirestoreTimestamp(data['createdAt']),
      updatedAt: parseFirestoreTimestamp(data['updatedAt']),
    );
  }

  AdminTaskStatus _parseTaskStatus(Object? value) {
    final normalized = (value?.toString().trim().toLowerCase() ?? '')
        .replaceAll('_', '')
        .replaceAll(' ', '');
    switch (normalized) {
      case 'approved':
        return AdminTaskStatus.approved;
      case 'rejected':
        return AdminTaskStatus.rejected;
      case 'inreview':
        return AdminTaskStatus.inReview;
      case 'pending':
      default:
        return AdminTaskStatus.pending;
    }
  }

  VerificationStatus _parseVerificationStatus(Object? value) {
    switch (value?.toString().trim().toLowerCase()) {
      case 'verified':
        return VerificationStatus.verified;
      case 'rejected':
        return VerificationStatus.rejected;
      case 'needsreview':
      case 'needs_review':
        return VerificationStatus.needsReview;
      case 'pending':
      default:
        return VerificationStatus.pending;
    }
  }

  bool? _parseBool(Object? value) {
    if (value is bool) {
      return value;
    }
    if (value is num) {
      return value != 0;
    }
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      if (normalized == 'true' || normalized == '1') {
        return true;
      }
      if (normalized == 'false' || normalized == '0') {
        return false;
      }
    }
    return null;
  }

  _AdminTaskType _taskTypeKey(String? value) {
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

  String? _reportStatusForTaskStatus(AdminTaskStatus status) {
    switch (status) {
      case AdminTaskStatus.approved:
        return 'resolved';
      case AdminTaskStatus.rejected:
        return 'closed';
      case AdminTaskStatus.pending:
      case AdminTaskStatus.inReview:
        return null;
    }
  }

  String? _verificationReviewStatusForTaskStatus(AdminTaskStatus status) {
    switch (status) {
      case AdminTaskStatus.approved:
        return 'verified';
      case AdminTaskStatus.rejected:
        return 'rejected';
      case AdminTaskStatus.pending:
      case AdminTaskStatus.inReview:
        return null;
    }
  }
}

enum _AdminTaskType { licenseReview, supportReport, profileReview, unknown }
