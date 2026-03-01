import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/features/auth/data/models/auth_user_model.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

/// Firebase-backed authentication & profile service.
class AuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthService({FirebaseAuth? auth, FirebaseFirestore? firestore})
    : _auth = auth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<AuthUserModel> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );

    final user = _requireUser(credential.user, Strings.err_login.tr());
    final profile = await _fetchProfile(user.uid);
    final idToken = await _safeIdToken(user);

    AppLogger().networkInfo("token = $idToken", tag: "signIn");

    return _buildUserModel(user: user, profile: profile, idToken: idToken);
  }

  Future<AuthUserModel> registerUser({required AuthUserModel request}) async {
    final email = _requireValue(
      request.email,
      Strings.error_self_reg.tr(),
    ).trim();
    final password = _requireValue(
      request.password,
      Strings.error_self_reg.tr(),
    );
    final name = request.fullName?.trim() ?? '';
    final phone = request.phone?.trim() ?? '';
    final profile = _buildProfile(
      user: request,
      accountType: AuthAccountType.user,
      extra: {'name': name, 'email': email, 'phone': phone},
    );

    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final firebaseUser = _requireUser(
      credential.user,
      Strings.error_self_reg.tr(),
    );
    await firebaseUser.updateDisplayName(name);

    await _firestore.collection('users').doc(firebaseUser.uid).set(profile);

    final idToken = await _safeIdToken(firebaseUser);
    return _buildUserModel(
      user: firebaseUser,
      profile: _ProfileData(AuthAccountType.user, profile),
      idToken: idToken,
    );
  }

  Future<AuthUserModel> registerLawyer({required AuthUserModel request}) async {
    final email = _requireValue(
      request.email,
      Strings.error_self_reg.tr(),
    ).trim();
    final password = _requireValue(
      request.password,
      Strings.error_self_reg.tr(),
    );
    final name = request.fullName?.trim() ?? '';
    final phone = request.phone?.trim() ?? '';
    final profile = _buildProfile(
      user: request,
      accountType: AuthAccountType.lawyer,
      extra: {'name': name, 'email': email, 'phone': phone, 'verified': false},
    );

    final resolvedLegalFieldIds = await _resolveLegalFieldIds(profile);
    profile
      ..remove('legalFields')
      ..remove('legalField')
      ..remove('specializations');
    if (resolvedLegalFieldIds.isNotEmpty) {
      profile['legalFieldIds'] = resolvedLegalFieldIds;
    }

    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final firebaseUser = _requireUser(
      credential.user,
      Strings.error_self_reg.tr(),
    );
    await firebaseUser.updateDisplayName(name);

    await _firestore.collection('lawyers').doc(firebaseUser.uid).set(profile);

    final idToken = await _safeIdToken(firebaseUser);
    return _buildUserModel(
      user: firebaseUser,
      profile: _ProfileData(AuthAccountType.lawyer, profile),
      idToken: idToken,
    );
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email.trim());
  }

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = _requireUser(_auth.currentUser, Strings.err_reset_pass.tr());
    final email = _requireValue(user.email, Strings.err_reset_pass.tr());
    final current = _requireValue(currentPassword, Strings.err_reset_pass.tr());
    final next = _requireValue(newPassword, Strings.err_reset_pass.tr());

    final credential = EmailAuthProvider.credential(
      email: email,
      password: current,
    );
    await user.reauthenticateWithCredential(credential);
    await user.updatePassword(next);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<_ProfileData> _fetchProfile(String uid) async {
    final userDoc = await _firestore.collection('users').doc(uid).get();
    if (userDoc.exists) {
      return _ProfileData(AuthAccountType.user, userDoc.data());
    }

    final lawyerDoc = await _firestore.collection('lawyers').doc(uid).get();
    if (lawyerDoc.exists) {
      return _ProfileData(AuthAccountType.lawyer, lawyerDoc.data());
    }

    return const _ProfileData(AuthAccountType.user, null);
  }

  AuthUserModel _buildUserModel({
    required User user,
    required _ProfileData profile,
    String? idToken,
  }) {
    final data = profile.data ?? const <String, dynamic>{};
    final name = (data['name'] as String?)?.trim();
    final email = (data['email'] as String?) ?? user.email;
    final phone = (data['phone'] as String?) ?? user.phoneNumber;

    return AuthUserModel(
      uid: user.uid,
      accountType: profile.type,
      fullName: name ?? user.displayName,
      email: email,
      phone: phone,
      idToken: idToken,
      profile: data,
    );
  }

  Map<String, dynamic> _buildProfile({
    required AuthUserModel user,
    required AuthAccountType accountType,
    Map<String, dynamic>? extra,
  }) {
    final profile = <String, dynamic>{};
    if (user.profile != null) {
      profile.addAll(user.profile!);
    }
    if (extra != null) {
      profile.addAll(extra);
    }

    profile.remove('password');
    profile['accountType'] = accountType.name;
    profile['createdAt'] = FieldValue.serverTimestamp();
    profile.removeWhere((key, value) => value == null);
    return profile;
  }

  Future<List<String>> _resolveLegalFieldIds(
    Map<String, dynamic> profile,
  ) async {
    final ids = _parseStringList(profile['legalFieldIds']);
    if (ids.isNotEmpty) return ids;

    final names = _parseStringList(profile['legalFields']);
    if (names.isEmpty) return const <String>[];

    final snapshot = await _firestore.collection('specializations').get();
    final lookup = <String, String>{};
    for (final doc in snapshot.docs) {
      final data = doc.data();
      final nameAr = (data['nameAr'] as String?)?.trim();
      final nameEn = (data['nameEn'] as String?)?.trim();
      if (nameAr != null && nameAr.isNotEmpty) {
        lookup[nameAr.toLowerCase()] = doc.id;
      }
      if (nameEn != null && nameEn.isNotEmpty) {
        lookup[nameEn.toLowerCase()] = doc.id;
      }
    }

    final resolved = <String>[];
    for (final name in names) {
      final id = lookup[name.toLowerCase()];
      if (id != null && !resolved.contains(id)) {
        resolved.add(id);
      }
    }

    return resolved.isEmpty ? names : resolved;
  }

  List<String> _parseStringList(dynamic value) {
    final list = parseFirestoreStringList(value) ?? const <String>[];
    if (list.isNotEmpty) {
      return list
          .map((item) => item.trim())
          .where((item) => item.isNotEmpty)
          .toList();
    }
    if (value is String) {
      final trimmed = value.trim();
      return trimmed.isEmpty ? const <String>[] : <String>[trimmed];
    }
    return const <String>[];
  }

  String _requireValue(String? value, String message) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      throw AuthException(message, ErrorCodes.badRequest400);
    }
    return trimmed;
  }

  User _requireUser(User? user, String message) {
    if (user == null) {
      throw AuthException(message, ErrorCodes.badRequest400);
    }
    return user;
  }

  Future<String?> _safeIdToken(User user) async {
    try {
      return await user.getIdToken();
    } catch (_) {
      return null;
    }
  }
}

class _ProfileData {
  final AuthAccountType type;
  final Map<String, dynamic>? data;

  const _ProfileData(this.type, this.data);
}
