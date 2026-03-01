import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/features/training/data/datasources/remote/training_service.dart';
import 'package:silah_app/features/training/data/models/training_models.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/domain/entities/training_opportunity_entity.dart';

abstract class TrainingRemoteDataSource {
  Future<BaseApiResponse<TrainingApplicationCreateResponseModel>> createApplication(
    TrainingApplicationCreateRequestModel request,
  );

  Future<BaseApiResponse<TrainingApplicationStatusUpdateResponseModel>> updateStatus(
    String applicationId,
    TrainingApplicationStatusUpdateRequestModel request,
  );

  Future<List<TrainingOpportunityEntity>> fetchOpportunities({String? lawyerUid});
  Future<List<TrainingApplicationEntity>> fetchMyApplications(String traineeUid);
  Future<List<TrainingApplicationEntity>> fetchApplicationsForLawyer(String lawyerUid);
  String? currentUserId();
}

class TrainingRemoteDataSourceImpl implements TrainingRemoteDataSource {
  final TrainingService service;
  final AppLogger logger;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  TrainingRemoteDataSourceImpl({
    required this.service,
    required this.logger,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        auth = auth ?? FirebaseAuth.instance;

  @override
  Future<BaseApiResponse<TrainingApplicationCreateResponseModel>> createApplication(
    TrainingApplicationCreateRequestModel request,
  ) =>
      handleBaseApiResponse<TrainingApplicationCreateResponseModel>(
        method: 'TrainingRemoteDataSource.createApplication',
        logger: logger,
        call: () => service.createApplication(request),
      );

  @override
  Future<BaseApiResponse<TrainingApplicationStatusUpdateResponseModel>> updateStatus(
    String applicationId,
    TrainingApplicationStatusUpdateRequestModel request,
  ) =>
      handleBaseApiResponse<TrainingApplicationStatusUpdateResponseModel>(
        method: 'TrainingRemoteDataSource.updateStatus',
        logger: logger,
        call: () => service.updateStatus(applicationId, request),
      );

  @override
  Future<List<TrainingOpportunityEntity>> fetchOpportunities({String? lawyerUid}) {
    return firebaseCall<List<TrainingOpportunityEntity>>(
      method: 'TrainingRemoteDataSource.fetchOpportunities',
      logger: logger,
      call: () async {
        Query<Map<String, dynamic>> query = firestore
            .collection('training_opportunities')
            .where('isOpen', isEqualTo: true);
        final resolvedLawyerUid = lawyerUid?.trim();
        if (resolvedLawyerUid != null && resolvedLawyerUid.isNotEmpty) {
          query = query.where('lawyerUid', isEqualTo: resolvedLawyerUid);
        }
        final snapshot = await query.get();
        return snapshot.docs.map(_mapOpportunityDoc).toList();
      },
    );
  }

  @override
  Future<List<TrainingApplicationEntity>> fetchMyApplications(String traineeUid) {
    return firebaseCall<List<TrainingApplicationEntity>>(
      method: 'TrainingRemoteDataSource.fetchMyApplications',
      logger: logger,
      payload: {'uid': traineeUid},
      call: () async {
        final snapshot =
            await firestore.collection('training_applications').where('traineeUid', isEqualTo: traineeUid).get();
        return snapshot.docs.map(_mapApplicationDoc).toList();
      },
    );
  }

  @override
  Future<List<TrainingApplicationEntity>> fetchApplicationsForLawyer(String lawyerUid) {
    return firebaseCall<List<TrainingApplicationEntity>>(
      method: 'TrainingRemoteDataSource.fetchApplicationsForLawyer',
      logger: logger,
      payload: {'lawyerUid': lawyerUid},
      call: () async {
        final snapshot = await firestore
            .collection('training_applications')
            .where('lawyerUid', isEqualTo: lawyerUid)
            .get();
        return snapshot.docs.map(_mapApplicationDoc).toList();
      },
    );
  }

  @override
  String? currentUserId() => auth.currentUser?.uid;

  TrainingOpportunityEntity _mapOpportunityDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return TrainingOpportunityEntity(
      id: doc.id,
      lawyerId: data['lawyerUid'] as String?,
      title: data['title'] as String?,
      description: data['description'] as String?,
      city: data['city'] as String?,
      isOpen: data['isOpen'] as bool? ?? true,
      createdAt: parseFirestoreTimestamp(data['createdAt']),
    );
  }

  TrainingApplicationEntity _mapApplicationDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return TrainingApplicationEntity(
      id: doc.id,
      opportunityId: data['opportunityId'] as String?,
      traineeId: data['traineeUid'] as String?,
      fullName: data['fullName'] as String?,
      university: data['university'] as String?,
      faculty: data['faculty'] as String?,
      cityId: data['cityId'] as String?,
      city: data['city'] as String?,
      areaId: data['areaId'] as String?,
      graduationYear: parseFirestoreInt(data['graduationYear']),
      cvUrl: data['cvUrl'] as String?,
      status: _parseStatus(data['status'] as String?) ?? TrainingApplicationStatus.pending,
      submittedAt: parseFirestoreTimestamp(data['submittedAt']),
    );
  }

  TrainingApplicationStatus? _parseStatus(String? value) {
    switch (value?.toLowerCase()) {
      case 'accepted':
        return TrainingApplicationStatus.accepted;
      case 'rejected':
        return TrainingApplicationStatus.rejected;
      case 'cancelled':
        return TrainingApplicationStatus.cancelled;
      case 'pending':
        return TrainingApplicationStatus.pending;
      default:
        return null;
    }
  }
}
