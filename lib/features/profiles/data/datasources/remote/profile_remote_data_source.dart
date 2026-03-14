import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/foundation/parsing/profile_field_reader.dart';
import 'package:silah_app/features/profiles/domain/entities/profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> fetchProfile();
  Future<ProfileEntity> updateProfile(ProfileEntity profile);
  Future<String> uploadAvatar({required File imageFile, String? accountType});
  String? currentUserId();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  static const String _usersCollection = 'users';
  static const String _lawyersCollection = 'lawyers';
  static const String _accountTypeUser = 'user';
  static const String _accountTypeLawyer = 'lawyer';
  static const String _accountTypeAdmin = 'admin';

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;
  final AppLogger logger;

  ProfileRemoteDataSourceImpl({
    required this.logger,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
    FirebaseStorage? storage,
  }) : firestore = firestore ?? FirebaseFirestore.instance,
       auth = auth ?? FirebaseAuth.instance,
       storage = storage ?? FirebaseStorage.instance;

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
        final resolved = await _resolveProfileDocument(uid);
        if (resolved == null) {
          final authUser = auth.currentUser;
          return ProfileEntity(
            id: uid,
            name: authUser?.displayName,
            email: authUser?.email,
            phone: authUser?.phoneNumber,
            avatarUrl: authUser?.photoURL,
            accountType: _accountTypeUser,
          );
        }
        return _mapProfileWithVerification(
          resolved.doc,
          fallbackAccountType: resolved.defaultAccountType,
          authUser: auth.currentUser,
        );
      },
    );
  }

  @override
  Future<ProfileEntity> updateProfile(ProfileEntity profile) {
    return firebaseCall<ProfileEntity>(
      method: 'ProfileRemoteDataSource.updateProfile',
      logger: logger,
      payload: _buildPayload(
        profile,
        accountType:
            _normalizeAccountType(profile.accountType) ?? _accountTypeUser,
      ),
      call: () async {
        final uid = currentUserId();
        if (uid == null) {
          return profile;
        }
        final normalizedType = _normalizeAccountType(profile.accountType);
        final resolved = await _resolveProfileDocument(
          uid,
          preferredAccountType: normalizedType,
        );

        final targetCollection = _targetCollection(
          normalizedType: normalizedType,
          fallbackCollection: resolved?.collection,
        );
        final defaultAccountType = _defaultAccountTypeForCollection(
          targetCollection,
        );

        await firestore
            .collection(targetCollection)
            .doc(uid)
            .set(
              _buildPayload(
                profile,
                accountType: normalizedType ?? defaultAccountType,
              ),
              SetOptions(merge: true),
            );
        final doc = await firestore.collection(targetCollection).doc(uid).get();
        if (!doc.exists) {
          return profile.copyWith(
            id: uid,
            accountType: normalizedType ?? defaultAccountType,
          );
        }
        return _mapProfileWithVerification(
          doc,
          fallbackAccountType: normalizedType ?? defaultAccountType,
          authUser: auth.currentUser,
        );
      },
    );
  }

  @override
  Future<String> uploadAvatar({required File imageFile, String? accountType}) {
    return firebaseCall<String>(
      method: 'ProfileRemoteDataSource.uploadAvatar',
      logger: logger,
      payload: {'accountType': _normalizeAccountType(accountType)},
      call: () async {
        final uid = currentUserId();
        if (uid == null) {
          return '';
        }

        final normalizedType = _normalizeAccountType(accountType);
        final resolved = await _resolveProfileDocument(
          uid,
          preferredAccountType: normalizedType,
        );
        final targetCollection = _targetCollection(
          normalizedType: normalizedType,
          fallbackCollection: resolved?.collection,
        );
        final path =
            'profile_avatars/$targetCollection/$uid/avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final ref = storage.ref().child(path);
        await ref.putFile(
          imageFile,
          SettableMetadata(contentType: 'image/jpeg'),
        );
        return ref.getDownloadURL();
      },
    );
  }

  Map<String, dynamic> _buildPayload(
    ProfileEntity profile, {
    required String accountType,
  }) {
    final normalizedType =
        _normalizeAccountType(accountType) ?? _accountTypeUser;
    final isLawyer = normalizedType == _accountTypeLawyer;
    final payload = <String, dynamic>{
      if (profile.name != null) 'name': profile.name,
      if (profile.email != null) 'email': profile.email,
      if (profile.phone != null) 'phone': profile.phone,
      if (profile.city != null) 'city': profile.city,
      if (profile.avatarUrl != null) 'avatarUrl': profile.avatarUrl,
      'accountType': normalizedType,
      if (isLawyer) 'acceptsTrainees': profile.isTrainee,
      if (!isLawyer) 'isTrainee': profile.isTrainee,
      'updatedAt': FieldValue.serverTimestamp(),
    };
    payload.removeWhere((key, value) => value == null);
    return payload;
  }

  Future<ProfileEntity> _mapProfileWithVerification(
    DocumentSnapshot<Map<String, dynamic>> doc, {
    required String fallbackAccountType,
    User? authUser,
  }) async {
    final profile = _mapProfile(
      doc,
      fallbackAccountType: fallbackAccountType,
      authUser: authUser,
    );
    if ((profile.accountType ?? '').toLowerCase() != _accountTypeLawyer) {
      return profile;
    }

    final verificationDoc = await firestore
        .collection('license_verifications')
        .doc(doc.id)
        .get();
    final verificationData =
        verificationDoc.data() ?? const <String, dynamic>{};
    return profile.copyWith(
      verificationStatus: ProfileFieldReader.firstNonEmpty([
        verificationData['status'],
      ]),
    );
  }

  ProfileEntity _mapProfile(
    DocumentSnapshot<Map<String, dynamic>> doc, {
    required String fallbackAccountType,
    User? authUser,
  }) {
    final data = doc.data() ?? const <String, dynamic>{};
    final accountType =
        _normalizeAccountType(data['accountType']) ?? fallbackAccountType;

    final name = ProfileFieldReader.readDisplayName(
      data,
      fallbackValues: [authUser?.displayName],
    );
    final email = ProfileFieldReader.firstNonEmpty([
      data['email'],
      authUser?.email,
    ]);
    final phone = ProfileFieldReader.firstNonEmpty([
      data['phone'],
      authUser?.phoneNumber,
    ]);
    final city = ProfileFieldReader.firstNonEmpty([data['city']]);
    final avatarUrl = ProfileFieldReader.readAvatarUrl(
      data,
      fallbackValues: [authUser?.photoURL],
    );
    final isTrainee =
        _parseBool(data['isTrainee']) ??
        _parseBool(data['acceptsTrainees']) ??
        false;
    final verified = _parseBool(data['verified']);

    return ProfileEntity(
      id: doc.id,
      name: name,
      email: email,
      phone: phone,
      city: city,
      avatarUrl: avatarUrl,
      accountType: accountType,
      isTrainee: isTrainee,
      verified: verified,
    );
  }

  Future<_ResolvedProfileDocument?> _resolveProfileDocument(
    String uid, {
    String? preferredAccountType,
  }) async {
    final normalizedType = _normalizeAccountType(preferredAccountType);
    if (normalizedType == _accountTypeLawyer) {
      return _readPreferredThenFallback(
        uid,
        preferredCollection: _lawyersCollection,
      );
    }
    if (normalizedType == _accountTypeUser ||
        normalizedType == _accountTypeAdmin) {
      return _readPreferredThenFallback(
        uid,
        preferredCollection: _usersCollection,
      );
    }

    final usersFuture = firestore.collection(_usersCollection).doc(uid).get();
    final lawyersFuture = firestore
        .collection(_lawyersCollection)
        .doc(uid)
        .get();
    final usersDoc = await usersFuture;
    final lawyersDoc = await lawyersFuture;

    if (!usersDoc.exists && !lawyersDoc.exists) {
      return null;
    }
    if (usersDoc.exists && !lawyersDoc.exists) {
      return _resolvedDoc(collection: _usersCollection, doc: usersDoc);
    }
    if (!usersDoc.exists && lawyersDoc.exists) {
      return _resolvedDoc(collection: _lawyersCollection, doc: lawyersDoc);
    }

    final usersData = usersDoc.data() ?? const <String, dynamic>{};
    final lawyersData = lawyersDoc.data() ?? const <String, dynamic>{};
    final usersType = _normalizeAccountType(usersData['accountType']);
    final lawyersType = _normalizeAccountType(lawyersData['accountType']);

    if (usersType == _accountTypeUser || usersType == _accountTypeAdmin) {
      return _resolvedDoc(collection: _usersCollection, doc: usersDoc);
    }
    if (lawyersType == _accountTypeLawyer || usersType == _accountTypeLawyer) {
      return _resolvedDoc(collection: _lawyersCollection, doc: lawyersDoc);
    }

    final usersScore = _profileDataScore(usersData);
    final lawyersScore = _profileDataScore(lawyersData);
    if (lawyersScore > usersScore) {
      return _resolvedDoc(collection: _lawyersCollection, doc: lawyersDoc);
    }
    return _resolvedDoc(collection: _usersCollection, doc: usersDoc);
  }

  Future<_ResolvedProfileDocument?> _readPreferredThenFallback(
    String uid, {
    required String preferredCollection,
  }) async {
    final fallbackCollection = preferredCollection == _usersCollection
        ? _lawyersCollection
        : _usersCollection;

    final preferredDoc = await firestore
        .collection(preferredCollection)
        .doc(uid)
        .get();
    if (preferredDoc.exists) {
      return _resolvedDoc(collection: preferredCollection, doc: preferredDoc);
    }

    final fallbackDoc = await firestore
        .collection(fallbackCollection)
        .doc(uid)
        .get();
    if (fallbackDoc.exists) {
      return _resolvedDoc(collection: fallbackCollection, doc: fallbackDoc);
    }
    return null;
  }

  _ResolvedProfileDocument _resolvedDoc({
    required String collection,
    required DocumentSnapshot<Map<String, dynamic>> doc,
  }) {
    return _ResolvedProfileDocument(
      collection: collection,
      defaultAccountType: _defaultAccountTypeForCollection(collection),
      doc: doc,
    );
  }

  int _profileDataScore(Map<String, dynamic> data) {
    var score = 0;
    if (ProfileFieldReader.readDisplayName(data) != null) score += 2;
    if (ProfileFieldReader.firstNonEmpty([data['email']]) != null) score += 2;
    if (ProfileFieldReader.firstNonEmpty([data['phone']]) != null) score += 2;
    if (ProfileFieldReader.readAvatarUrl(data) != null) {
      score += 1;
    }
    if (_parseBool(data['acceptsTrainees']) == true) score += 1;
    if (_parseBool(data['isTrainee']) == true) score += 1;
    return score;
  }

  String _targetCollection({
    required String? normalizedType,
    required String? fallbackCollection,
  }) {
    if (normalizedType == _accountTypeLawyer) {
      return _lawyersCollection;
    }
    if (normalizedType == _accountTypeAdmin ||
        normalizedType == _accountTypeUser) {
      return _usersCollection;
    }
    return fallbackCollection ?? _usersCollection;
  }

  String _defaultAccountTypeForCollection(String collection) {
    return collection == _lawyersCollection
        ? _accountTypeLawyer
        : _accountTypeUser;
  }

  String? _normalizeAccountType(dynamic value) {
    final normalized = value?.toString().trim().toLowerCase();
    if (normalized == _accountTypeLawyer ||
        normalized == _accountTypeUser ||
        normalized == _accountTypeAdmin) {
      return normalized;
    }
    return null;
  }

  bool? _parseBool(dynamic value) {
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      if (normalized == 'true' || normalized == '1') return true;
      if (normalized == 'false' || normalized == '0') return false;
    }
    return null;
  }
}

class _ResolvedProfileDocument {
  final String collection;
  final String defaultAccountType;
  final DocumentSnapshot<Map<String, dynamic>> doc;

  const _ResolvedProfileDocument({
    required this.collection,
    required this.defaultAccountType,
    required this.doc,
  });
}
