enum AppLogGroup { 
  init,
 network,
  api, 
  validation, 
  cache,
   database,
   bloc, 
   stream, 
   ui, 
   theme, 
   app 
   }

// reported to crashlytics on error
const crashlyticsGroups = {
  AppLogGroup.init,
  AppLogGroup.network,
  AppLogGroup.api,
  // AppLogGroup.validation,
  AppLogGroup.cache,
  AppLogGroup.database,
  AppLogGroup.bloc,
  AppLogGroup.stream,
  AppLogGroup.ui,
  AppLogGroup.theme,
  AppLogGroup.app,
};

extension LogGroupX on AppLogGroup {
  String get name => toString().split('.').last.toUpperCase();
}
