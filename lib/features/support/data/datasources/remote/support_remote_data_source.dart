import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

import 'support_service.dart';

abstract class SupportRemoteDataSource {
  


}

class SupportRemoteDataSourceImpl implements SupportRemoteDataSource {
  final SupportService supportService;
  final AppLogger logger;

  SupportRemoteDataSourceImpl({
    required this.supportService,
    required this.logger,
  });


 

}
