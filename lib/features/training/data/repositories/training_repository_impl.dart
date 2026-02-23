import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/training/data/datasources/remote/training_remote_data_source.dart';
import 'package:silah_app/features/training/data/models/training_models.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/domain/entities/training_opportunity_entity.dart';
import 'package:silah_app/features/training/domain/repositories/training_repository.dart';

class TrainingRepositoryImpl implements TrainingRepository {
  final TrainingRemoteDataSource remoteDataSource;
  final Executor executor;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  TrainingRepositoryImpl({
    required this.remoteDataSource,
    required this.executor,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        auth = auth ?? FirebaseAuth.instance;

  @override
  Future<Either<Failure, List<TrainingOpportunityEntity>>> fetchOpportunities() {
    return executor.runOnline(() async {
      return firebaseCall<List<TrainingOpportunityEntity>>(
        method: 'TrainingRepository.fetchOpportunities',
        logger: executor.logger,
        call: () async {
          final snapshot =
              await firestore.collection('training_opportunities').where('isOpen', isEqualTo: true).get();
          return snapshot.docs.map(_mapOpportunityDoc).toList();
        },
      );
    }, from: 'TrainingRepository.fetchOpportunities');
  }

  @override
  Future<Either<Failure, TrainingApplicationEntity>> submitApplication(
    TrainingApplicationEntity application,
  ) {
    return executor.runOnline(() async {
      final uid = application.traineeId ?? auth.currentUser?.uid;
      if (uid == null) {
        throw const MissingDataException('Missing trainee id');
      }
      if (application.opportunityId == null || application.opportunityId!.isEmpty) {
        throw const MissingDataException('Missing opportunityId');
      }
      if (application.cvUrl == null || application.cvUrl!.isEmpty) {
        throw const MissingDataException('Missing CV URL');
      }

      final response = await remoteDataSource.createApplication(
        TrainingApplicationCreateRequestModel(
          opportunityId: application.opportunityId!,
          traineeUid: uid,
          cvUrl: application.cvUrl!,
          fullName: application.fullName,
          university: application.university,
          faculty: application.faculty,
          cityId: application.cityId ?? application.city,
          areaId: application.areaId,
          graduationYear: application.graduationYear,
        ),
      );

      final applicationId = response.applicationId;
      return TrainingApplicationEntity(
        id: applicationId,
        opportunityId: application.opportunityId,
        traineeId: uid,
        fullName: application.fullName,
        university: application.university,
        faculty: application.faculty,
        cityId: application.cityId,
        areaId: application.areaId,
        graduationYear: application.graduationYear,
        cvUrl: application.cvUrl,
        status: TrainingApplicationStatus.pending,
      );
    }, from: 'TrainingRepository.submitApplication');
  }

  @override
  Future<Either<Failure, List<TrainingApplicationEntity>>> fetchMyApplications() {
    return executor.runOnline(() async {
      final uid = auth.currentUser?.uid;
      if (uid == null) {
        throw const MissingDataException('Missing user id');
      }
      return firebaseCall<List<TrainingApplicationEntity>>(
        method: 'TrainingRepository.fetchMyApplications',
        logger: executor.logger,
        payload: {'uid': uid},
        call: () async {
          final snapshot =
              await firestore.collection('training_applications').where('traineeUid', isEqualTo: uid).get();
          return snapshot.docs.map(_mapApplicationDoc).toList();
        },
      );
    }, from: 'TrainingRepository.fetchMyApplications');
  }

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
