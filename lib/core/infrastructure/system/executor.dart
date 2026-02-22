import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_log_group.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/loggable_exception.dart';
import 'package:silah_app/core/infrastructure/errors/exception_mapper.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/network/network_info.dart';

import '../errors/exceptions.dart';

class Executor {
  final Netwokinfo networkInfo;
  final AppLogger logger;

  const Executor({required this.networkInfo, required this.logger});

  Future<Either<Failure, T>> runOffline<T>(
    Future<T> Function() action, {
    Failure Function(BaseAppException e, StackTrace stack)? onError,
    required String from,
  }) async {
    return _run(action, from: from, onError: onError);
  }

  Future<Either<Failure, T>> runOnline<T>(
    Future<T> Function() action, {
    Failure Function(BaseAppException e, StackTrace stack)? onError,
    required String from,
  }) async {
    if (!ApiConstants.isDemoMode && !await networkInfo.isConnected) {
      logger.networkError(tag: from, Strings.err_no_internet_connection.tr());
      return Left(ConnectionFailure(Strings.err_no_internet_connection.tr()));
    }

    return _run(action, from: from, onError: onError);
  }

  Future<Either<Failure, T>> _run<T>(
    Future<T> Function() action, {
    Failure Function(BaseAppException e, StackTrace stack)? onError,
    required String from,
  }) async {
    try {
      final result = await action();
      return Right(result);
    } on BaseAppException catch (e, stack) {
      logger.networkDebug(tag: "execturor BaseAppException", "e type = ${e.runtimeType}");

      logError(from: from, e: e, stack: stack);
      final mapped = onError?.call(e, stack) ?? ExceptionMapper.map(e, from: from, stack: stack);
      return Left(mapped);
    } catch (e, stack) {
      logger.networkDebug(tag: "execturor", "e type = ${e.runtimeType}");

      logger.appError(tag: from, e, stack: stack);
      //    final mapped = onError?.call(e) ?? ExceptionMapper.map(e, from: from, stack: stack);

      return Left(UnexpectedFailure(e.toString()));
    }
  }

  void logError({required String from, required Object e, StackTrace? stack}) {
    final group = (e is LoggableException) ? e.logGroup : AppLogGroup.app;

    final loggerFn = <AppLogGroup, void Function()>{
      AppLogGroup.api: () {
        logger.apiError(tag: from, e, stack: stack); // already logged in remoteDS data source
      },
      AppLogGroup.cache: () {
        logger.cacheInfo(tag: from, e, stack: stack); // already logged
      },
      AppLogGroup.database: () {
        logger.databaseError(tag: from, e, stack: stack); // already logged
      },
      AppLogGroup.validation: () {
        logger.validationError(tag: from, e, stack: stack);
      },
      AppLogGroup.stream: () {
        logger.streamError(tag: from, e, stack: stack); // already logged
      },
      AppLogGroup.bloc: () {
        logger.blocError(tag: from, e, stack: stack); // already logged
      },
      AppLogGroup.ui: () {
        logger.uiError(tag: from, e, stack: stack); // already logged
      },
      AppLogGroup.network: () {
        logger.networkError(tag: from, e, stack: stack); // already logged
      },
      AppLogGroup.theme: () {
        logger.themeError(tag: from, e, stack: stack); // already logged
      },
      AppLogGroup.init: () {
        logger.initError(tag: from, e, stack: stack); // already logged
      },
      AppLogGroup.app: () {
        logger.appError(tag: from, e, stack: stack);
      },
    }[group]!; // group is always present

    loggerFn(); // execute the chosen function
  }
}
