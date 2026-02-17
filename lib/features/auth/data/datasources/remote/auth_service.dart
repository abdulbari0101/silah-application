import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/features/auth/data/models/auth_user_model.dart';

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

    return _buildUserModel(user: user, profile: profile, idToken: idToken);
  }

  Future<AuthUserModel> registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );

    final user = _requireUser(credential.user, Strings.error_self_reg.tr());
    await user.updateDisplayName(name.trim());

    final profile = {
      'name': name.trim(),
      'email': email.trim(),
      'phone': phone.trim(),
      'accountType': 'user',
      'createdAt': FieldValue.serverTimestamp(),
    };
    await _firestore.collection('users').doc(user.uid).set(profile);

    final idToken = await _safeIdToken(user);
    return _buildUserModel(user: user, profile: _ProfileData(AuthAccountType.user, profile), idToken: idToken);
  }

  Future<AuthUserModel> registerLawyer({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String legalField,
    required String city,
    required String workplace,
    required String officeName,
    String? experienceYears,
    required String licenseNumber,
    required String nationalId,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );

    final user = _requireUser(credential.user, Strings.error_self_reg.tr());
    await user.updateDisplayName(name.trim());

    final profile = {
      'name': name.trim(),
      'email': email.trim(),
      'phone': phone.trim(),
      'gender': gender,
      'legalField': legalField,
      'city': city,
      'workplace': workplace,
      'officeName': officeName.trim(),
      'experienceYears': experienceYears?.trim() ?? '',
      'licenseNumber': licenseNumber.trim(),
      'nationalId': nationalId.trim(),
      'accountType': 'lawyer',
      'verified': false,
      'createdAt': FieldValue.serverTimestamp(),
    };
    await _firestore.collection('lawyers').doc(user.uid).set(profile);

    final idToken = await _safeIdToken(user);
    return _buildUserModel(user: user, profile: _ProfileData(AuthAccountType.lawyer, profile), idToken: idToken);
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email.trim());
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
