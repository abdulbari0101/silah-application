import 'package:dart_mappable/dart_mappable.dart';

part 'admin_task_status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum AdminTaskStatus { pending, inReview, approved, rejected }
