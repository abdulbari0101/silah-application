import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/request/post_request_model.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_service.dart';
import 'package:silah_app/features/auth/data/models/ex_data_auth_model.dart';


abstract class AuthRemoteDataSource {
  Future<BaseApiResponse<ExDataAuthModel>> login(PostRequestModel request);
 
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthService authService;
  final AppLogger logger;

  AuthRemoteDataSourceImpl({
    required this.authService,
    required this.logger,
  });
  
  @override
  Future<BaseApiResponse<ExDataAuthModel>> login(PostRequestModel request) {
    // TODO: implement login
    throw UnimplementedError();
  }



}
