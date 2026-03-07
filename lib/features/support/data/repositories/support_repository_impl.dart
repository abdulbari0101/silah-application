import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/support/data/datasources/remote/support_remote_data_source.dart';
import 'package:silah_app/features/support/data/models/support_report_models.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_status.dart';
import 'package:silah_app/features/support/domain/repositories/support_tickets_repository.dart';

class SupportTicketsRepositoryoImpl implements SupportTicketsRepository {
  final SupportRemoteDataSource remoteDS;
  final Executor executor;

  SupportTicketsRepositoryoImpl({
    required this.remoteDS,
    required this.executor,
  });

  @override
  Future<Either<Failure, List<SupportTicketEntity>>> fetchTickets() {
    return executor.runOffline(() async {
      final role = await remoteDS.currentUserRole();
      if (role != 'admin') {
        return const <SupportTicketEntity>[];
      }

      return remoteDS.fetchReports();
    }, from: 'SupportTicketsRepository.fetchTickets');
  }

  @override
  Future<Either<Failure, SupportTicketEntity>> submitTicket(
    SupportTicketEntity ticket,
  ) {
    return executor.runOnline(() async {
      final role = await remoteDS.currentUserRole();
      if (role != 'user' && role != 'lawyer') {
        throw const MissingDataException(
          'Only users and lawyers can submit support reports',
        );
      }

      final description = ticket.description?.trim();
      if (description == null || description.isEmpty) {
        throw const MissingDataException('Missing support ticket description');
      }
      final uid = remoteDS.currentUserId();
      if (uid == null || uid.isEmpty) {
        throw const MissingDataException('Missing authenticated user');
      }

      final request = SupportReportRequestModel(
        reporterUid: uid,
        subject: ticket.subject?.trim(),
        details: description,
      );
      final response = await remoteDS.submitReport(request);

      final now = DateTime.now();
      final createdAt = ticket.createdAt ?? now.toIso8601String();
      final updatedAt = ticket.updatedAt ?? createdAt;
      final id = response.reportId?.trim().isNotEmpty == true
          ? response.reportId!.trim()
          : (ticket.id ?? now.microsecondsSinceEpoch.toString());

      return SupportTicketEntity(
        id: id,
        subject: ticket.subject,
        description: description,
        status: SupportTicketStatus.open,
        attachmentUrls: ticket.attachmentUrls,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
    }, from: 'SupportTicketsRepository.submitTicket');
  }
}
