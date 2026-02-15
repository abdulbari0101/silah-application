import 'package:dart_mappable/dart_mappable.dart';
import '../../../../domain/entities/api/auth/customer_entity.dart';

part 'customer_model.mapper.dart';

@MappableClass(ignoreNull: true)
class CustomerModel with CustomerModelMappable {
  @MappableField(key: 'NAME')
  final String? fullName;

  @MappableField(key: 'TYPENAME')
  final String? typeName;

  @MappableField(key: 'TYPENO')
  final int? typeNo;

  @MappableField(key: 'NOTIFY')
  final int? notify;

  @MappableField(key: 'EMAIL')
  final String? email;


  @MappableField(key: 'STATUS')
  final int? accountStatus;

  @MappableField(key: 'mMobileNo')
  final String? mobileNo;

  @MappableField(key: 'mLangId')
  final int? langId;

  @MappableField(key: 'LANG')
  final int? langIdAlt;


  @MappableField(key: 'SHORTCODE')
  final String? shortCode;

  @MappableField(key: 'CCODE')
  final String? cCode;

  // new verialbes 

    @MappableField(key: 'LAST_NAME')
  final String? lastName;
  @MappableField(key: 'FIRST_NAME')
  final String? firstName;

    @MappableField(key: 'BRTH_DATE')
  final String? birthDate;

  const CustomerModel({
    this.fullName,
  
    this.typeName,
    this.typeNo,
    this.notify,
    this.email,
    this.accountStatus,

    this.mobileNo,
    this.langId,
    this.langIdAlt,
    this.cCode,
    this.shortCode,
    this.lastName,
    this.firstName,
    this.birthDate , 
  
  });

  CustomerEntity toEntity() => CustomerEntity(
    fullName: fullName,
    typeName: typeName,
    email: email,
    accountStatus: accountStatus,
    mobileNo: mobileNo,
    langId: langId ?? langIdAlt,
    cCode: cCode,

    shortCode: shortCode,
    typeNo: typeNo,
    firstName: firstName,
    lastName: lastName,
   birthDate: birthDate , 

 

  );

  factory CustomerModel.fromEntity(CustomerEntity entity) => CustomerModel(
    fullName: entity.fullName,
    typeName: entity.typeName,

    email: entity.email,
    accountStatus: entity.accountStatus,

    mobileNo: entity.mobileNo,

    langId: entity.langId,
    cCode: entity.cCode,

    shortCode: entity.shortCode,
    typeNo: entity.typeNo,

      firstName: entity.firstName,
    lastName: entity.lastName,
   birthDate:entity. birthDate , 

 

    
  );

}
