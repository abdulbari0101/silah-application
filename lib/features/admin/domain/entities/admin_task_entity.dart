import 'package:dart_mappable/dart_mappable.dart';

import 'admin_task_status.dart';

part 'admin_task_entity.mapper.dart';

@MappableClass()
class AdminTaskEntity with AdminTaskEntityMappable {
  final String? id;
  final String? type;
  final String? targetId;
  final AdminTaskStatus status;
  final String? notes;
  final String? createdAt;

  const AdminTaskEntity({
    this.id,
    this.type,
    this.targetId,
    this.status = AdminTaskStatus.pending,
    this.notes,
    this.createdAt,
  });
}
