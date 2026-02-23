import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

import 'intro_service.dart';

abstract class IntroRemoteDataSource {

}

class IntroRemoteDataSourceImpl implements IntroRemoteDataSource {
  final IntroService introService;
  final AppLogger logger;

  IntroRemoteDataSourceImpl({required this.introService, required this.logger});


}
