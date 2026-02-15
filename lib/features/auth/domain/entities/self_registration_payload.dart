class SelfRegistrationPayload {
  final SelfRegAccountType accountType;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;

  // Lawyer-only fields (optional for user registrations).
  final String? gender;
  final String? legalField;
  final String? city;
  final String? workplace;
  final String? officeName;
  final String? experienceYears;
  final String? licenseNumber;
  final String? nationalId;

  const SelfRegistrationPayload({
    required this.accountType,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    this.gender,
    this.legalField,
    this.city,
    this.workplace,
    this.officeName,
    this.experienceYears,
    this.licenseNumber,
    this.nationalId,
  });

  String get fullName {
    final parts = [firstName, lastName].where((value) => value.trim().isNotEmpty).toList();
    return parts.isEmpty ? '' : parts.join(' ');
  }
}

enum SelfRegAccountType { user, lawyer }
