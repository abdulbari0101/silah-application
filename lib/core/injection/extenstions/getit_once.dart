import 'package:get_it/get_it.dart';

extension GetItOnce on GetIt {
  bool _already<T extends Object>({String? name}) => isRegistered<T>(instanceName: name);

  Future<void> registerSingletonAsyncOnce<T extends Object>(
    Future<T> Function() factory, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool signalsReady = false,
  }) async {
    if (_already<T>(name: instanceName)) return;
    registerSingletonAsync<T>(
      factory,
      instanceName: instanceName,
      dependsOn: dependsOn,
      signalsReady: signalsReady,
    );
  }

  void registerSingletonWithDependenciesOnce<T extends Object>(
    T Function() factory, {
    Iterable<Type>? dependsOn,
    String? instanceName,
    bool signalsReady = false,
  }) {
    if (_already<T>(name: instanceName)) return;
    registerSingletonWithDependencies<T>(
      factory,
      dependsOn: dependsOn,
      instanceName: instanceName,
      signalsReady: signalsReady,
    );
  }

  void registerLazySingletonOnce<T extends Object>(
    T Function() factory, {
    String? instanceName,
  }) {
    if (_already<T>(name: instanceName)) return;
    registerLazySingleton<T>(factory, instanceName: instanceName);
  }

  void registerSingletonOnce<T extends Object>(
    T instance, {
    String? instanceName,
  }) {
    if (_already<T>(name: instanceName)) return;
    registerSingleton<T>(instance, instanceName: instanceName);
  }
}
