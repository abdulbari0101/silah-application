import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_status.dart';

part 'support_report_models.mapper.dart';

@MappableClass(ignoreNull: true)
class SupportReportRequestModel with SupportReportRequestModelMappable {
  final String reporterUid;
  final String? subject;
  final String details;

  const SupportReportRequestModel({
    required this.reporterUid,
    this.subject,
    required this.details,
  });
}

@MappableClass(ignoreNull: true)
class SupportReportResponseModel extends BaseRespWrapper
    with SupportReportResponseModelMappable {
  final String? reportId;

  const SupportReportResponseModel({required super.result, this.reportId});
}

@MappableClass(ignoreNull: true)
class SupportTicketItemModel with SupportTicketItemModelMappable {
  final String? reportId;
  final String? reporterUid;
  final String? role;
  final String? subject;
  final String? details;
  final String? status;
  final String? adminNotes;
  final String? createdAt;
  final String? updatedAt;

  const SupportTicketItemModel({
    this.reportId,
    this.reporterUid,
    this.role,
    this.subject,
    this.details,
    this.status,
    this.adminNotes,
    this.createdAt,
    this.updatedAt,
  });

  SupportTicketEntity toEntity() {
    return SupportTicketEntity(
      id: reportId,
      subject: subject,
      description: details,
      status: _parseStatus(status),
      attachmentUrls: const <String>[],
      createdAt: createdAt,
      updatedAt: updatedAt ?? createdAt,
    );
  }

  SupportTicketStatus _parseStatus(String? value) {
    final normalized = value?.trim().toLowerCase();
    switch (normalized) {
      case 'in_progress':
      case 'inprogress':
      case 'in-progress':
        return SupportTicketStatus.inProgress;
      case 'resolved':
        return SupportTicketStatus.resolved;
      case 'closed':
        return SupportTicketStatus.closed;
      case 'open':
      default:
        return SupportTicketStatus.open;
    }
  }
}

@MappableClass(ignoreNull: true)
class SupportTicketsResponseModel extends BaseRespWrapper
    with SupportTicketsResponseModelMappable {
  final List<SupportTicketItemModel>? reports;

  const SupportTicketsResponseModel({required super.result, this.reports});
}
