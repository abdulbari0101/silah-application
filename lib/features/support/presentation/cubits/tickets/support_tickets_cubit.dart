import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/domain/repositories/support_tickets_repository.dart';

part 'support_tickets_cubit.freezed.dart';

@freezed
class SupportTicketsState with _$SupportTicketsState {
  const factory SupportTicketsState.loading() = _SupportTicketsLoading;
  const factory SupportTicketsState.empty() = _SupportTicketsEmpty;
  const factory SupportTicketsState.ready({
    required List<SupportTicketEntity> tickets,
  }) = _SupportTicketsReady;
  const factory SupportTicketsState.failure({required String message}) =
      _SupportTicketsFailure;
}

class SupportTicketsCubit extends Cubit<SupportTicketsState> {
  final SupportTicketsRepository repository;

  SupportTicketsCubit({required this.repository})
    : super(const SupportTicketsState.loading());

  Future<void> load() async {
    emit(const SupportTicketsState.loading());
    final result = await repository.fetchTickets();
    result.fold(
      (failure) =>
          emit(SupportTicketsState.failure(message: _mapFailure(failure))),
      (tickets) {
        if (tickets.isEmpty) {
          emit(const SupportTicketsState.empty());
        } else {
          emit(SupportTicketsState.ready(tickets: tickets));
        }
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
