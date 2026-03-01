import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';
import 'package:silah_app/features/verification/domain/repositories/verification_repository.dart';

part 'verification_request_cubit.freezed.dart';

@freezed
class VerificationRequestState with _$VerificationRequestState {
  const factory VerificationRequestState.initial() =
      _VerificationRequestInitial;
  const factory VerificationRequestState.submitting() =
      _VerificationRequestSubmitting;
  const factory VerificationRequestState.success({
    required LicenseVerificationEntity verification,
  }) = _VerificationRequestSuccess;
  const factory VerificationRequestState.failure({required String message}) =
      _VerificationRequestFailure;
}

class VerificationRequestCubit extends Cubit<VerificationRequestState> {
  final VerificationRepository repository;

  VerificationRequestCubit({required this.repository})
    : super(const VerificationRequestState.initial());

  Future<void> submit({
    required String licenseNumber,
    required String nationalId,
  }) async {
    final trimmedLicense = licenseNumber.trim();
    final trimmedNationalId = nationalId.trim();
    if (trimmedLicense.isEmpty || trimmedNationalId.isEmpty) {
      emit(
        VerificationRequestState.failure(message: Strings.error_fill_form.tr()),
      );
      emit(const VerificationRequestState.initial());
      return;
    }

    emit(const VerificationRequestState.submitting());
    final result = await repository.verifyLicense(
      licenseNumber: trimmedLicense,
      nationalId: trimmedNationalId,
    );

    result.fold(
      (failure) =>
          emit(VerificationRequestState.failure(message: _mapFailure(failure))),
      (data) => emit(VerificationRequestState.success(verification: data)),
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
