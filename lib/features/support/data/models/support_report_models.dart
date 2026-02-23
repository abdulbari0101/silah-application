import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';

part 'support_report_models.mapper.dart';

@MappableClass(ignoreNull: true)
class SupportReportRequestModel with SupportReportRequestModelMappable {
  final String reporterUid;
  final String details;

  const SupportReportRequestModel({required this.reporterUid, required this.details});
}

@MappableClass(ignoreNull: true)
class SupportReportResponseModel extends BaseRespWrapper with SupportReportResponseModelMappable {
  final String? reportId;

  const SupportReportResponseModel({required super.result, this.reportId});
}
