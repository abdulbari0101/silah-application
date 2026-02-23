import 'package:silah_app/core/data/model/api/auth/token_model.dart';
import 'package:silah_app/features/auth/data/models/auth_user_model.dart';

abstract class _SharedAuthReaders {
  Future<String?> userId();
}

abstract class IdentityReader implements _SharedAuthReaders {
  Future<String?> deviceSerialId();
}

abstract class SessionReader implements _SharedAuthReaders {
  Future<AuthUserModel?> customer();
  Future<TokenModel?> loginToken();
}
