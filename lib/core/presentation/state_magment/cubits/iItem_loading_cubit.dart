import 'package:flutter_bloc/flutter_bloc.dart';

class ItemLoadingCubit extends Cubit<Map<int, bool>> {
  ItemLoadingCubit() : super({});

  void setLoading(int? operationId, bool isLoading) {
    if (operationId == null) return;

    final newState = Map<int, bool>.from(state);

    if (isLoading) {

      newState[operationId] = true;
    } else {
      newState.remove(operationId);
    }

    emit(newState);
  }

  bool isLoading(int operationId) {
    return state.containsKey(operationId);
  }

  bool isNotEmpty() {
    return state.isNotEmpty;
  }
}
