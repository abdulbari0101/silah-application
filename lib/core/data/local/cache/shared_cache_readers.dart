import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/data/local/cache/readers/setting_reader.dart';

class SharedCacheReaders {
  final IdentityReader identityReader;
  final SettingReader settingReader;

  SharedCacheReaders({
    required this.identityReader,
    required this.settingReader,
  });
}
