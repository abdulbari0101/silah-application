import 'dart:convert';

import 'package:crypto/crypto.dart';

class PrtImiHelper {
  static String generateIMI(String deviceSer, String deviceToken, String opTimestamp) {
    String msg = deviceSer + deviceToken + opTimestamp;
    msg = _sha256(msg);
    msg = "$msg\$$opTimestamp";
    msg = msg.replaceAll("&", "\$");
    return base64.encode(utf8.encode(msg)).replaceAll(RegExp(r'(\r|\n)'), '');
  }

  static int generateTimestamp() {
    return DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
  }

  static String _sha256(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString().toUpperCase();
  }
}
