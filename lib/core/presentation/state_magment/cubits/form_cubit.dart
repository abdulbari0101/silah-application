import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'form_cubit.freezed.dart';

@freezed
sealed class FormCubitState with _$FormCubitState {
  const factory FormCubitState({@Default(false) bool isValid}) =
      _FormCubitState;
}

class FormCubit extends Cubit<FormCubitState> {
  FormCubit() : super(const FormCubitState());

  void updateValidity(bool isValid) {
    if (state.isValid != isValid) {
      emit(state.copyWith(isValid: isValid));
    }
  }

  void reset() {
    emit(const FormCubitState());
  }
}
