import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/features/support/data/models/support_report_models.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';

import 'support_service.dart';

abstract class SupportRemoteDataSource {
  Future<BaseApiResponse<SupportReportResponseModel>> submitReport(
    SupportReportRequestModel request,
  );
  Future<List<SupportTicketEntity>> fetchReports();
  String? currentUserId();
  Future<String> currentUserRole();
}

class SupportRemoteDataSourceImpl implements SupportRemoteDataSource {
  final SupportService supportService;
  final AppLogger logger;
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  SupportRemoteDataSourceImpl({
    required this.supportService,
    required this.logger,
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  }) : auth = auth ?? FirebaseAuth.instance,
       firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<BaseApiResponse<SupportReportResponseModel>> submitReport(
    SupportReportRequestModel request,
  ) => handleBaseApiResponse<SupportReportResponseModel>(
    method: 'SupportRemoteDataSource.submitReport',
    logger: logger,
    call: () => supportService.submitReport(request),
  );

  @override
  Future<List<SupportTicketEntity>> fetchReports() async {
    final response = await handleBaseApiResponse<SupportTicketsResponseModel>(
      method: 'SupportRemoteDataSource.fetchReports',
      logger: logger,
      call: supportService.fetchReports,
    );

    final items = response.reports ?? const <SupportTicketItemModel>[];
    return items.map((item) => item.toEntity()).toList(growable: false);
  }

  @override
  String? currentUserId() => auth.currentUser?.uid;

  @override
  Future<String> currentUserRole() async {
    final user = auth.currentUser;
    if (user == null) return 'user';

    try {
      final tokenResult = await user.getIdTokenResult();
      final claimRole = tokenResult.claims?['role']?.toString().toLowerCase();
      if (claimRole != null && claimRole.isNotEmpty) {
        return claimRole;
      }
    } catch (_) {}

    final userDoc = await firestore.collection('users').doc(user.uid).get();
    if (userDoc.exists) {
      final accountType = userDoc
          .data()?['accountType']
          ?.toString()
          .toLowerCase();
      if (accountType != null && accountType.isNotEmpty) {
        return accountType;
      }
      return 'user';
    }

    final lawyerDoc = await firestore.collection('lawyers').doc(user.uid).get();
    if (lawyerDoc.exists) {
      return 'lawyer';
    }

    return 'user';
  }
}
