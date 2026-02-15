import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/constants/filters/date_range_type.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

class DateRangeValue {
  final String label;
  final DateTime? from;
  final DateTime? to;

  DateRangeValue({required this.label, this.from, this.to});

  String get formattedFrom =>
      from != null ? DateFormat('dd/MM/yyyy', AppLanguage.english.code).format(from!) : '';

  String get formattedTo => to != null ? DateFormat('dd/MM/yyyy', 'en').format(to!) : '';
}

extension DateRangeTypeExtension on DateRangeType {
  DateRangeValue resolve({DateTime? fromTimePeriod, DateTime? toTimePeriod}) {
    final now = DateTime.now();

    switch (this) {
      case DateRangeType.all:
        return DateRangeValue(
          label: Strings.all.tr(),

          from: now.subtract(Duration(days: 360)),
          to: now,
        );

      case DateRangeType.last1Week:
        return DateRangeValue(
          label: Strings.last1Week.tr(),
          from: now.subtract(const Duration(days: 7)),
          to: now,
        );

      case DateRangeType.last1Month:
        return DateRangeValue(
          label: Strings.last1Month.tr(),
          from: DateTime(now.year, now.month - 1, now.day),
          to: now,
        );

      case DateRangeType.last6Months:
        return DateRangeValue(
          label: Strings.last6Months.tr(),
          from: DateTime(now.year, now.month - 6, now.day),
          to: now,
        );

      case DateRangeType.last1Year:
        return DateRangeValue(
          label: Strings.last1Year.tr(),
          from: DateTime(now.year - 1, now.month, now.day),
          to: now,
        );

      case DateRangeType.timePeriod:
        return DateRangeValue(
          label: Strings.time_period.tr(),
          from: fromTimePeriod,
          to: toTimePeriod,
        );
    }
  }
}
