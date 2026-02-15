import 'package:dart_mappable/dart_mappable.dart';
part 'customer_entity.mapper.dart';
@MappableClass()
class CustomerEntity with CustomerEntityMappable {
  final String? fullName;

  final String? typeName;
  final int? typeNo;
  final String? email;
  final int? accountStatus;
  final String? mobileNo;
  final int? langId;

  final String? shortCode;
  final String? cCode;

// varialbes 
  final String? lastName;
  final String? firstName;


  final String? birthDate;


  const CustomerEntity({
    this.fullName,
  
    this.typeName,
    this.typeNo,
    this.email,
    this.accountStatus,
  
    this.mobileNo,
    this.langId,
    this.cCode,
    this.shortCode,

    this.lastName,
    this.firstName,
    this.birthDate,
    

  });

  
}
