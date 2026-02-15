class ErrorCodes {
  static const int badRequest400 = 400;
  static const int badResponseNegtive400 = -400; // 
  static const int unauthorized401 = 401;
  static const int notFound404 = 404;
  static const int requestTimeout408 = 408; // network timeout
  static const int forbidden403 = 403;
  static const int conflict409 = 409;
  static const int internalServer500 = 500;
  static const int serviceUnavailable503 = 503;
  static const int gatewayTimeout504 = 504;
  static const int unprocessable422 = 422;

  // Custom app-specific errors
  static const int invalidUserPass11 = 11;

  static const int appUpdateRequired4003 = 4003;
  static const int deviceRegRequired4008 = 4008;
  static const int multiDeviceSessionConflict4100 = 4100; /// Prevent multiple  sessions for a single account
  static const int sesstinoEnded4112 = 4112;

  static const int noInternetNegtive100 = -100; // offline / airplane-mode
  /// Upstream closed connection early (EOF / broken pipe)
  static const int eofExceptionNegtive101 = -101;

  /// TLS / certificate validation failure (non-standard: favoured by Nginx & Spring)
  static const int sslCertificateErr495 = 495;

  // ===== OS-level network errno codes (positive integers) =====
  static const int dnsFailed7 = 7;               // getaddrinfo() failures (EAI_*)
  static const int brokenPipe32 = 32;            // EPIPE
  static const int networkUnreachable101 = 101;  // ENETUNREACH
  static const int connectionAborted103 = 103;   // ECONNABORTED
  static const int connectionReset104 = 104;     // ECONNRESET
  static const int requestTimedOut110 = 110;     // ETIMEDOUT
  static const int connectionRefused111 = 111;   // ECONNREFUSED
  static const int hostUnreachable113 = 113;     // EHOSTUNREACH
}
