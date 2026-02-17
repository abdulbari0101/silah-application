import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/app_shell/presentation/blocs/home_bloc/home_bloc.dart';
//! Features -Main

Future<void> initMain() async {
  // Bloc

  locator.registerLazySingleton(() => HomeBloc());
}
