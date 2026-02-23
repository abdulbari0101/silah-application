import 'package:dartz/dartz.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/platform/device_info_helper.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/app_shell/domain/entities/intro_entity.dart';

import '../../domain/repositories/intro_repository.dart';
import '../datasources/local/intro_cache_data_source.dart';
import '../datasources/remote/intro_remote_data_source.dart';

class IntroRepoImpl implements IntroRepo {
  final IntroRemoteDataSource remoteDS;
  final IntroCacheDataSource cacheDS;
  final DeviceInfoHelper deviceInfoHelper;
  final Executor executor;

  IntroRepoImpl({
    required this.remoteDS,
    required this.cacheDS,
    required this.executor,
    required this.deviceInfoHelper,
  });


}
