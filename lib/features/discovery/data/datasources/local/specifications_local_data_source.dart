import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

abstract class SpecificationsLocalDataSource {}

class SpecificationsLocalDataSourceImpl extends SpecificationsLocalDataSource {
  final AppCache appCache;
  final AppLogger logger;

  SpecificationsLocalDataSourceImpl({
    required this.appCache,
    required this.logger,
  });
}
