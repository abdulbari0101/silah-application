import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';

abstract class SupportTicketsRepository {
  Future<Either<Failure, SupportTicketEntity>> submitTicket(
    SupportTicketEntity ticket,
  );

  Future<Either<Failure, List<SupportTicketEntity>>> fetchTickets();
}
