import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/data/local/cache/base/key_value_store_ex.dart';
import 'package:silah_app/core/data/local/cache/prefs/prefs_key.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/features/messaging/data/models/chat_item_model.dart';

abstract class ChatsLocalDataSource {
  Future<List<ChatItemModel>?> getOperators();
}

class ChatsLocalDataSourceImpl extends ChatsLocalDataSource {
  final AppCache appCache;
  final AppLogger logger;

  ChatsLocalDataSourceImpl({required this.appCache, required this.logger});

  @override
  Future<List<ChatItemModel>?> getOperators() async {
    return appCache.prefs.readObjectList<ChatItemModel>(
      key: PrefsKey.operators,
      fromJson: (json) => ChatItemModelMapper.fromJson(json),
    );
  }
}
