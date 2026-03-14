import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<RefreshHomeEvent>(
      _onRefreshHomeEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  bool _isHomeScreenCalled = false;

  void _checkIfAllRefreshed(Emitter<HomeState> emit) {
    if (_isHomeScreenCalled) {
      emit(const HomeState.refreshed());
      _resetRefreshFlags();
    }
  }

  void _resetRefreshFlags() {
    _isHomeScreenCalled = false;
  }

  Future<void> _onRefreshHomeEvent(
    RefreshHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    _isHomeScreenCalled = true;
    _checkIfAllRefreshed(emit);
  }
}
