// lib/core/foundation/mapping/mapping_hooks.dart
import 'package:dart_mappable/dart_mappable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DynToStringHook extends MappingHook {
  const DynToStringHook();
  @override
  Object? beforeDecode(Object? v) => v?.toString();
}

class DynToIntHook extends MappingHook {
  const DynToIntHook();
  @override
  Object? beforeDecode(Object? v) => v == null ? null : int.tryParse(v.toString());
}

class DynToDoubleHook extends MappingHook {
  const DynToDoubleHook();
  @override
  Object? beforeDecode(Object? v) => v == null ? null : double.tryParse(v.toString());
}

class DynToBoolHook extends MappingHook {
  const DynToBoolHook();
  @override
  Object? beforeDecode(Object? v) {
    if (v == null) return null;
    if (v is bool) return v;
    final s = v.toString().toLowerCase();
    return (s == 'true' || s == '1')
        ? true
        : (s == 'false' || s == '0')
        ? false
        : null;
  }
}

class SafeIntListHook extends MappingHook {
  const SafeIntListHook();

  @override
  Object? beforeDecode(Object? value) {
    return value is Iterable ? value : null;
  }
}

class SingleOrListHook extends MappingHook {
  const SingleOrListHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value == null) return null;
    if (value is Iterable) return value;
    return [value];
  }
}


class DateIsoHook extends MappingHook {
  const DateIsoHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    }
    return null;
  }

  @override
  Object? beforeEncode(Object? value) => (value as DateTime?)?.toIso8601String();
}

class FirestoreValueHook extends MappingHook {
  const FirestoreValueHook();

  @override
  Object? beforeEncode(Object? value) => _sanitize(value);

  Object? _sanitize(Object? value) {
    if (value == null) return null;
    if (value is Timestamp) {
      return value.toDate().toUtc().toIso8601String();
    }
    if (value is DateTime) {
      return value.toUtc().toIso8601String();
    }
    if (value is FieldValue) {
      return null;
    }
    if (value is Map) {
      final sanitized = <String, dynamic>{};
      value.forEach((key, nested) {
        final k = key?.toString();
        if (k == null || k.isEmpty) return;
        final cleaned = _sanitize(nested);
        if (cleaned != null) {
          sanitized[k] = cleaned;
        }
      });
      return sanitized;
    }
    if (value is Iterable) {
      final sanitized = <dynamic>[];
      for (final item in value) {
        final cleaned = _sanitize(item);
        if (cleaned != null) {
          sanitized.add(cleaned);
        }
      }
      return sanitized;
    }
    if (value is num || value is bool || value is String) {
      return value;
    }
    if (value is Enum) {
      return value.name;
    }
    return null;
  }
}
