import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';

part 'verification_models.mapper.dart';

@MappableClass(ignoreNull: true)
class VerificationRequestModel with VerificationRequestModelMappable {
  final String licenseNumber;
  final String nationalId;
  final String lawyerUid;

  const VerificationRequestModel({
    required this.licenseNumber,
    required this.nationalId,
    required this.lawyerUid,
  });
}

@MappableClass(ignoreNull: true)
class VerificationResponseModel extends BaseRespWrapper with VerificationResponseModelMappable {
  final String? status;

  const VerificationResponseModel({
    required super.result,
    this.status,
  });
}
