import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/data/local/cache/base/key_value_store_ex.dart';
import 'package:silah_app/core/data/local/cache/prefs/prefs_key.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/features/specifications/data/models/specification_item_model.dart';

abstract class SpecificationsLocalDataSource {
  Future<List<SpecificationItemModel>?> getOperators();
}

class SpecificationsLocalDataSourceImpl extends SpecificationsLocalDataSource {
  final AppCache appCache;
  final AppLogger logger;

  SpecificationsLocalDataSourceImpl({required this.appCache, required this.logger});

  @override
  Future<List<SpecificationItemModel>?> getOperators() async {
    return appCache.prefs.readObjectList<SpecificationItemModel>(
      key: PrefsKey.operators,
      fromJson: (json) => SpecificationItemModelMapper.fromJson(json),
    );
  }
}
