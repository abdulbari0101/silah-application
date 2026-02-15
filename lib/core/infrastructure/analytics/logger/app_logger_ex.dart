part of 'app_logger.dart';

// API
extension ApiLogger on AppLogger {
  void apiDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.api, tag: tag, error: error, stack: stack);

  void apiInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.api, tag: tag, error: error, stack: stack);

  void apiWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.api, error: error, stack: stack);

  void apiError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.api);
}

// Bloc
extension BlocLogger on AppLogger {
  void blocDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.bloc, tag: tag, error: error, stack: stack);

  void blocInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.bloc, tag: tag, error: error, stack: stack);

  void blocWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.bloc, error: error, stack: stack);

  void blocError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.bloc);
}

// Cache
extension CacheLogger on AppLogger {
  void cacheDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.cache, tag: tag, error: error, stack: stack);

  void cacheInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.cache, tag: tag, error: error, stack: stack);

  void cacheWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.cache, error: error, stack: stack);

  void cacheError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.cache);
}

// UI
extension UiLogger on AppLogger {
  void uiDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.ui, tag: tag, error: error, stack: stack);

  void uiInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.ui, tag: tag, error: error, stack: stack);

  void uiWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.ui, error: error, stack: stack);

  void uiError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.ui);
}

// Theme

extension ThemeLogger on AppLogger {
  void themeDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.theme, tag: tag, error: error, stack: stack);

  void themeInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.theme, tag: tag, error: error, stack: stack);

  void themeWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.theme, error: error, stack: stack);

  void themeError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.theme);
}

// Init

extension InitLogger on AppLogger {
  void initDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.init, tag: tag, error: error, stack: stack);

  void initInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.init, tag: tag, error: error, stack: stack);

  void initWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.init, error: error, stack: stack);

  void initError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.init);
}

// Network
extension NetworkLogger on AppLogger {
  void networkDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.network, tag: tag, error: error, stack: stack);

  void networkInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.network, tag: tag, error: error, stack: stack);

  void networkWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.network, error: error, stack: stack);

  void networkError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.network);
}

// App

extension AppLoggerEx on AppLogger {
  void appDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.app, tag: tag, error: error, stack: stack);

  void appInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.app, tag: tag, error: error, stack: stack);

  void appWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.app, error: error, stack: stack);

  void appError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.app);
}

// Validation

extension ValidationLogger on AppLogger {
  void validationDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.validation, tag: tag, error: error, stack: stack);

  void validationInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.validation, tag: tag, error: error, stack: stack);

  void validationWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.validation, error: error, stack: stack);

  void validationError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.validation);
}

// Database

extension DatabaseLogger on AppLogger {
  void databaseDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.database, tag: tag, error: error, stack: stack);

  void databaseInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.database, tag: tag, error: error, stack: stack);

  void databaseWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.database, error: error, stack: stack);

  void databaseError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.database);
}

// Stream

extension StreamLogger on AppLogger {
  void streamDebug(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _debug(msg, group: AppLogGroup.stream, tag: tag, error: error, stack: stack);

  void streamInfo(dynamic msg, {String? tag, Object? error, StackTrace? stack}) =>
      _info(msg, group: AppLogGroup.stream, tag: tag, error: error, stack: stack);

  void streamWarn(dynamic msg, {Object? error, StackTrace? stack}) =>
      _warning(msg, group: AppLogGroup.stream, error: error, stack: stack);

  void streamError(dynamic error, {String? tag, StackTrace? stack}) =>
      _error(  error,tag: tag, stack: stack, group: AppLogGroup.stream);
}

