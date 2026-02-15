import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';

final codeToMessageMap = <int, String>{
  // --- HTTP ---
  ErrorCodes.badRequest400: Strings.err_bad_request,
  ErrorCodes.unauthorized401: Strings.err_unauthorized401,
  ErrorCodes.forbidden403: Strings.err_forbidden,
  ErrorCodes.conflict409: Strings.err_conflict,
  ErrorCodes.notFound404: Strings.err_not_found,
  ErrorCodes.internalServer500: Strings.err_internal_server,
  ErrorCodes.unprocessable422: Strings.err_unprocessable,
  ErrorCodes.serviceUnavailable503: Strings.err_service_unavailable,
  ErrorCodes.gatewayTimeout504: Strings.err_service_unavailable,
  ErrorCodes.requestTimeout408: Strings.err_conn_timeout,

  // Explicit mapping for Too Many Requests
  429: Strings.rate_limited,

  // --- Custom / app-specific ---
  ErrorCodes.noInternetNegtive100: Strings.err_no_internet_connection,
  ErrorCodes.eofExceptionNegtive101: Strings.err_error_occured,
  ErrorCodes.sslCertificateErr495: Strings.err_in_certificate,
  ErrorCodes.invalidUserPass11: Strings.msg_user_pass_not_correct,
  ErrorCodes.deviceRegRequired4008: Strings.msg_change_account_device,
  ErrorCodes.multiDeviceSessionConflict4100: Strings.err_multi_device_login,
  ErrorCodes.appUpdateRequired4003: Strings.msg_update_app,
  ErrorCodes.badResponseNegtive400: Strings.bad_response,

  // --- OS errno → localized strings ---
  ErrorCodes.dnsFailed7: Strings.host_lookup_failed,
  ErrorCodes.requestTimedOut110: Strings.request_timeout,
  ErrorCodes.connectionRefused111: Strings.connection_refused,
  ErrorCodes.networkUnreachable101: Strings.network_unreachable,
  ErrorCodes.hostUnreachable113: Strings.network_unreachable,
  ErrorCodes.connectionReset104: Strings.connection_reset,
  ErrorCodes.connectionAborted103: Strings.connection_reset,
  ErrorCodes.brokenPipe32: Strings.connection_reset,
};
