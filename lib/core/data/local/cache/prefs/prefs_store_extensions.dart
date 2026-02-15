import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:path_provider/path_provider.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/data/local/cache/prefs/prefs_key.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';

import 'prefs_store.dart';

extension ImageCacheExt on PrefsStore {
  static final _log = AppLogger();

  Future<void> saveImage({
    required PrefsKey key,
    required String userId,
    required File file,
  }) async {
    try {
      final bytes = await file.readAsBytes();
      await write(key: key, value: base64Encode(bytes), userId: userId);
    } catch (error, stack) {
      _log.cacheError(tag: 'ImageCacheExt.saveImage', error, stack: stack);
      throw LocalStorageException(Strings.cache_error.tr());
    }
  }

  Future<Uint8List?> readImageBytes({required PrefsKey key, required String userId}) async {
    final raw = await read(key: key, userId: userId); // parent-guarded
    if (raw == null || raw.isEmpty) return null;

    try {
      return base64Decode(raw);
    } catch (e, s) {
      _log.cacheError(tag: 'ImageCacheExt.readImageBytes.decode', e, stack: s);

      try {
        await tryDeleteSilently(key: key, userId: userId);
      } catch (_) {}
      return null;
    }
  }

  Future<File?> readImageFile({required PrefsKey key, required String userId}) async {
    final bytes = await readImageBytes(key: key, userId: userId);
    if (bytes == null) return null;

    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/${key.name}_$userId.jpg');
      return await file.writeAsBytes(bytes); // file I/O may throw
    } catch (e, s) {
      _log.cacheError(tag: 'ImageCacheExt.readImageFile.write', e, stack: s);
      throw LocalStorageException(Strings.cache_error.tr());
    }
  }

  Future<bool> deleteImage({required PrefsKey key, required String userId}) {
    return delete(key: key, userId: userId);
  }
}
