import 'package:dart_mappable/dart_mappable.dart';

import 'case_attachment_entity.dart';
import 'consultation_close_reason.dart';
import 'consultation_status.dart';

part 'consultation_request_entity.mapper.dart';

@MappableClass()
class ConsultationRequestEntity with ConsultationRequestEntityMappable {
  final String? id;
  final String? clientId;
  final String? lawyerId;
  final String? specializationId;
  final String? description;
  final ConsultationStatus status;
  final ConsultationCloseReason? closeReason;
  final List<CaseAttachmentEntity>? attachments;
  final String? createdAt;
  final String? updatedAt;
  final String? closedAt;

  const ConsultationRequestEntity({
    this.id,
    this.clientId,
    this.lawyerId,
    this.specializationId,
    this.description,
    this.status = ConsultationStatus.pending,
    this.closeReason,
    this.attachments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
  });
}
