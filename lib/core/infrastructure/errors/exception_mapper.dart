import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';

//
class ExceptionMapper {
  static Failure map(Exception e, {required String from, StackTrace? stack}) {
    switch (e) {
      case AuthException _:
        return AuthFailure(e.message, e.code);
      case SessionException _:
        return SessionFailure(e.message, code: e.code);

      case ConflictException _:
        return ConflictFailure(e.message, e.code);
      case NetworkException _:
        return NetworkFailure(e.message, code: e.code);
      case CertificateException _:
        return CertificateFailure(e.message, code: e.code);
      case TimeoutException _:
        return ServerFailure(e.message, code: e.code);
      case BadRequestException _:
        return BadRequestFailure(e.message, code: e.code);

      case ServerException _:
        return ServerFailure(e.message, code: e.code);

      case CacheException _:
        return CacheFailure(e.message);

      case StreamException _:
        return StreamFailure(e.message);
      case MissingDataException _:
        return MissingDataFailure(e.message);
      case SecureStorageException _:
        return SecureStorageFailure(e.message);
      case LocalStorageException _:
        return LocalStorageFailure(e.message);
      case DatabaseException _:
        return DatabaseFailure(e.message);
      case LocationException _:
        return LocationFailure(e.message);
      case RouteNotFoundException _:
        return RouteNotFoundFailure(e.message);

      default:
        return UnexpectedFailure(e.toString());
    }
  }
}
