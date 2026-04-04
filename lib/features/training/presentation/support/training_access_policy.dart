import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class TrainingAccessPolicy {
  static bool isTraineeUser(AuthUserEntity? user) {
    if (user == null || _isAdmin(user) || _isLawyer(user)) {
      return false;
    }
    return _parseBool(user.profile?['isTrainee']);
  }

  static bool currentLawyerAcceptsTrainees(AuthUserEntity? user) {
    if (user == null || !_isLawyer(user)) {
      return false;
    }
    if (user.accountType == AuthAccountType.lawyer &&
        user.profile?['workplace'].toString().trim() ==
            'أعمل لدى مكتب محاماة'.trim()) {
      return false;
    }

    return _parseBool(user.profile?['acceptsTrainees']) ||
        _parseBool(user.profile?['isTrainee']);
  }

  static bool canRequestTraining({
    required AuthUserEntity? viewer,
    required LawyerProfileEntity lawyer,
  }) {
    final lawyerId = lawyer.id?.trim();
    return lawyerId != null &&
        lawyerId.isNotEmpty &&
        lawyer.acceptsTrainees &&
        lawyer.workplace?.trim() != 'أعمل لدى مكتب محاماة'.trim() &&
        isTraineeUser(viewer);
  }

  static bool canApplyForOpportunity(AuthUserEntity? viewer) {
    return isTraineeUser(viewer);
  }

  static bool _isAdmin(AuthUserEntity user) {
    return (user.profile?['accountType']?.toString().toLowerCase() ==
            'admin') ||
        (user.profile?['role']?.toString().toLowerCase() == 'admin');
  }

  static bool _isLawyer(AuthUserEntity user) {
    return user.accountType == AuthAccountType.lawyer ||
        user.profile?['accountType']?.toString().toLowerCase() == 'lawyer';
  }

  static bool _parseBool(Object? value) {
    if (value is bool) {
      return value;
    }
    if (value is num) {
      return value != 0;
    }
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      return normalized == 'true' || normalized == '1' || normalized == 'yes';
    }
    return false;
  }
}
