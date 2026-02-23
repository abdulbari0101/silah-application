import 'package:dart_mappable/dart_mappable.dart';

part 'registration_payload.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum RegistrationAccountType { user, lawyer }

@MappableClass(ignoreNull: true)
class RegistrationPayload with RegistrationPayloadMappable {
  final RegistrationAccountType accountType;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;

  // Lawyer-only fields (optional for user registrations).
  final String? gender;
  final String? genderId;
  final List<String>? legalFields;
  final List<String>? legalFieldIds;
  final String? city;
  final String? cityId;
  final String? areaId;
  final String? workplace;
  final String? workDestinationId;
  final String? officeName;
  final String? experienceYears;
  final String? licenseNumber;
  final String? nationalId;
  final String? avatarUrl;

  const RegistrationPayload({
    required this.accountType,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    this.gender,
    this.genderId,
    this.legalFields,
    this.legalFieldIds,
    this.city,
    this.cityId,
    this.areaId,
    this.workplace,
    this.workDestinationId,
    this.officeName,
    this.experienceYears,
    this.licenseNumber,
    this.nationalId,
    this.avatarUrl,
  });

  String get fullName {
    final parts = [firstName, lastName].where((value) => value.trim().isNotEmpty).toList();
    return parts.isEmpty ? '' : parts.join(' ');
  }
}
