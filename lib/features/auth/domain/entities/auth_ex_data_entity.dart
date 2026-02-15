import 'package:dart_mappable/dart_mappable.dart';

import '../../../../core/domain/entities/api/auth/customer_entity.dart';


part 'auth_ex_data_entity.mapper.dart';

@MappableClass()
class ExDataAuthEntity with ExDataAuthEntityMappable {
  final CustomerEntity? customer;

  const ExDataAuthEntity({
    this.customer,
  });
}
