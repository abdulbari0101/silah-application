import 'app_log_group.dart';

/// Implement on exceptions that want to influence how they’re logged.
mixin LoggableException on Exception {
  /// Which logger extension should be used (API, DB, …)?
  AppLogGroup get logGroup => AppLogGroup.app;
}
