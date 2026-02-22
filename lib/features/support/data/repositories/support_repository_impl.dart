import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
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
    // TODO: implement fetchTickets
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SupportTicketEntity>> submitTicket(SupportTicketEntity ticket) {
    // TODO: implement submitTicket
    throw UnimplementedError();
  }
}
