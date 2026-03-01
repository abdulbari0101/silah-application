import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/platform/device_info_helper.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/support/data/datasources/local/support_local_data_source.dart';
import 'package:silah_app/features/support/data/datasources/remote/support_remote_data_source.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/domain/repositories/support_tickets_repository.dart';

class SupportTicketsRepositoryoImpl implements SupportTicketsRepository {
  final SupportRemoteDataSource remoteDS;
  final SupportLocalDataSource localDS;
  final DeviceInfoHelper deviceInfoHelper;

  final Executor executor;

  final AppLogger logger = locator.get<AppLogger>();

  SupportTicketsRepositoryoImpl({
    required this.remoteDS,
    required this.localDS,
    required this.executor,
    required this.deviceInfoHelper,
  });

  @override
  Future<Either<Failure, List<SupportTicketEntity>>> fetchTickets() {
    return executor.runOffline(
      () => localDS.fetchTickets(),
      from: 'SupportTicketsRepository.fetchTickets',
    );
  }

  @override
  Future<Either<Failure, SupportTicketEntity>> submitTicket(
    SupportTicketEntity ticket,
  ) {
    return executor.runOffline(() async {
      final description = ticket.description?.trim();
      if (description == null || description.isEmpty) {
        throw const MissingDataException('Missing support ticket description');
      }

      final now = DateTime.now();
      final createdAt = ticket.createdAt ?? now.toIso8601String();
      final updatedAt = ticket.updatedAt ?? createdAt;
      final id = ticket.id ?? now.microsecondsSinceEpoch.toString();

      final stored = SupportTicketEntity(
        id: id,
        subject: ticket.subject,
        description: description,
        status: ticket.status,
        attachmentUrls: ticket.attachmentUrls,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      return localDS.saveTicket(stored);
    }, from: 'SupportTicketsRepository.submitTicket');
  }
}
