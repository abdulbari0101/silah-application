
import 'package:flutter_bloc/flutter_bloc.dart';

class FormCubit extends Cubit<bool> {
  FormCubit() : super(false);

  void updateValidity(bool isValid) {
    if (state != isValid) {
      emit(isValid);
    }
  }

  void reset() {
    emit(false);
  }
}
