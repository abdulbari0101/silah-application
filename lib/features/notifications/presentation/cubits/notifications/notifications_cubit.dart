import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result_extensions.dart';
import 'package:silah_app/features/notifications/domain/repositories/notification_repository.dart';

part 'notifications_cubit.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.loading() = _NotificationsLoading;
  const factory NotificationsState.empty() = _NotificationsEmpty;
  const factory NotificationsState.ready({required NotificationResult result}) =
      _NotificationsReady;
  const factory NotificationsState.failure({required String message}) =
      _NotificationsFailure;
}

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepository repository;

  NotificationsCubit({required this.repository})
    : super(const NotificationsState.loading());

  Future<void> load() async {
    emit(const NotificationsState.loading());
    final result = await repository.fetchNotifications();
    result.fold(
      (failure) =>
          emit(NotificationsState.failure(message: _mapFailure(failure))),
      (data) {
        if (data.isEmpty) {
          emit(const NotificationsState.empty());
          return;
        }
        emit(NotificationsState.ready(result: data));
      },
    );
  }

  Future<void> markAllSeen() async {
    final currentResult = state.maybeWhen(
      ready: (result) => result,
      orElse: () => null,
    );
    if (currentResult == null || currentResult.unSeenCount == 0) {
      return;
    }

    final result = await repository.markAllNotificationsAsSeen();
    result.fold((_) => null, (_) {
      emit(
        NotificationsState.ready(result: currentResult.markAllSeenLocally()),
      );
    });
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
