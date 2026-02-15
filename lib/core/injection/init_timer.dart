import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/injection/injection_container.dart';

AppLogger _log() => AppLogger();

Future<void> timeReady<T extends Object>(String name) async {
  // Always wait, but only measure/log in debug/profile.
  if (kReleaseMode) {
    await locator.isReady<T>();
    return;
  }
  final sw = Stopwatch()..start();
  await locator.isReady<T>();
  sw.stop();
  _log().initInfo('$name.ready took ${sw.elapsedMilliseconds} ms', tag: 'Init');
}

Future<T> timeAsync<T>(String name, Future<T> Function() run, {String tag = 'Init'}) async {
  if (kReleaseMode) return await run();
  final sw = Stopwatch()..start();
  try {
    return await run();
  } finally {
    sw.stop();
    _log().initInfo('$name took ${sw.elapsedMilliseconds} ms', tag: tag);
  }
}

T timeSync<T>(String name, T Function() run, {String tag = 'Init'}) {
  if (kReleaseMode) return run();
  final sw = Stopwatch()..start();
  try {
    return run();
  } finally {
    sw.stop();
    _log().initInfo('$name took ${sw.elapsedMilliseconds} ms', tag: tag);
  }
}
