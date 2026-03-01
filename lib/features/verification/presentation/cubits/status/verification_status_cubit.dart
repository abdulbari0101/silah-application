import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';
import 'package:silah_app/features/verification/domain/entities/verification_status.dart';
import 'package:silah_app/features/verification/domain/repositories/verification_repository.dart';

part 'verification_status_cubit.freezed.dart';

@freezed
class VerificationStatusState with _$VerificationStatusState {
  const factory VerificationStatusState.loading() = _VerificationStatusLoading;
  const factory VerificationStatusState.ready({
    required LicenseVerificationEntity verification,
    required bool isUnverified,
  }) = _VerificationStatusReady;
  const factory VerificationStatusState.failure({
    required String message,
    LicenseVerificationEntity? verification,
  }) = _VerificationStatusFailure;
}

class VerificationStatusCubit extends Cubit<VerificationStatusState> {
  final VerificationRepository repository;
  LicenseVerificationEntity? _verification;

  VerificationStatusCubit({required this.repository})
    : super(const VerificationStatusState.loading());

  Future<void> load() async {
    emit(const VerificationStatusState.loading());
    final result = await repository.fetchVerificationStatus();
    result.fold(
      (failure) => emit(
        VerificationStatusState.failure(
          message: _mapFailure(failure),
          verification: _verification,
        ),
      ),
      (data) {
        _verification = data;
        emit(
          VerificationStatusState.ready(
            verification: data,
            isUnverified: _isUnverified(data),
          ),
        );
      },
    );
  }

  bool _isUnverified(LicenseVerificationEntity verification) {
    final hasRequest =
        (verification.licenseNumber ?? '').isNotEmpty ||
        (verification.nationalId ?? '').isNotEmpty;
    return !hasRequest && verification.status == VerificationStatus.pending;
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
