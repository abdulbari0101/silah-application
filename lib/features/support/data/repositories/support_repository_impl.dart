import 'package:dartz/dartz.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';

import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/domain/entities/data_entity.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/platform/device_info_helper.dart';

import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/support/data/datasources/local/support_local_data_source.dart';
import 'package:silah_app/features/support/data/datasources/remote/support_remote_data_source.dart';
import 'package:silah_app/features/support/domain/repositories/support_repository.dart';

class SupportRepositoryoImpl implements SupportRepository {
  final SupportRemoteDataSource remoteDS;
  final SupportLocalDataSource localDS;
  final DeviceInfoHelper deviceInfoHelper;

  final Executor executor;

  final AppLogger logger = locator.get<AppLogger>();

  SupportRepositoryoImpl({
    required this.remoteDS,
    required this.localDS,
    required this.executor,
    required this.deviceInfoHelper,
  });

  @override
  Future<Either<Failure, DataEntity>> Support(PostRequestEntity params) async {
    return executor.runOnline(() async {
      final PostRequestModel request = await deviceInfoHelper.buildBaseRequest(
        PostRequestModel.fromEntity(params),
      );

      final response = await remoteDS.support(request);

      if (response.data == null) {
        throw MissingDataException("Missing data");
      }

      return response.data!.toEntity();
    }, from: "SupportRepoImpl.Support");
  }
}
