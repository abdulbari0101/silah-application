
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/sesstion_bloc/sesstion_bloc.dart';

import '../presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import '../presentation/state_magment/cubits/iItem_loading_cubit.dart';

Future<void> initCore() async {
  // Blocs
  locator.registerLazySingleton(() => AppStateBloc());
  locator.registerLazySingleton(
    () => AppSettingBloc(settingRep: locator(), localeManager: locator()),
  );
  locator.registerLazySingleton(() => SessionBloc(appState: locator(), timeOutService: locator()));
  

  locator.registerLazySingleton(() => ItemLoadingCubit());

}
