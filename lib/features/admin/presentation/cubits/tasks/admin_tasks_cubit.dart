import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/repositories/admin_repository.dart';

part 'admin_tasks_cubit.freezed.dart';

@freezed
class AdminTasksState with _$AdminTasksState {
  const factory AdminTasksState.loading() = _AdminTasksLoading;
  const factory AdminTasksState.empty() = _AdminTasksEmpty;
  const factory AdminTasksState.ready({required List<AdminTaskEntity> tasks}) =
      _AdminTasksReady;
  const factory AdminTasksState.failure({required String message}) =
      _AdminTasksFailure;
}

class AdminTasksCubit extends Cubit<AdminTasksState> {
  final AdminRepository repository;
  StreamSubscription<List<AdminTaskEntity>>? _tasksSubscription;

  AdminTasksCubit({required this.repository})
    : super(const AdminTasksState.loading());

  Future<void> watch({bool forceRestart = false}) async {
    if (_tasksSubscription != null && !forceRestart) {
      return;
    }

    await _tasksSubscription?.cancel();
    emit(const AdminTasksState.loading());
    _tasksSubscription = repository.watchTasks().listen(
      _emitTasks,
      onError: (error, stackTrace) {
        emit(
          AdminTasksState.failure(
            message: error?.toString() ?? Strings.unexpected_error.tr(),
          ),
        );
      },
    );
  }

  Future<void> load() async {
    emit(const AdminTasksState.loading());
    final result = await repository.fetchPendingTasks();
    result.fold(
      (failure) => emit(AdminTasksState.failure(message: _mapFailure(failure))),
      _emitTasks,
    );
  }

  @override
  Future<void> close() async {
    await _tasksSubscription?.cancel();
    return super.close();
  }

  void _emitTasks(List<AdminTaskEntity> tasks) {
    if (tasks.isEmpty) {
      emit(const AdminTasksState.empty());
      return;
    }
    emit(AdminTasksState.ready(tasks: tasks));
  }

  String _mapFailure(Failure failure) {
    return BlocUtils.mergeCodeWithMessage(
      failure,
      codeToMessageMap,
      includeCodeLine: false,
      fallbackMessage: Strings.unexpected_error,
    );
  }
}
