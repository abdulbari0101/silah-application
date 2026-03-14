part of 'specifications_bloc.dart';

@freezed
sealed class SpecificationsState with _$SpecificationsState {
  const factory SpecificationsState.initial() = DataPaymentInitial;
  const factory SpecificationsState.loading() = DataPaymentLoading;
  const factory SpecificationsState.loaded({
    required List<LegalSpecializationEntity> data,
  }) = DataPaymentLoaded;
  const factory SpecificationsState.error({required String message}) =
      DataPaymentError;
}
