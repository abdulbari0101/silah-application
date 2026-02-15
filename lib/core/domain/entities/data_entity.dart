import 'package:dart_mappable/dart_mappable.dart';
part 'data_entity.mapper.dart';
@MappableClass()
class DataEntity with DataEntityMappable {
  final String? currency;
  final String? balance;
  final String? custName;
  final String? otp;
  final String? token;

  const DataEntity({
    this.currency,
    this.balance,
    this.custName,
    this.otp,
    this.token,
  });

  
}
