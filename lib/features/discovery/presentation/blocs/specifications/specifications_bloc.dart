import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/discovery/domain/entities/specification_item_entity.dart';
import 'package:silah_app/features/discovery/domain/repositories/discovery_repository.dart';

part 'specifications_event.dart';
part 'specifications_state.dart';

class SpecificationsBloc extends Bloc<SpecificationsEvent, SpecificationsState> {
  final DiscoveryRepository repository;
  PostRequestEntity postRequest = PostRequestEntity();

  SpecificationsBloc({required this.repository}) : super(DataPaymentInitial()) {
    on<LoadSpecifications>(
      _onSpecificationsEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  Future<void> _onSpecificationsEvent(
    LoadSpecifications event,
    Emitter<SpecificationsState> emit,
  ) async {
    emit(DataPaymentLoading());

    final result = await repository.fetchSpecializations();

    result.fold((failure) => _emitFailure(failure, emit), (data) {
      final items = data
          .map(
            (spec) => SpecificationItemEntity(
              name: spec.name ?? spec.code ?? spec.id,
            ),
          )
          .toList();
      emit(DataPaymentLoaded(data: items));
    });
  }

  void _emitFailure(Failure failure, Emitter<SpecificationsState> emit) {
    emit(
      BlocUtils.handleFailure(
        failure: failure,
        onError: (msg) => DataPaymentError(message: msg),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }
}
