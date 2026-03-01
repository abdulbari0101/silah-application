import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_status.dart';
import 'package:silah_app/features/admin/domain/repositories/admin_repository.dart';

class AdminRepositoryImpl implements AdminRepository {
  final Executor executor;
  final List<AdminTaskEntity> _tasks = <AdminTaskEntity>[];

  AdminRepositoryImpl({required this.executor}) {
    _seedTasks();
  }

  @override
  Future<Either<Failure, List<AdminTaskEntity>>> fetchPendingTasks() {
    return executor.runOffline(
      () async => List<AdminTaskEntity>.unmodifiable(_tasks),
      from: 'AdminRepository.fetchPendingTasks',
    );
  }

  @override
  Future<Either<Failure, AdminTaskEntity>> updateTask(AdminTaskEntity task) {
    return executor.runOffline(() async {
      final id = task.id;
      if (id == null || id.isEmpty) {
        throw const MissingDataException('Missing admin task id');
      }

      final index = _tasks.indexWhere((item) => item.id == id);
      if (index == -1) {
        throw const MissingDataException('Admin task not found');
      }

      _tasks[index] = task;
      return task;
    }, from: 'AdminRepository.updateTask');
  }

  void _seedTasks() {
    if (_tasks.isNotEmpty) return;
    final now = DateTime.now();
    _tasks.addAll([
      AdminTaskEntity(
        id: 'task_1',
        type: 'License Verification',
        targetId: 'LAW-2041',
        status: AdminTaskStatus.pending,
        notes: 'Review lawyer license submission.',
        createdAt: now.subtract(const Duration(hours: 3)).toIso8601String(),
      ),
      AdminTaskEntity(
        id: 'task_2',
        type: 'Support Report',
        targetId: 'REP-778',
        status: AdminTaskStatus.inReview,
        notes: 'User reported abusive message in chat.',
        createdAt: now.subtract(const Duration(days: 1)).toIso8601String(),
      ),
      AdminTaskEntity(
        id: 'task_3',
        type: 'Profile Review',
        targetId: 'USR-991',
        status: AdminTaskStatus.pending,
        notes: 'Manual review required for profile updates.',
        createdAt: now.subtract(const Duration(days: 2)).toIso8601String(),
      ),
    ]);
  }
}
