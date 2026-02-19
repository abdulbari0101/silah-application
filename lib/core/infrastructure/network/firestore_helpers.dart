import 'package:cloud_firestore/cloud_firestore.dart';

String? parseFirestoreTimestamp(dynamic value) {
  if (value == null) return null;
  if (value is Timestamp) {
    return value.toDate().toUtc().toIso8601String();
  }
  if (value is DateTime) {
    return value.toUtc().toIso8601String();
  }
  if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value).toUtc().toIso8601String();
  }
  if (value is String) {
    return value;
  }
  return null;
}

int? parseFirestoreInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value.trim());
  return null;
}

List<String>? parseFirestoreStringList(dynamic value) {
  if (value is List) {
    return value.whereType<String>().toList();
  }
  return null;
}
