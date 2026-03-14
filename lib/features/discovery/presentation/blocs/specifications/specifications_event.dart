part of 'specifications_bloc.dart';

@freezed
sealed class SpecificationsEvent with _$SpecificationsEvent {
  const factory SpecificationsEvent.load() = LoadSpecifications;
}
