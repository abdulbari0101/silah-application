import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/admin/data/datasources/remote/admin_remote_data_source.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_subject_details_entity.dart';
import 'package:silah_app/features/admin/domain/repositories/admin_repository.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteDataSource remoteDataSource;
  final Executor executor;

  AdminRepositoryImpl({required this.remoteDataSource, required this.executor});

  @override
  Future<Either<Failure, List<AdminTaskEntity>>> fetchPendingTasks() {
    return executor.runOffline(
      () async => remoteDataSource.fetchTasks(),
      from: 'AdminRepository.fetchPendingTasks',
    );
  }

  @override
  Future<Either<Failure, AdminTaskEntity>> updateTask(AdminTaskEntity task) {
    return executor.runOnline(
      () async => remoteDataSource.updateTask(task),
      from: 'AdminRepository.updateTask',
    );
  }

  @override
  Future<Either<Failure, AdminTaskSubjectDetailsEntity?>> fetchTaskSubject(
    AdminTaskEntity task,
  ) {
    return executor.runOffline(
      () async => remoteDataSource.fetchTaskSubject(task),
      from: 'AdminRepository.fetchTaskSubject',
    );
  }
}
