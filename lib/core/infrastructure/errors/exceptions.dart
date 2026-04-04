import 'package:silah_app/core/infrastructure/analytics/logger/app_log_group.dart';

import '../analytics/logger/loggable_exception.dart';

abstract class BaseAppException implements Exception, LoggableException {
  final String message;
  const BaseAppException(this.message);
  @override
  String toString() => '$runtimeType: $message';
}

// ––––– System –––––
class ServerException extends BaseAppException {
  final int code;
  const ServerException(super.m, this.code);

  @override
  AppLogGroup get logGroup => AppLogGroup.api;
}

class DatabaseException extends BaseAppException {
  const DatabaseException(super.m);
  @override
  AppLogGroup get logGroup => AppLogGroup.database;
}

class CacheException extends BaseAppException {
  const CacheException(super.m);

  @override
  AppLogGroup get logGroup => AppLogGroup.cache;
}

class LocationException extends BaseAppException {
  const LocationException(super.m);

  @override
  AppLogGroup get logGroup => AppLogGroup.app;
}

class RouteNotFoundException extends BaseAppException {
  const RouteNotFoundException(super.m);

  @override
  AppLogGroup get logGroup => AppLogGroup.validation;
}

class MissingDataException extends BaseAppException {
  const MissingDataException(super.m);

  @override
  AppLogGroup get logGroup => AppLogGroup.validation;
}

class StreamException extends BaseAppException {
  const StreamException(super.m);

  @override
  AppLogGroup get logGroup => AppLogGroup.stream;
}

class ConnectionException extends BaseAppException {
  const ConnectionException(super.m);

  @override
  AppLogGroup get logGroup => AppLogGroup.network;
}

// ––––– Storage –––––
class LocalStorageException extends BaseAppException {
  const LocalStorageException(super.m);

  @override
  AppLogGroup get logGroup => AppLogGroup.cache;
}

class SecureStorageException extends BaseAppException {
  const SecureStorageException(super.m);

  @override
  AppLogGroup get logGroup => AppLogGroup.cache;
}

class AppException extends BaseAppException {
  const AppException(super.m);

  @override
  AppLogGroup get logGroup => AppLogGroup.app;
}

// ––––– Networking –––––
class NetworkException extends ServerException {
  const NetworkException(super.m, super.c);
}

class TimeoutException extends ServerException {
  const TimeoutException(super.m, super.c);
}

class CertificateException extends ServerException {
  const CertificateException(super.m, super.c);
}

class ConflictException extends ServerException {
  const ConflictException(super.m, super.c);
}

// ––––– Auth –––––
class AuthException extends ServerException {
  const AuthException(super.m, super.c);
}

class SessionException extends ServerException {
  const SessionException(super.m, super.c);
}

class BadRequestException extends ServerException {
  const BadRequestException(super.m, super.c);
}
