import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/features/auth/domain/entities/auth_ex_data_entity.dart';

import '../../../../core/data/model/api/auth/customer_model.dart';

part 'ex_data_auth_model.mapper.dart';

@MappableClass(ignoreNull: true)
class ExDataAuthModel extends BaseRespWrapper with ExDataAuthModelMappable {
  @MappableField(key: 'CUSTOMER')
  final CustomerModel? customer;


  ExDataAuthModel({
    this.customer,
    super.result,
   
  });

 

  // ✅ Convert model to entity
  ExDataAuthEntity toEntity() {
    final missing = <String>[];

    if (customer == null) missing.add('CUSTOMER');
    

    if (missing.isNotEmpty) {
      throw AuthException(
        'Missing required field(s): ${missing.join(', ')}',
        ErrorCodes.notFound404,
      );
    }

    return ExDataAuthEntity(
      customer: customer!.toEntity(),
   
    );
  }

  validLoginResponse() {

    if (customer == null) throw MissingDataException("Missing customer");

  }
}
