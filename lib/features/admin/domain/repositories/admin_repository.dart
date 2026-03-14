import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_subject_details_entity.dart';

abstract class AdminRepository {
  Future<Either<Failure, List<AdminTaskEntity>>> fetchPendingTasks();

  Future<Either<Failure, AdminTaskEntity>> updateTask(AdminTaskEntity task);

  Future<Either<Failure, AdminTaskSubjectDetailsEntity?>> fetchTaskSubject(
    AdminTaskEntity task,
  );
}
