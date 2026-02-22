import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

abstract class SupportLocalDataSource {
}

class SupportLocalDataSourceImpl extends SupportLocalDataSource {
  final AppCache appCache;
  final AppLogger logger;

  SupportLocalDataSourceImpl({required this.appCache, required this.logger});

}
