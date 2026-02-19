import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';

part 'consultation_models.mapper.dart';

@MappableClass(ignoreNull: true)
class ConsultationCreateRequestModel with ConsultationCreateRequestModelMappable {
  final String clientUid;
  final String lawyerUid;
  final String caseText;
  final String specialization;

  const ConsultationCreateRequestModel({
    required this.clientUid,
    required this.lawyerUid,
    required this.caseText,
    required this.specialization,
  });
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
