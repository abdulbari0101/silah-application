import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';

abstract class SupportLocalDataSource {
  Future<List<SupportTicketEntity>> fetchTickets();
  Future<SupportTicketEntity> saveTicket(SupportTicketEntity ticket);
}

class SupportLocalDataSourceImpl extends SupportLocalDataSource {
  final AppCache appCache;
  final AppLogger logger;

  final List<SupportTicketEntity> _tickets = <SupportTicketEntity>[];

  SupportLocalDataSourceImpl({required this.appCache, required this.logger});

  @override
  Future<List<SupportTicketEntity>> fetchTickets() async {
    return List<SupportTicketEntity>.unmodifiable(_tickets);
  }

  @override
  Future<SupportTicketEntity> saveTicket(SupportTicketEntity ticket) async {
    _tickets.insert(0, ticket);
    return ticket;
  }
}
