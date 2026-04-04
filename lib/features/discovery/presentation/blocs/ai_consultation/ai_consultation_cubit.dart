import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_recommendation_entity.dart';
import 'package:silah_app/features/discovery/domain/repositories/discovery_repository.dart';

part 'ai_consultation_cubit.freezed.dart';

@freezed
class AiConsultationState with _$AiConsultationState {
  const factory AiConsultationState.idle() = _AiConsultationIdle;
  const factory AiConsultationState.loading() = _AiConsultationLoading;
  const factory AiConsultationState.success({
    required AiRecommendationEntity recommendation,
  }) = _AiConsultationSuccess;
  const factory AiConsultationState.failure({required String message}) =
      _AiConsultationFailure;
}

class AiConsultationCubit extends Cubit<AiConsultationState> {
  final DiscoveryRepository repository;

  AiConsultationCubit({required this.repository})
    : super(const AiConsultationState.idle());

  Future<void> submit(String prompt) async {
    final trimmed = prompt.trim();
    if (trimmed.isEmpty) {
      emit(AiConsultationState.failure(message: Strings.error_fill_form.tr()));
      return;
    }

    emit(const AiConsultationState.loading());

    final recommendResult = await repository.recommendLawyers(
      AiClassificationRequestEntity(prompt: trimmed),
    );

    recommendResult.fold(
      (failure) =>
          emit(AiConsultationState.failure(message: _mapFailure(failure))),
      (recommendation) =>
          emit(AiConsultationState.success(recommendation: recommendation)),
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
