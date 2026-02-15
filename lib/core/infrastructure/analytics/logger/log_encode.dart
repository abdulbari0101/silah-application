import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

String encodePayload(Object? obj, {int max = 4000}) {
  Object? data = obj;

  // 1) Try dart_mappable if available for the type
  try {
    data = MapperContainer.globals.toMap(obj);
  } catch (_) {
    // ignore: not mappable; fall back below
  }

  // 2) If still not a map/list/string, just toString()
  if (data is! Map && data is! Iterable && data is! String) {
    data = obj?.toString();
  }

  // 3) Sanitize & compact to one-line JSON
  final safe = LogSanitizer.sanitize(data);
  final json = (safe is String)
      ? safe // already a plain string
      : const JsonEncoder().convert(safe); // single-line JSON

  // 4) Truncate
  if (json.length > max) {
    return '${json.substring(0, max)}…(+${json.length - max} chars)';
  }
  return json;
}

// Optional: shallow diff of two payloads (both maps)
String encodeDiff(Object? before, Object? after, {int max = 4000}) {
  Map<String, dynamic> toMap(Object? o) {
    try {
      final m = MapperContainer.globals.toMap(o);
      return (LogSanitizer.sanitize(m) as Map).cast<String, dynamic>();
    } catch (_) {
      return const {};
    }
  }

  final a = toMap(before);
  final b = toMap(after);
  final diff = <String, dynamic>{};

  for (final k in {...a.keys, ...b.keys}) {
    if (a[k] != b[k]) diff[k] = {'from': a[k], 'to': b[k]};
  }

  final s = const JsonEncoder().convert(diff);
  return s.length > max ? '${s.substring(0, max)}…(+${s.length - max} chars)' : s;
}

class LogSanitizer {
  // lower-case keys to redact
  static const _deny = {"khkjh"};

  //   static const _deny = {
  //   'password', 'pass', 'newpass', 'pin', 'newpin',
  //   'cvv', 'otp', 'token', 'authorization', 'cardno', 'cardnumber',
  // };

  static Object? sanitize(Object? v) {
    if (v is Map) {
      return {
        for (final e in v.entries)
          e.key: _deny.contains(e.key.toString().toLowerCase()) ? '***' : sanitize(e.value),
      };
    }
    if (v is Iterable) return v.map(sanitize).toList();
    return v;
  }
}
