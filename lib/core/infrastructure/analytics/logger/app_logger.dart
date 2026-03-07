import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import 'app_log_group.dart';
import 'dev_log_output.dart';
import 'selective_output.dart';

part 'app_logger_ex.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  final Logger _logger;

  factory AppLogger() => _instance;

  AppLogger._internal()
    : _logger = Logger(
        printer: PrettyPrinter(
          methodCount: 0, // no Flutter call-stack noise
          errorMethodCount: 5,
          lineLength: 120, // wrap nicely in IDE / CI logs
          colors: !kReleaseMode, // keep colour only in debug
          printEmojis: false, // clean & professional
          noBoxingByDefault: true, // one-liner output
        ),
        output: kReleaseMode
            ? ConsoleOutput()
            : SelectiveOutput(
                devOutput: DevLogOutput(),
                fallback: ConsoleOutput(),
                groups: AppLogGroup.values.map((e) => e.name.toUpperCase()).toSet(),

                // groups: {
                //   AppLogGroup.bloc.name.toUpperCase(),

                //   },
                levels: Level.values.map((e) => e).toSet(),

                // levels: {Level.all, Level.info, Level.error , Level.debug ,Level.fatal ,Level.warning },
              ),
      );

  String _wrap(AppLogGroup group, String? tag, dynamic message) =>
      '[${group.name}] ${tag?.isNotEmpty == true ? '$tag → $message' : '$message'}';

  /// Logs debug info (only in debug mode)
  void _debug(
    dynamic msg, {
    required AppLogGroup group,
    String? tag,
    Object? error,
    StackTrace? stack,
  }) {
    if (!kReleaseMode) _logger.d(_wrap(group, tag, msg), error: error, stackTrace: stack);
  }

  void _info(
    dynamic msg, {
    required AppLogGroup group,
    String? tag,
    Object? error,
    StackTrace? stack,
  }) {
    if (!kReleaseMode) _logger.i(_wrap(group, tag, msg), error: error, stackTrace: stack);
  }

  void _warning(dynamic msg, {required AppLogGroup group, Object? error, StackTrace? stack}) {
    if (!kReleaseMode) _logger.w(_wrap(group, null, msg), error: error, stackTrace: stack);
  }

  /// Logs errors and sends them to Crashlytics in release mode
  void _error(dynamic error, {String? tag, StackTrace? stack, required AppLogGroup group}) {
    final message = _wrap(group, null, 'Error in $tag');

    // ─── Crashlytics only for selected groups ─────────────────
    final shouldReport = crashlyticsGroups.contains(group);

    if (kReleaseMode && shouldReport) {
      FirebaseCrashlytics.instance.recordError(error, stack, reason: message);
    } else {
      _logger.e(tag, error: error, stackTrace: stack);
    }
  }
}
