import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';

/// Centralized authentication service wrapping Firebase Auth.
class AuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthService({FirebaseAuth? auth, FirebaseFirestore? firestore})
    : _auth = auth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

  /// Get current user.
  User? get currentUser => _auth.currentUser;

  /// Stream of auth state changes.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Sign in with email and password.
  Future<AuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return AuthResult.success(credential.user);
    } on FirebaseException catch (e) {
      return AuthResult.failure(
        _mapFirebaseError(e.code),
        errorCode: _mapFirebaseErrorCode(e.code),
      );
    } catch (_) {
      return AuthResult.failure(Strings.unexpected_error.tr());
    }
  }

  /// Create user account with email and password.
  Future<AuthResult> createUserAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      await credential.user?.updateDisplayName(name.trim());

      await _firestore.collection('users').doc(credential.user!.uid).set({
        'name': name.trim(),
        'email': email.trim(),
        'phone': phone.trim(),
        'accountType': 'user',
        'createdAt': FieldValue.serverTimestamp(),
      });

      return AuthResult.success(credential.user);
    } on FirebaseException catch (e) {
      return AuthResult.failure(
        _mapFirebaseError(e.code),
        errorCode: _mapFirebaseErrorCode(e.code),
      );
    } catch (_) {
      return AuthResult.failure(Strings.unexpected_error.tr());
    }
  }

  /// Create lawyer account with professional info.
  Future<AuthResult> createLawyerAccount({
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
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      await credential.user?.updateDisplayName(name.trim());

      await _firestore.collection('lawyers').doc(credential.user!.uid).set({
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
      });

      return AuthResult.success(credential.user);
    } on FirebaseException catch (e) {
      return AuthResult.failure(
        _mapFirebaseError(e.code),
        errorCode: _mapFirebaseErrorCode(e.code),
      );
    } catch (_) {
      return AuthResult.failure(Strings.unexpected_error.tr());
    }
  }

  /// Send password reset email.
  Future<AuthResult> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return AuthResult.success(null);
    } on FirebaseException catch (e) {
      return AuthResult.failure(
        _mapFirebaseError(e.code),
        errorCode: _mapFirebaseErrorCode(e.code),
      );
    } catch (_) {
      return AuthResult.failure(Strings.unexpected_error.tr());
    }
  }

  /// Sign out current user.
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// Map Firebase Auth error codes to localized messages.
  String _mapFirebaseError(String code) {
    switch (code) {
      case 'invalid-email':
        return Strings.error_invalid_email.tr();
      case 'user-disabled':
        return Strings.err_forbidden.tr();
      case 'user-not-found':
        return Strings.err_not_found.tr();
      case 'wrong-password':
      case 'invalid-credential':
        return Strings.msg_user_pass_not_correct.tr();
      case 'email-already-in-use':
        return Strings.err_conflict.tr();
      case 'weak-password':
        return Strings.password_min_length_error.tr();
      case 'operation-not-allowed':
        return Strings.err_service_unavailable.tr();
      case 'too-many-requests':
        return Strings.rate_limited.tr();
      case 'network-request-failed':
        return Strings.err_no_internet_connection.tr();
      default:
        return Strings.unexpected_error.tr();
    }
  }

  int _mapFirebaseErrorCode(String code) {
    switch (code) {
      case 'invalid-email':
        return ErrorCodes.badRequest400;
      case 'user-disabled':
        return ErrorCodes.forbidden403;
      case 'user-not-found':
        return ErrorCodes.notFound404;
      case 'wrong-password':
      case 'invalid-credential':
        return ErrorCodes.invalidUserPass11;
      case 'email-already-in-use':
        return ErrorCodes.conflict409;
      case 'weak-password':
        return ErrorCodes.unprocessable422;
      case 'operation-not-allowed':
        return ErrorCodes.serviceUnavailable503;
      case 'too-many-requests':
        return 429;
      case 'network-request-failed':
        return ErrorCodes.noInternetNegtive100;
      default:
        return ErrorCodes.badRequest400;
    }
  }
}

/// Result wrapper for auth operations.
class AuthResult {
  final bool isSuccess;
  final User? user;
  final String? errorMessage;
  final int? errorCode;

  const AuthResult._({required this.isSuccess, this.user, this.errorMessage, this.errorCode});

  factory AuthResult.success(User? user) => AuthResult._(isSuccess: true, user: user);

  factory AuthResult.failure(String message, {int? errorCode}) =>
      AuthResult._(isSuccess: false, errorMessage: message, errorCode: errorCode);
}
