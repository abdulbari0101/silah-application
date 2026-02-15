import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

String formatDateTime({required DateTime dateTime, required String pattern}) {
  final buffer = StringBuffer();
  buffer
    ..write(dateTime.year.toString().padLeft(4, '0'))
    ..write(dateTime.month.toString().padLeft(2, '0'))
    ..write(dateTime.day.toString().padLeft(2, '0'))
    ..write(dateTime.hour.toString().padLeft(2, '0'))
    ..write(dateTime.minute.toString().padLeft(2, '0'))
    ..write(dateTime.second.toString().padLeft(2, '0'))
    ..write(dateTime.millisecond.toString().padLeft(3, '0'));
  return buffer.toString();
}

String getTodayFormattedDate() {
  final now = DateTime.now();
  final formatter = DateFormat.yMMMMd(); // Format: June 4, 2025
  return formatter.format(now);
}

class TransactionDateRange {
  final String fromDate;
  final String toDate;

  TransactionDateRange({required this.fromDate, required this.toDate});
}

TransactionDateRange resolveTransactionDates({
  DateTime? from,
  DateTime? to,
  String? fallbackFrom,
  String? fallbackTo,
}) {
  final now = DateTime.now();
  final beginningOfYear = DateTime(now.year, 1, 1);
  final formatter = DateFormat('dd/MM/yyyy' ,  'en');

  final resolvedFrom = from != null
      ? formatter.format(from)
      : (fallbackFrom?.isNotEmpty == true ? fallbackFrom! : formatter.format(beginningOfYear));

  final resolvedTo = to != null
      ? formatter.format(to)
      : (fallbackTo?.isNotEmpty == true ? fallbackTo! : formatter.format(now));

  return TransactionDateRange(fromDate: resolvedFrom, toDate: resolvedTo);
}

String toDateRangeString({
  required BuildContext context,
  DateTime? from,
  DateTime? to,
  required String fallback,
}) {
  if (from == null || to == null) {
    return fallback;
  }

  final dateFormat = DateFormat('dd MMM yy', 'en');

  final fromString = dateFormat.format(from);
  final toString = dateFormat.format(to);

  return '$fromString – $toString';
}
