import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result.dart';
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
  final NotifyRepo repository;
  StreamSubscription<NotificationResult>? _subscription;

  NotificationsCubit({required this.repository})
    : super(const NotificationsState.loading());

  Future<void> load() async {
    emit(const NotificationsState.loading());
    await _subscription?.cancel();
    _subscription = repository.observeAllNotifications().listen(
      (result) {
        final groups = result.groups ?? const [];
        if (groups.isEmpty) {
          emit(const NotificationsState.empty());
        } else {
          emit(NotificationsState.ready(result: result));
        }
      },
      onError: (Object error) {
        emit(
          NotificationsState.failure(
            message: _mapFailure(UnexpectedFailure(error.toString())),
          ),
        );
      },
    );
  }

  Future<void> markAllSeen() async {
    await repository.markAllNotificationsAsSeen();
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
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
