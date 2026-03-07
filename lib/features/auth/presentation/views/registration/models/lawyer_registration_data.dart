import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';

class LawyerPersonalInfo {
  final String fullName;
  final String email;
  final String phone;
  final String gender;
  final String? genderId;
  final String password;

  const LawyerPersonalInfo({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.gender,
    this.genderId,
    required this.password,
  });
}

class LawyerProfessionalInfo {
  final LawyerPersonalInfo personal;
  final List<LegalSpecializationEntity> legalFields;
  final String city;
  final String? cityId;
  final String? areaId;
  final String workplace;
  final String? workDestinationId;
  final String officeName;
  final String experienceYears;

  const LawyerProfessionalInfo({
    required this.personal,
    required this.legalFields,
    required this.city,
    this.cityId,
    this.areaId,
    required this.workplace,
    this.workDestinationId,
    required this.officeName,
    required this.experienceYears,
  });
}
