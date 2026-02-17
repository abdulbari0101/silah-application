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
import 'package:silah_app/features/consultations/data/datasources/local/requests_local_data_source.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/requests_remote_data_source.dart';
import 'package:silah_app/features/consultations/domain/repositories/request_repository.dart';

class RequestsRepositoryoImpl implements RequestsRepository {
  final RequestsRemoteDataSource remoteDS;
  final RequestsLocalDataSource localDS;
  final DeviceInfoHelper deviceInfoHelper;

  final Executor executor;

  final AppLogger logger = locator.get<AppLogger>();

  RequestsRepositoryoImpl({
    required this.remoteDS,
    required this.localDS,
    required this.executor,
    required this.deviceInfoHelper,
  });

  @override
  Future<Either<Failure, DataEntity>> Request(PostRequestEntity params) async {
    return executor.runOnline(() async {
      final PostRequestModel request = await deviceInfoHelper.buildBaseRequest(
        PostRequestModel.fromEntity(params),
      );

      final response = await remoteDS.request(request);

      if (response.data == null) {
        throw MissingDataException("Missing data");
      }

      return response.data!.toEntity();
    }, from: "RequestsRepoImpl.Request");
  }
}
