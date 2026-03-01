import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';

part 'forgot_password_cubit.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _ForgotPasswordInitial;
  const factory ForgotPasswordState.submitting() = _ForgotPasswordSubmitting;
  const factory ForgotPasswordState.success() = _ForgotPasswordSuccess;
  const factory ForgotPasswordState.failure({required String message}) =
      _ForgotPasswordFailure;
}

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo repository;

  ForgotPasswordCubit({required this.repository})
    : super(const ForgotPasswordState.initial());

  Future<void> submit(String email) async {
    final trimmed = email.trim();
    if (trimmed.isEmpty) {
      emit(ForgotPasswordState.failure(message: Strings.error_fill_form.tr()));
      emit(const ForgotPasswordState.initial());
      return;
    }

    emit(const ForgotPasswordState.submitting());
    final result = await repository.sendPasswordReset(email: trimmed);
    result.fold(
      (failure) =>
          emit(ForgotPasswordState.failure(message: _mapFailure(failure))),
      (_) => emit(const ForgotPasswordState.success()),
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
