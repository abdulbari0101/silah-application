import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';

part 'change_password_cubit.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _ChangePasswordInitial;
  const factory ChangePasswordState.submitting() = _ChangePasswordSubmitting;
  const factory ChangePasswordState.success() = _ChangePasswordSuccess;
  const factory ChangePasswordState.failure({required String message}) =
      _ChangePasswordFailure;
}

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthRepo repository;

  ChangePasswordCubit({required this.repository})
    : super(const ChangePasswordState.initial());

  Future<void> submit({
    required String currentPassword,
    required String newPassword,
  }) async {
    final current = currentPassword.trim();
    final next = newPassword.trim();
    if (current.isEmpty || next.isEmpty) {
      emit(ChangePasswordState.failure(message: Strings.error_fill_form.tr()));
      emit(const ChangePasswordState.initial());
      return;
    }

    emit(const ChangePasswordState.submitting());
    final result = await repository.updatePassword(
      currentPassword: current,
      newPassword: next,
    );
    result.fold(
      (failure) =>
          emit(ChangePasswordState.failure(message: _mapFailure(failure))),
      (_) => emit(const ChangePasswordState.success()),
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
