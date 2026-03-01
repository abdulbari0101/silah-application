import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

String formatRelativeTime(BuildContext context, String? isoString) {
  if (isoString == null || isoString.trim().isEmpty) return '';
  final parsed = DateTime.tryParse(isoString);
  if (parsed == null) return isoString;

  final now = DateTime.now();
  final diff = now.difference(parsed.toLocal());
  final lang = context.locale.languageCode;
  final isArabic = lang == 'ar';

  if (diff.inMinutes < 1) {
    return isArabic ? 'الآن' : 'Just now';
  }
  if (diff.inMinutes < 60) {
    final mins = diff.inMinutes;
    return isArabic ? 'منذ $mins دقيقة' : '$mins min ago';
  }
  if (diff.inHours < 24) {
    final hours = diff.inHours;
    return isArabic ? 'منذ $hours ساعة' : '$hours h ago';
  }
  if (diff.inDays < 7) {
    final days = diff.inDays;
    return isArabic ? 'منذ $days يوم' : '$days d ago';
  }

  final formatter = DateFormat.yMMMd(context.locale.toString());
  return formatter.format(parsed.toLocal());
}
