import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/base/data_response_wrapper.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';

import 'chats_service.dart';

abstract class ChatsRemoteDataSource {
  Future<BaseApiResponse<DataRespWrapper>> chat(PostRequestModel request);
}

class ChatsRemoteDataSourceImpl implements ChatsRemoteDataSource {
  final ChatsService chatsService;
  final AppLogger logger;

  ChatsRemoteDataSourceImpl({required this.chatsService, required this.logger});

  @override
  Future<BaseApiResponse<DataRespWrapper>> chat(PostRequestModel request) =>
      handleBaseApiResponse<DataRespWrapper>(
        method: 'chat',
        logger: logger,
        call: () => chatsService.chat(request),
      );
}
