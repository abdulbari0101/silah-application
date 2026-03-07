import 'package:dart_mappable/dart_mappable.dart';

part 'training_application_status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum TrainingApplicationStatus { pending, accepted, rejected, cancelled }

extension TrainingApplicationStatusX on TrainingApplicationStatus {
  static TrainingApplicationStatus? tryParse(String? value) {
    switch (value?.trim().toLowerCase()) {
      case 'accepted':
        return TrainingApplicationStatus.accepted;
      case 'rejected':
        return TrainingApplicationStatus.rejected;
      case 'cancelled':
        return TrainingApplicationStatus.cancelled;
      case 'pending':
        return TrainingApplicationStatus.pending;
      default:
        return null;
    }
  }

  String get apiValue => name;
}
