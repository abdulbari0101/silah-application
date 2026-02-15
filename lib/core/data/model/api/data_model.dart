import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/domain/entities/data_entity.dart';

part 'data_model.mapper.dart';

@MappableClass(ignoreNull: true)
class DataModel with DataModelMappable {
  @MappableField(key: 'Currency')
  final String? currency;

  @MappableField(key: 'Balance')
  final String? balance;
  @MappableField(key: 'CustName')
  final String? custName;

  @MappableField(key: 'OTP_Code')
  final String? otp;

  @MappableField(key: 'OTP')
  final String? token;

  const DataModel({this.currency, this.balance, this.custName, this.otp, this.token});

  DataEntity toEntity() =>
      DataEntity(currency: currency, balance: balance, custName: custName, otp: otp, token: token);

  factory DataModel.fromEntity(DataEntity entity) => DataModel(
    currency: entity.currency,
    balance: entity.balance,
    custName: entity.custName,
    otp: entity.otp,
    token: entity.token,
  );
}
