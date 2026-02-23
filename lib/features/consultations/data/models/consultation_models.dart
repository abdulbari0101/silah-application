import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';

part 'consultation_models.mapper.dart';

@MappableClass(ignoreNull: true)
class ConsultationCreateRequestModel with ConsultationCreateRequestModelMappable {
  final String clientUid;
  final String lawyerUid;
  final String caseText;
  final String? specializationId;
  final String? specialization;

  const ConsultationCreateRequestModel({
    required this.clientUid,
    required this.lawyerUid,
    required this.caseText,
    this.specializationId,
    this.specialization,
  });

  factory ConsultationCreateRequestModel.fromEntity(ConsultationRequestEntity entity) {
    return ConsultationCreateRequestModel(
      clientUid: entity.clientId ?? '',
      lawyerUid: entity.lawyerId ?? '',
      caseText: entity.description ?? '',
      specializationId: entity.specializationId,
      specialization: entity.specializationId,
    );
  }

  Map<String, dynamic> toJson() => toMap();
}

@MappableClass(ignoreNull: true)
class ConsultationCreateResponseModel extends BaseRespWrapper
    with ConsultationCreateResponseModelMappable {
  final String? consultationId;

  const ConsultationCreateResponseModel({
    required super.result,
    this.consultationId,
  });
}

@MappableClass(ignoreNull: true)
class ConsultationStatusUpdateRequestModel with ConsultationStatusUpdateRequestModelMappable {
  final String status;

  const ConsultationStatusUpdateRequestModel({required this.status});

  factory ConsultationStatusUpdateRequestModel.fromStatus(ConsultationStatus status) {
    return ConsultationStatusUpdateRequestModel(status: status.name);
  }

  Map<String, dynamic> toJson() => toMap();
}

@MappableClass(ignoreNull: true)
class ConsultationStatusUpdateResponseModel extends BaseRespWrapper
    with ConsultationStatusUpdateResponseModelMappable {
  final String? status;

  const ConsultationStatusUpdateResponseModel({
    required super.result,
    this.status,
  });
}
