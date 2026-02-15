import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

import 'main_service.dart';

abstract class MainRemoteDataSource {}

class MainRemoteDataSourceImpl implements MainRemoteDataSource {
  final MainService mainService;
  final AppLogger logger;

  MainRemoteDataSourceImpl({required this.mainService, required this.logger});
}
