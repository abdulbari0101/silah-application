import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/data/local/cache/app_cache.dart';

import '../../../../../core/infrastructure/analytics/logger/app_logger.dart';
import '../../../../../core/infrastructure/errors/exceptions.dart';

abstract class IntroCacheDataSource {
  Future<void> cacheSomething(String name);
}

class IntroCacheDataSourceImpl extends IntroCacheDataSource {
  final AppCache appCache;
  final AppLogger logger;

  IntroCacheDataSourceImpl({required this.appCache, required this.logger});

  @override
  Future<void> cacheSomething(String name) async {
    try {
      if (name.isNullOrEmpty) {
        throw SecureStorageException('Empty name received');
      }

      //   await appCache.write(key: SecureKey.name, value: name);
    } catch (e, stack) {
      logger.cacheError(tag: 'cacheSomething', e, stack: stack);
      throw SecureStorageException('Failed to cache login name');
    }
  }
}
