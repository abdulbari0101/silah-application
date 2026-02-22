import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:silah_app/core/bootstrap/once_runner.dart';
import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/ui_error_bus.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';
import 'package:silah_app/core/infrastructure/system/session_timeout_service.dart';
import 'package:silah_app/core/injection/init_timer.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/sesstion_bloc/sesstion_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/wrapper/sesstion_listener.dart';
import 'package:silah_app/core/presentation/ui/app/android_app.dart';
import 'package:silah_app/core/presentation/ui/app/ios_app.dart';
import 'package:silah_app/features/app_shell/presentation/views/welcome/screens/welcome_screen.dart';
import 'package:silah_app/integrations/notifications/local_notification_service.dart';
import 'package:silah_app/mappers.init.dart';
import 'core/bootstrap/app_rebuilder.dart';
import 'core/config/localization/app_language.dart';
import 'core/config/theme/roles/shapes.dart';
import 'core/bootstrap/bootstrap_service.dart';
import 'core/config/simple_bloc_observer.dart';
import 'core/config/theme/theme_controller.dart';
import 'core/injection/injection_container.dart' as di;
import 'core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'core/presentation/state_magment/cubits/iItem_loading_cubit.dart';
import 'core/presentation/ui/startup/boot_error_screen.dart';

import 'features/auth/presentation/blocs/login/login_bloc.dart';

import 'integrations/notifications/noification_config.dart';

bool _bootstrapped = false;
Zone? _uiZone; // ensure runApp is always called from the same zone as bindings
void _handleTopLevelError({
  required String message,
  required Object error,
  required StackTrace stack,
}) {
  if (_bootstrapped) {
    // App already running → show non-fatal overlay via UiErrorHost
    UiErrorBus.i.emit(
      UiError(
        title: "Unexpected error",
        message: message,
        error: error,
        stack: stack,
      ),
    );
    return;
  }

  // Still booting → show fatal screen
  _mountFatalUI(message: message, error: error, stack: stack);
}

final _once = OnceRunner();
Future<void> main() async {
  await runAppInZone();
}

Future<void> runAppInZone() async {
  await runZonedGuarded(
    () async {
      _uiZone = Zone.current;
      WidgetsFlutterBinding.ensureInitialized();
      await _startApp();
    },
    (error, stack) {
      AppLogger().appError(error, tag: 'zone', stack: stack);
      final z = _uiZone;
      if (z != null) {
        z.runGuarded(
          () => _handleTopLevelError(
            message: 'Unexpected error during startup.',
            error: error,
            stack: stack,
          ),
        );
      } else {
        _handleTopLevelError(
          message: 'Unexpected error during startup.',
          error: error,
          stack: stack,
        );
      }
    },
  );
}

Future<void> _startApp() async {
  if (!_bootstrapped) {
    await _initLocalServices();
    await _lockOrientation();
    await _initFirebase();
    _wireCrashlyticsHandlers();
    _setupMessaging();
    await _setupNotifications();
    _setupBlocObserver();
    await _initDi();
    await _validatePlatform();
    await _initLocalizationAndMappers();
    _bootstrapped = true;
  }

  // Load boot data (kept for potential future use)
  await _initStep<BootData?>(
    'loadAndApplyInitialSettings',
    () => timeAsync('loadAndApplyInitialSettings', loadAndApplyInitialSettings),
    fallback: null,
  );

  runApp(
    EasyLocalization(
      supportedLocales: AppLanguage.supportedLocales,
      path: AppLanguage.translationAssetsPath,
      useOnlyLangCode: true,
      startLocale: AppLanguage.fallbackLocale,
      fallbackLocale: AppLanguage.fallbackLocale,
      child: Builder(
        builder: (context) {
          return MyApp();
        },
      ),
    ),
  );
}

// Exposed for fatal-screen retry: rerun bootstrap if it failed, otherwise just reload BootData.
Future<void> retryStartupFromFatal() async {
  if (_bootstrapped) {
    await AppRebuilder.retryBootDataAndRebuild();
  } else {
    await _startApp();
  }
}

Future<void> _initLocalServices() async {
  await _initStep(
    'LocalNotificationService.init',
    () => LocalNotificationService().init(),
  );
  await _initStep(
    'dotenv.load',
    () => dotenv.load(fileName: ApiConstants.getEnvFileName),
  );
}

Future<void> _lockOrientation() async {
  await _initStep('SystemChrome.setPreferredOrientations', () async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  });
}

Future<void> _initFirebase() async {
  await _fatalStep('Firebase.initializeApp', () async {
    if (Firebase.apps.isEmpty) {
      if (kIsWeb) {
        await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyA4DrEz2NzlvxFVPEulE_PXm9IYkfN-eYA",
            authDomain: "silah-app-9acb6.firebaseapp.com",
            projectId: "silah-app-9acb6",
            storageBucket: "silah-app-9acb6.firebasestorage.app",
            messagingSenderId: "330197769102",
            appId: "1:330197769102:web:9f34f333b7d0bcd34de2df",
            measurementId: "G-970DHKL9G1",
          ),
        );
      } else {
        await Firebase.initializeApp();
      }
    }
  });
}

void _wireCrashlyticsHandlers() {
  final prev = FlutterError.onError;

  // Framework/UI errors
  FlutterError.onError = (details) {
    final st = details.stack ?? StackTrace.current;

    // Log
    if (kReleaseMode) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    } else {
      AppLogger().uiError(details.exception, tag: 'flutter', stack: st);
    }

    // Show overlay
    UiErrorBus.i.emit(
      UiError(
        title: "A UI error occurred",
        message: details.exceptionAsString(),
        error: details.exception,
        stack: st,
      ),
    );

    // Keep Flutter’s own prints in debug
    prev?.call(details);
  };

  // Background / platform errors
  PlatformDispatcher.instance.onError = (error, stack) {
    if (kReleaseMode) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    } else {
      AppLogger().uiError(error, tag: 'platform', stack: stack);
    }
    UiErrorBus.i.emit(
      UiError(
        title: "Unexpected error",
        message: error.toString(),
        error: error,
        stack: stack,
      ),
    );
    return true; // don’t hard-crash; show overlay instead
  };

  // Replace the red screen for build-time failures (debug/profile)
  ErrorWidget.builder = (details) {
    final stack = StackTrace.current;
    UiErrorBus.i.emit(
      UiError(
        title: "Widget build failed",
        message: details.exceptionAsString(),
        error: details.exception,
        stack: details.stack ?? stack,
      ),
    );
    // Keep a tiny placeholder where the failed widget was
    return const SizedBox.shrink();
  };
}

void _setupMessaging() {
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}

Future<void> _setupNotifications() async {
  await _initStep('notifications.setup', () async {
    final plugin = FlutterLocalNotificationsPlugin();
    await plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
    if (!kIsWeb) await setupFlutterNotifications();
  });
}

void _setupBlocObserver() {
  if (kDebugMode) Bloc.observer = YBRDBlocObserver();
}

Future<void> _initDi() async {
  await _once.run('di.init', () async {
    await _fatalStep('di.init()', () => timeAsync('di.init()', di.init));
  });
}

Future<void> _validatePlatform() async {
  await _initStep('AppPlatform.validate', () async => AppPlatform.validate());
}

Future<void> _initLocalizationAndMappers() async {
  await _initStep(
    'EasyLocalization.ensureInitialized',
    EasyLocalization.ensureInitialized,
  );
  await _initStep('initializeMappers', () async => initializeMappers());
}

// step wrappers --------------------------------------------------------------
Future<T?> _initStep<T>(
  String name,
  Future<T> Function() step, {
  Duration timeout = const Duration(seconds: 25),
  T? fallback,
}) async {
  try {
    final result = await step().timeout(timeout);
    return result;
  } catch (e, st) {
    _recordNonFatal(name, e, st);
    return fallback;
  }
}

Future<void> _fatalStep(
  String name,
  Future<void> Function() step, {
  Duration timeout = const Duration(seconds: 30),
}) async {
  try {
    await step().timeout(timeout);
  } catch (e, st) {
    _recordFatal(name, e, st);
    _handleTopLevelError(
      message: 'Startup step failed: $name',
      error: e,
      stack: st,
    );
    throw e;
  }
}

void _recordNonFatal(String name, Object error, StackTrace stack) {
  AppLogger().initError(error, tag: name, stack: stack);
}

void _recordFatal(String name, Object error, StackTrace stack) {
  AppLogger().initError(error, tag: 'FATAL $name', stack: stack);
}

// fatal UI -------------------------------------------------------------------
void _mountFatalUI({
  required String message,
  required Object error,
  required StackTrace stack,
}) {
  AppLogger().appError(error, tag: 'fatal_ui', stack: stack);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BootErrorScreen(message: message),
    ),
  );
}

// app widgets ----------------------------------------------------------------
class MyApp extends StatefulWidget {
  final BootData? bootData;
  const MyApp({super.key, this.bootData});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ThemeController _themeController;

  @override
  void initState() {
    super.initState();
    _themeController = ThemeController(
      settingBloc: di.locator<AppSettingBloc>(),
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _themeController.init(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: di.locator<AppSettingBloc>()..add(GetAppSettingEvent()),
        ),
        BlocProvider.value(value: di.locator<AppStateBloc>()),
        BlocProvider.value(value: di.locator<SessionBloc>()),
        BlocProvider(create: (_) => di.locator<LoginBloc>()),
        BlocProvider.value(value: di.locator<ItemLoadingCubit>()),
      ],
      child: ChangeNotifierProvider.value(
        value: _themeController,
        child: MyRootWidget(idleSeconds: widget.bootData?.sesstionTime ?? 120),
      ),
    );
  }
}

class MyRootWidget extends StatefulWidget {
  final int idleSeconds;
  const MyRootWidget({super.key, required this.idleSeconds});

  @override
  State<MyRootWidget> createState() => _MyRootWidgetState();
}

class _MyRootWidgetState extends State<MyRootWidget> {
  static bool _managerAttached = false;
  late final Widget _built;

  @override
  void initState() {
    super.initState();

    final appShell = SessionBlocListener(
      child: const AppPlatform(android: AndroidApp(), ios: IOSApp()),
    );

    if (!_MyRootWidgetState._managerAttached) {
      _built = SessionTimeoutService().wrapWithManager(
        idleSeconds: widget.idleSeconds,
        child: appShell,
      );
      _MyRootWidgetState._managerAttached = true;
    } else {
      _built = appShell;
    }
  }

  @override
  Widget build(BuildContext context) => _built;
}
