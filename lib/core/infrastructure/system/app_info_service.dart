import 'package:dartz/dartz.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';

abstract class AppInfoService {
  Future<Either<Failure, String>> getAppVersion();
  Future<Either<Failure, String>> getPackageName();
}

class AppInfoServiceImpl implements AppInfoService {
  final PackageInfo packageInfo;
  final AppLogger logger;
  const AppInfoServiceImpl({required this.packageInfo, required this.logger});

  static const _tag = 'AppInfoService';

  @override
  Future<Either<Failure, String>> getAppVersion() async {
    try {
      final v = packageInfo.version.trim();
      return v.isNotNullOrEmpty
          ? Right(v)
          : Left(AppFailure("can't extract app version"));
    } catch (e, st) {
      logger.appError(e.toString(), tag: '$_tag.getAppVersion', stack: st);
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getPackageName() async {
    try {
      final p = packageInfo.packageName.trim();
      return p.isNotNullOrEmpty
          ? Right(p)
          : Left(AppFailure("can't extract packageName"));
    } catch (e, st) {
      logger.appError(e.toString(), tag: '$_tag.getPackageName', stack: st);
      return Left(AppFailure(e.toString()));
    }
  }
}
