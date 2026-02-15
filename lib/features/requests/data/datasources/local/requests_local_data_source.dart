import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/data/local/cache/base/key_value_store_ex.dart';
import 'package:silah_app/core/data/local/cache/prefs/prefs_key.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/features/requests/data/models/request_item_model.dart';

abstract class RequestsLocalDataSource {
  Future<List<RequestItemModel>?> getOperators();
}

class RequestsLocalDataSourceImpl extends RequestsLocalDataSource {
  final AppCache appCache;
  final AppLogger logger;

  RequestsLocalDataSourceImpl({required this.appCache, required this.logger});

  @override
  Future<List<RequestItemModel>?> getOperators() async {
    return appCache.prefs.readObjectList<RequestItemModel>(
      key: PrefsKey.operators,
      fromJson: (json) => RequestItemModelMapper.fromJson(json),
    );
  }
}
