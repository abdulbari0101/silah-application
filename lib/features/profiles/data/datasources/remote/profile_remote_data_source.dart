import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/features/profiles/domain/entities/profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> fetchProfile();
  Future<ProfileEntity> updateProfile(ProfileEntity profile);
  String? currentUserId();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final AppLogger logger;

  ProfileRemoteDataSourceImpl({
    required this.logger,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        auth = auth ?? FirebaseAuth.instance;

  @override
  String? currentUserId() => auth.currentUser?.uid;

  @override
  Future<ProfileEntity> fetchProfile() {
    return firebaseCall<ProfileEntity>(
      method: 'ProfileRemoteDataSource.fetchProfile',
      logger: logger,
      call: () async {
        final uid = currentUserId();
        if (uid == null) {
          return const ProfileEntity();
        }
        final doc = await firestore.collection('users').doc(uid).get();
        if (!doc.exists) {
          return ProfileEntity(id: uid);
        }
        return _mapProfile(doc);
      },
    );
  }

  @override
  Future<ProfileEntity> updateProfile(ProfileEntity profile) {
    return firebaseCall<ProfileEntity>(
      method: 'ProfileRemoteDataSource.updateProfile',
      logger: logger,
      payload: _buildPayload(profile),
      call: () async {
        final uid = currentUserId();
        if (uid == null) {
          return profile;
        }
        await firestore.collection('users').doc(uid).set(
              _buildPayload(profile),
              SetOptions(merge: true),
            );
        final doc = await firestore.collection('users').doc(uid).get();
        if (!doc.exists) {
          return profile.copyWith(id: uid);
        }
        return _mapProfile(doc);
      },
    );
  }

  Map<String, dynamic> _buildPayload(ProfileEntity profile) {
    final payload = <String, dynamic>{
      if (profile.name != null) 'name': profile.name,
      if (profile.email != null) 'email': profile.email,
      if (profile.phone != null) 'phone': profile.phone,
      if (profile.city != null) 'city': profile.city,
      if (profile.avatarUrl != null) 'avatarUrl': profile.avatarUrl,
      if (profile.accountType != null) 'accountType': profile.accountType,
      'isTrainee': profile.isTrainee,
      'updatedAt': FieldValue.serverTimestamp(),
    };
    payload.removeWhere((key, value) => value == null);
    return payload;
  }

  ProfileEntity _mapProfile(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const <String, dynamic>{};
    return ProfileEntity(
      id: doc.id,
      name: data['name'] as String?,
      email: data['email'] as String?,
      phone: data['phone'] as String?,
      city: data['city'] as String?,
      avatarUrl: data['avatarUrl'] as String?,
      accountType: data['accountType'] as String?,
      isTrainee: data['isTrainee'] as bool? ?? false,
    );
  }
}
