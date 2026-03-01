import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:silah_app/features/admin/domain/repositories/admin_repository.dart';

// ! Features - Admin

Future<void> initAdmin() async {
  locator.registerLazySingleton<AdminRepository>(
    () => AdminRepositoryImpl(executor: locator()),
  );
}
