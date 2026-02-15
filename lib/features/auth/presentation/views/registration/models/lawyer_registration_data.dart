class LawyerPersonalInfo {
  final String fullName;
  final String email;
  final String phone;
  final String gender;
  final String password;

  const LawyerPersonalInfo({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
  });
}

class LawyerProfessionalInfo {
  final LawyerPersonalInfo personal;
  final String legalField;
  final String city;
  final String workplace;
  final String officeName;
  final String experienceYears;

  const LawyerProfessionalInfo({
    required this.personal,
    required this.legalField,
    required this.city,
    required this.workplace,
    required this.officeName,
    required this.experienceYears,
  });
}
