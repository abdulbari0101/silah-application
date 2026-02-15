import 'package:equatable/equatable.dart';

import 'package:silah_app/core/infrastructure/errors/error_source.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? code;
  const Failure(this.message, {this.code});

  @override
  List<Object?> get props => [message, code];
}

// ––––– General –––––
class AppFailure extends Failure {
  const AppFailure(super.m, {super.code});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.m, {super.code});
}

class ServerFailure extends Failure {
  const ServerFailure(super.m, {super.code});
}

// ––––– Connectivity –––––
class ConnectionFailure extends Failure {
  const ConnectionFailure(super.m, {super.code});
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.m, {super.code});
}

class CertificateFailure extends Failure {
  const CertificateFailure(super.m, {super.code});
}

// ––––– Auth & Input –––––
class AuthFailure extends Failure {
  const AuthFailure(super.m, int code) : super(code: code);
}

class ConflictFailure extends Failure {
  const ConflictFailure(super.m, int code) : super(code: code);
}

// small, code-less variants
class BadRequestFailure extends Failure {
  const BadRequestFailure(super.m, {super.code});
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure(super.m, {super.code});
}

class UnauthorisedFailure extends Failure {
  const UnauthorisedFailure(super.m, {super.code});
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure(super.m, {super.code});
}

class AccountNotActiveFailure extends Failure {
  const AccountNotActiveFailure(super.m, {super.code});
}

class EmptyFailure extends Failure {
  const EmptyFailure(super.m, {super.code});
}

// ––––– Storage –––––
class CacheFailure extends Failure {
  const CacheFailure(super.m, {super.code});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.m, {super.code});
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure(super.m, {super.code});
}

class SecureStorageFailure extends Failure {
  const SecureStorageFailure(super.m, {super.code});
}

// ––––– Navigation –––––
class RouteNotFoundFailure extends Failure {
  const RouteNotFoundFailure(super.m, {super.code});
}

class LocationFailure extends Failure {
  const LocationFailure(super.m, {super.code});
}

class StreamFailure extends Failure {
  const StreamFailure(super.m, {super.code});
}

class MissingDataFailure extends Failure {
  const MissingDataFailure(super.m, {super.code});
}

// ––––– Session –––––
class SessionFailure extends Failure {
  final ErrorSource source;

  const SessionFailure(
    super.m, {
    this.source = ErrorSource.server,
    super.code,
  });

  @override
  List<Object?> get props => [message, code, source];
}

