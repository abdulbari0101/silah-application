import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';
import 'package:silah_app/features/support/data/models/support_report_models.dart';

part 'support_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class SupportService {
  factory SupportService(Dio dio, {String? baseUrl}) = _SupportService;

  @POST('/support/reports')
  Future<BaseApiResponse<SupportReportResponseModel>> submitReport(
    @Body() SupportReportRequestModel request,
  );

  @GET('/support/reports')
  Future<BaseApiResponse<SupportTicketsResponseModel>> fetchReports();

  @PATCH('/support/reports/{reportId}')
  Future<BaseApiResponse<SupportReportReviewResponseModel>> reviewReport(
    @Path('reportId') String reportId,
    @Body() SupportReportReviewRequestModel request,
  );
}
