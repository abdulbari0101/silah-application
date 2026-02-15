import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';

import '../../config/localization/localizations_string_keys.dart';

final int ResultOK = 1;

class ResponseErrorHandler {
  static final _log = AppLogger();
  //
  static ServerException? handle({BaseRespWrapper? baseResObject}) {
    try {
      if (isResultOK(baseResObject)) {
        return null;
      }
      final result = baseResObject?.result; // if any of them null will throw exeption form

      final code = result?.code ?? ErrorCodes.internalServer500;
      final msg = result?.message ?? Strings.err_error_occured.tr();

      switch (code) {
        case ErrorCodes.invalidUserPass11:
          return AuthException(msg, code);
        case ErrorCodes.deviceRegRequired4008:
          return AuthException(msg, code);
        case ErrorCodes.unauthorized401:
        case ErrorCodes.multiDeviceSessionConflict4100:
          return SessionException(msg, code);

        case ErrorCodes.conflict409:
          return ConflictException(msg, code);
        default:
          return ServerException(msg, code);
      }
    } catch (ex, st) {
      _log.apiError(tag: 'ResponseErrorHandler.handle', ex, stack: st);
      return ServerException(Strings.err_error_occured.tr(), ErrorCodes.internalServer500);
    }
  }

  static bool isResultOK(BaseRespWrapper? baseResObject) {
    final result = baseResObject?.result;

    if (result == null) {
      throw ServerException(Strings.bad_response.tr(), ErrorCodes.badResponseNegtive400);
    }

    return result.code == ResultOK;
  }
}
