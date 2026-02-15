import 'package:equatable/equatable.dart';
import 'package:silah_app/core/config/extentions/date_range_type_extension.dart';

import 'date_range_type.dart';

class DateRangeSelection extends Equatable {
  final DateRangeType type;
  final DateTime? from;
  final DateTime? to;

  DateRangeSelection({required this.type, this.from, this.to});

  factory DateRangeSelection.idleState() {
    return DateRangeSelection(type: DateRangeType.all);
  }

  DateRangeValue resolve() {
    return type.resolve(fromTimePeriod: from, toTimePeriod: to);
  }

  @override
  List<Object?> get props => [type, from, to];
}
