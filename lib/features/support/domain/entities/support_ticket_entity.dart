import 'package:dart_mappable/dart_mappable.dart';

import 'support_ticket_status.dart';

part 'support_ticket_entity.mapper.dart';

@MappableClass()
class SupportTicketEntity with SupportTicketEntityMappable {
  final String? id;
  final String? reporterUid;
  final String? reporterRole;
  final String? subject;
  final String? description;
  final SupportTicketStatus status;
  final List<String>? attachmentUrls;
  final String? adminNotes;
  final String? createdAt;
  final String? updatedAt;

  const SupportTicketEntity({
    this.id,
    this.reporterUid,
    this.reporterRole,
    this.subject,
    this.description,
    this.status = SupportTicketStatus.open,
    this.attachmentUrls,
    this.adminNotes,
    this.createdAt,
    this.updatedAt,
  });
}
