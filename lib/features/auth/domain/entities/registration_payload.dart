class RegistrationPayload {
  final RegistrationAccountType accountType;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;

  // Lawyer-only fields (optional for user registrations).
  final String? gender;
  final String? genderId;
  final String? legalField;
  final String? legalFieldId;
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
    this.legalField,
    this.legalFieldId,
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

enum RegistrationAccountType { user, lawyer }
