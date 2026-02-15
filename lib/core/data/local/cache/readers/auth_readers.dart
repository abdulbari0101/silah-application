import 'package:silah_app/core/data/model/api/auth/customer_model.dart';
import 'package:silah_app/core/data/model/api/auth/token_model.dart';

abstract class _SharedAuthReaders {
  // Customer

  Future<String?> custMobile();
  Future<String?> userId();
}

abstract class IdentityReader implements _SharedAuthReaders {
  Future<String?> deviceSerialId();
}

abstract class SesstionReader implements _SharedAuthReaders {
  Future<CustomerModel?> customer();
  Future<TokenModel?> loginToken();
  Future<String?> deviceToken();
  Future<bool> hasDeviceToken();

}
