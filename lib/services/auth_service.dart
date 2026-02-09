import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

/// Centralized authentication service wrapping Firebase Auth
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Stream of auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Sign in with email and password
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
      return AuthResult.failure(_mapFirebaseError(e.code));
    } catch (e) {
      return AuthResult.failure('حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.');
    }
  }

  /// Create user account with email and password
  Future<AuthResult> createUserAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      // Create Firebase Auth user
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // Update display name
      await credential.user?.updateDisplayName(name.trim());

      // Save user profile to Firestore
      await _firestore.collection('users').doc(credential.user!.uid).set({
        'name': name.trim(),
        'email': email.trim(),
        'phone': phone.trim(),
        'accountType': 'user',
        'createdAt': FieldValue.serverTimestamp(),
      });

      return AuthResult.success(credential.user);
    } on FirebaseException catch (e) {
      return AuthResult.failure(_mapFirebaseError(e.code));
    } catch (e) {
      return AuthResult.failure('حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.');
    }
  }

  /// Create lawyer account with all professional info
  Future<AuthResult> createLawyerAccount({
    // Personal info
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    // Professional info
    required String legalField,
    required String city,
    required String workplace,
    required String officeName,
    String? experienceYears,
    // License info
    required String licenseNumber,
    required String nationalId,
  }) async {
    try {
      // Create Firebase Auth user
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // Update display name
      await credential.user?.updateDisplayName(name.trim());

      // Save lawyer profile to Firestore
      await _firestore.collection('lawyers').doc(credential.user!.uid).set({
        // Personal info
        'name': name.trim(),
        'email': email.trim(),
        'phone': phone.trim(),
        'gender': gender,
        // Professional info
        'legalField': legalField,
        'city': city,
        'workplace': workplace,
        'officeName': officeName.trim(),
        'experienceYears': experienceYears?.trim() ?? '',
        // License info
        'licenseNumber': licenseNumber.trim(),
        'nationalId': nationalId.trim(),
        // Account status
        'accountType': 'lawyer',
        'verified': false, // Pending admin verification
        'createdAt': FieldValue.serverTimestamp(),
      });

      return AuthResult.success(credential.user);
    } on FirebaseException catch (e) {
      return AuthResult.failure(_mapFirebaseError(e.code));
    } catch (e) {
      return AuthResult.failure('حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.');
    }
  }

  /// Sign out current user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// Map Firebase Auth error codes to Arabic messages
  String _mapFirebaseError(String code) {
    switch (code) {
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح';
      case 'user-disabled':
        return 'تم تعطيل هذا الحساب';
      case 'user-not-found':
        return 'لا يوجد حساب بهذا البريد الإلكتروني';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة';
      case 'invalid-credential':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل';
      case 'weak-password':
        return 'كلمة المرور ضعيفة جداً';
      case 'operation-not-allowed':
        return 'تسجيل الدخول غير مفعل';
      case 'too-many-requests':
        return 'تم تجاوز عدد المحاولات المسموح. يرجى المحاولة لاحقاً';
      case 'network-request-failed':
        return 'فشل الاتصال بالإنترنت. يرجى التحقق من اتصالك';
      default:
        return 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';
    }
  }
}

/// Result wrapper for auth operations
class AuthResult {
  final bool isSuccess;
  final User? user;
  final String? errorMessage;

  AuthResult._({required this.isSuccess, this.user, this.errorMessage});

  factory AuthResult.success(User? user) {
    return AuthResult._(isSuccess: true, user: user);
  }

  factory AuthResult.failure(String message) {
    return AuthResult._(isSuccess: false, errorMessage: message);
  }
}
