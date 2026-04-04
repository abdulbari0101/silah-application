import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/config/router/global_navigator.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';

abstract class LocaleManager {
  /// Applies language, local data updated by AppSettingBloc
  Future<Either<Failure, bool>> applyLanguage(AppLanguage language);
}

class LocaleManagerImpl implements LocaleManager {
  final AppLogger logger;
  LocaleManagerImpl({required this.logger});

  @override
  Future<Either<Failure, bool>> applyLanguage(AppLanguage language) async {
    try {
      // Use a context that lives INSIDE EasyLocalization (via MaterialApp’s navigatorKey)
      final ctx = rootNavigatorKey.currentContext;

      logger.uiInfo('currentContext $ctx', tag: 'LocaleManager.currentContext');

      if (ctx == null) {
        logger.uiError(
          StateError('applyLanguage: rootNavigatorKey.currentContext is null'),
          tag: 'LocaleManager.applyLanguage',
        );
        return Left(AppFailure('rootNavigatorKey.currentContext is null'));
      }

      final target = language.toLocale();
      if (ctx.locale == target) {
        logger.uiInfo(
          'Locale already ${target.languageCode}',
          tag: 'LocaleManager.applyLanguage',
        );
        return const Right(true);
      }

      logger.uiInfo(
        'Changing locale to $target',
        tag: 'LocaleManager.applyLanguage',
      );
      await ctx.setLocale(target);
      logger.uiInfo(
        'Locale changed successfully applayd to ${ctx.locale}',
        tag: 'LocaleManager.applyLanguage',
      );

      return const Right(true);
    } catch (e, stack) {
      logger.uiError(e, tag: 'LocaleManager.applyLanguage', stack: stack);
      return Left(AppFailure(e.toString()));
    }
  }
}
