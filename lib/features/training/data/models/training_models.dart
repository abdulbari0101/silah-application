import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';

part 'training_models.mapper.dart';

@MappableClass(ignoreNull: true)
class TrainingApplicationCreateRequestModel
    with TrainingApplicationCreateRequestModelMappable {
  final String opportunityId;
  final String traineeUid;
  final String cvUrl;
  final String? fullName;
  final String? university;
  final String? faculty;
  final String? cityId;
  final String? city;
  final String? areaId;
  final int? graduationYear;

  const TrainingApplicationCreateRequestModel({
    required this.opportunityId,
    required this.traineeUid,
    required this.cvUrl,
    this.fullName,
    this.university,
    this.faculty,
    this.cityId,
    this.city,
    this.areaId,
    this.graduationYear,
  });

  factory TrainingApplicationCreateRequestModel.fromEntity(
    TrainingApplicationEntity entity,
  ) {
    return TrainingApplicationCreateRequestModel(
      opportunityId: entity.opportunityId ?? '',
      traineeUid: entity.traineeId ?? '',
      cvUrl: entity.cvUrl ?? '',
      fullName: entity.fullName,
      university: entity.university,
      faculty: entity.faculty,
      cityId: entity.cityId ?? entity.city,
      city: entity.city,
      areaId: entity.areaId,
      graduationYear: entity.graduationYear,
    );
  }
}

@MappableClass(ignoreNull: true)
class TrainingApplicationCreateResponseModel extends BaseRespWrapper
    with TrainingApplicationCreateResponseModelMappable {
  final String? applicationId;

  const TrainingApplicationCreateResponseModel({
    required super.result,
    this.applicationId,
  });
}

@MappableClass(ignoreNull: true)
class TrainingApplicationStatusUpdateRequestModel
    with TrainingApplicationStatusUpdateRequestModelMappable {
  final String status;

  const TrainingApplicationStatusUpdateRequestModel({required this.status});

  factory TrainingApplicationStatusUpdateRequestModel.fromStatus(
    TrainingApplicationStatus status,
  ) => TrainingApplicationStatusUpdateRequestModel(status: status.apiValue);
}

@MappableClass(ignoreNull: true)
class TrainingApplicationStatusUpdateResponseModel extends BaseRespWrapper
    with TrainingApplicationStatusUpdateResponseModelMappable {
  final String? status;

  const TrainingApplicationStatusUpdateResponseModel({
    required super.result,
    this.status,
  });
}
