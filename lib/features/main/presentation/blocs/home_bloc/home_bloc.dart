import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool _isHomeScreenCalled = false;

  HomeBloc() : super(HomeInitial()) {
   

    on<RefreshHomeEvent>(
      _onRefreshHomeEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );

  }


  void _checkIfAllRefreshed(Emitter<HomeState> emit) {
    if ( _isHomeScreenCalled) {
      emit(HomeRefreshed());
      _resetRefreshFlags();
    }
  }

  void _emitRefreshError(String message, Emitter<HomeState> emit) {
    if (_isHomeScreenCalled) {
      emit(HomeRefreshError(message: message));
      _resetRefreshFlags();
    }
  }

  void _resetRefreshFlags() {
    _isHomeScreenCalled = false;
  }

  Future<void> _onRefreshHomeEvent(RefreshHomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    _isHomeScreenCalled = true;
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
