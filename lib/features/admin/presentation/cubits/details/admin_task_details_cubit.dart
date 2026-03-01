import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_entity.dart';
import 'package:silah_app/features/admin/domain/entities/admin_task_status.dart';
import 'package:silah_app/features/admin/domain/repositories/admin_repository.dart';

part 'admin_task_details_cubit.freezed.dart';

@freezed
abstract class AdminTaskDetailsState with _$AdminTaskDetailsState {
  const factory AdminTaskDetailsState.ready({
    required AdminTaskEntity task,
    @Default(false) bool isUpdating,
  }) = _AdminTaskDetailsReady;
  const factory AdminTaskDetailsState.failure({
    required String message,
    AdminTaskEntity? task,
  }) = _AdminTaskDetailsFailure;
}

class AdminTaskDetailsCubit extends Cubit<AdminTaskDetailsState> {
  final AdminRepository repository;
  AdminTaskEntity _task;

  AdminTaskDetailsCubit({
    required this.repository,
    required AdminTaskEntity initial,
  }) : _task = initial,
       super(AdminTaskDetailsState.ready(task: initial));

  Future<void> updateStatus(AdminTaskStatus status) async {
    emit(AdminTaskDetailsState.ready(task: _task, isUpdating: true));
    final updated = _task.copyWith(status: status);
    final result = await repository.updateTask(updated);
    result.fold(
      (failure) => emit(
        AdminTaskDetailsState.failure(
          message: _mapFailure(failure),
          task: _task,
        ),
      ),
      (task) {
        _task = task;
        emit(AdminTaskDetailsState.ready(task: task));
      },
    );
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
