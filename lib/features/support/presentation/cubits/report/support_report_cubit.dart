import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_status.dart';
import 'package:silah_app/features/support/domain/repositories/support_tickets_repository.dart';

part 'support_report_cubit.freezed.dart';

@freezed
class SupportReportState with _$SupportReportState {
  const factory SupportReportState.initial() = _SupportReportInitial;
  const factory SupportReportState.submitting() = _SupportReportSubmitting;
  const factory SupportReportState.success({
    required SupportTicketEntity ticket,
  }) = _SupportReportSuccess;
  const factory SupportReportState.failure({required String message}) =
      _SupportReportFailure;
}

class SupportReportCubit extends Cubit<SupportReportState> {
  final SupportTicketsRepository repository;

  SupportReportCubit({required this.repository})
    : super(const SupportReportState.initial());

  Future<void> submit({required String description, String? subject}) async {
    final trimmed = description.trim();
    if (trimmed.isEmpty) {
      emit(SupportReportState.failure(message: Strings.error_fill_form.tr()));
      emit(const SupportReportState.initial());
      return;
    }

    emit(const SupportReportState.submitting());

    final ticket = SupportTicketEntity(
      subject: subject,
      description: trimmed,
      status: SupportTicketStatus.open,
    );

    final result = await repository.submitTicket(ticket);
    result.fold(
      (failure) =>
          emit(SupportReportState.failure(message: _mapFailure(failure))),
      (saved) => emit(SupportReportState.success(ticket: saved)),
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
