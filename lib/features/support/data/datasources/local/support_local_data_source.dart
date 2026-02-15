import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/data/local/cache/base/key_value_store_ex.dart';
import 'package:silah_app/core/data/local/cache/prefs/prefs_key.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/features/support/data/models/support_item_model.dart';

abstract class SupportLocalDataSource {
  Future<List<SupportItemModel>?> getOperators();
}

class SupportLocalDataSourceImpl extends SupportLocalDataSource {
  final AppCache appCache;
  final AppLogger logger;

  SupportLocalDataSourceImpl({required this.appCache, required this.logger});

  @override
  Future<List<SupportItemModel>?> getOperators() async {
    return appCache.prefs.readObjectList<SupportItemModel>(
      key: PrefsKey.operators,
      fromJson: (json) => SupportItemModelMapper.fromJson(json),
    );
  }
}
