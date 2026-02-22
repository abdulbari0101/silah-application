import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';

class FirebaseErrorHandler {
  static BaseAppException handle(FirebaseException e) {
    if (e is FirebaseAuthException) {
      return _handleAuth(e);
    }

    return _handleFirestore(e);
  }

  static BaseAppException _handleAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return AuthException(Strings.error_invalid_email.tr(), ErrorCodes.badRequest400);
      case 'user-disabled':
        return AuthException(Strings.err_forbidden.tr(), ErrorCodes.forbidden403);
      case 'user-not-found':
        return AuthException(Strings.err_not_found.tr(), ErrorCodes.notFound404);
      case 'wrong-password':
      case 'invalid-credential':
        return AuthException(Strings.msg_user_pass_not_correct.tr(), ErrorCodes.invalidUserPass11);
      case 'email-already-in-use':
        return AuthException(Strings.err_conflict.tr(), ErrorCodes.conflict409);
      case 'weak-password':
        return AuthException(Strings.password_min_length_error.tr(), ErrorCodes.unprocessable422);
      case 'operation-not-allowed':
        return ServerException(Strings.err_service_unavailable.tr(), ErrorCodes.serviceUnavailable503);
      case 'too-many-requests':
        return ServerException(Strings.rate_limited.tr(), 429);
      case 'network-request-failed':
        return NetworkException(Strings.err_no_internet_connection.tr(), ErrorCodes.noInternetNegtive100);
      default:
        return AuthException(Strings.unexpected_error.tr(), ErrorCodes.badRequest400);
    }
  }

  static BaseAppException _handleFirestore(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return ServerException(Strings.err_forbidden.tr(), ErrorCodes.forbidden403);
      case 'unauthenticated':
        return SessionException(Strings.err_unauthorized401.tr(), ErrorCodes.unauthorized401);
      case 'not-found':
        return ServerException(Strings.err_not_found.tr(), ErrorCodes.notFound404);
      case 'already-exists':
        return ConflictException(Strings.err_conflict.tr(), ErrorCodes.conflict409);
      case 'invalid-argument':
      case 'failed-precondition':
        return BadRequestException(Strings.err_bad_request.tr(), ErrorCodes.badRequest400);
      case 'resource-exhausted':
        return ServerException(Strings.rate_limited.tr(), 429);
      case 'deadline-exceeded':
        return TimeoutException(Strings.err_conn_timeout.tr(), ErrorCodes.requestTimeout408);
      case 'unavailable':
        return NetworkException(Strings.err_no_internet_connection.tr(), ErrorCodes.noInternetNegtive100);
      case 'cancelled':
      case 'aborted':
        return ServerException(Strings.err_request_cancelled.tr(), ErrorCodes.requestTimeout408);
      default:
        return ServerException(Strings.unexpected_error.tr(), ErrorCodes.internalServer500);
    }
  }
}
