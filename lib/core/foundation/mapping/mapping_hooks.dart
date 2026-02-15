// lib/core/util/mapping_hooks.dart
import 'package:dart_mappable/dart_mappable.dart';

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
  @override decode(value) =>
      value == null ? null : DateTime.parse(value as String);
  @override encode(value) => (value as DateTime?)?.toIso8601String();
}
