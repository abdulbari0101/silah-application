import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';

class SupportTicketDetailsArgs {
  final SupportTicketEntity ticket;

  const SupportTicketDetailsArgs({required this.ticket});

  Map<String, dynamic> toJson() {
    return {'ticket': ticket.toJson()};
  }

  static SupportTicketDetailsArgs? fromExtra(Object? extra) {
    if (extra is SupportTicketDetailsArgs) {
      return extra;
    }
    if (extra is Map) {
      final rawTicket = extra['ticket'];
      if (rawTicket is Map) {
        return SupportTicketDetailsArgs(
          ticket: SupportTicketEntityMapper.fromJson(
            Map<String, dynamic>.from(rawTicket),
          ),
        );
      }
    }
    return null;
  }
}
