import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_state_data.dart';

import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

part 'app_state_bloc.mapper.dart';
part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(AppStateInitial()) {
    on<UserLoggedIn>(_handleUserLoggedIn);
    on<UpdateSession>(_handleUpdateSession);
    on<InjectDataBeforeAppStart>(_handleInjectDataBeforeAppStart);
    on<SyncLocalDataToAppState>(_handleSyncLocalDataToAppState);
  }

  void _handleUpdateSession(UpdateSession event, Emitter<AppStateState> emit) {
    final updated = state.data.copyWith(
      customer: event.authData ?? state.data.customer,
     
      isLoggedIn: event.isLoggedIn ?? state.data.isLoggedIn,
      userAuthStatus: event.userAuthStatus ?? state.data.userAuthStatus,
    );
    emit(AppStateLoaded(updated));
  }

  void _handleUserLoggedIn(UserLoggedIn event, Emitter<AppStateState> emit) {
    final updated = state.data.copyWith(
      customer: event.authData,
      isLoggedIn: true,
      userAuthStatus: event.userAuthStatus,
    );
    emit(AppStateLoaded(updated));
  }

  void _handleSyncLocalDataToAppState(SyncLocalDataToAppState event, Emitter<AppStateState> emit) {
    final next = event.mapper(state.data);
    emit(AppStateLoaded(next));
  }

  void _handleInjectDataBeforeAppStart(
    InjectDataBeforeAppStart event,
    Emitter<AppStateState> emit,
  ) {
    final updated = state.data.copyWith(
      userAuthStatus: AppStateData.computeUserAuthStatus(
        isLoggedIn: false,
        isDeviceVerified: false,
        isAccountVerified: false,
        wasLoggedInBefore: event.customer?.phone != null,
      ),
      customer: event.customer,
    );

    emit(AppStateLoaded(updated));
  }
}
