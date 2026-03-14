import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';

class AdminTaskDetailsArgs {
  final AdminTaskEntity task;

  const AdminTaskDetailsArgs({required this.task});

  Map<String, dynamic> toJson() {
    return {'task': task.toJson()};
  }

  static AdminTaskDetailsArgs? fromExtra(Object? extra) {
    if (extra is AdminTaskDetailsArgs) {
      return extra;
    }
    if (extra is Map) {
      final rawTask = extra['task'];
      if (rawTask is Map) {
        return AdminTaskDetailsArgs(
          task: AdminTaskEntityMapper.fromJson(
            Map<String, dynamic>.from(rawTask),
          ),
        );
      }
    }
    return null;
  }
}
