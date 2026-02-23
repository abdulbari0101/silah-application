import 'package:silah_app/core/data/local/cache/app_cache.dart';

import '../../../../../core/infrastructure/analytics/logger/app_logger.dart';

abstract class IntroCacheDataSource {
}

class IntroCacheDataSourceImpl extends IntroCacheDataSource {
  final AppCache appCache;
  final AppLogger logger;

  IntroCacheDataSourceImpl({required this.appCache, required this.logger});


}
