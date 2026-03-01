import 'package:flutter/material.dart';
import 'package:silah_app/core/presentation/ui/screen/success/screens/success_screen.dart';
import 'package:silah_app/features/app_shell/presentation/views/home/screens/home_screen.dart';
import 'package:silah_app/features/app_shell/presentation/views/splash/screens/splash_screen.dart';
import 'package:silah_app/features/app_shell/presentation/views/welcome/screens/welcome_screen.dart';
import 'package:silah_app/features/auth/presentation/views/login/login/screens/login_screen.dart';
import 'package:silah_app/features/auth/presentation/views/forgot_password/screens/forgot_password_screen.dart';
import 'package:silah_app/features/auth/presentation/views/change_password/screens/change_password_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/models/lawyer_registration_data.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/account_type_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/lawyer_license_verification_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/lawyer_professional_info_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/lawyer_sign_up_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/user_sign_up_screen.dart';
import 'package:silah_app/features/admin/presentation/views/tasks/screens/admin_tasks_screen.dart';
import 'package:silah_app/features/admin/presentation/views/details/models/admin_task_details_args.dart';
import 'package:silah_app/features/admin/presentation/views/details/screens/admin_task_details_screen.dart';
import 'package:silah_app/features/consultations/presentation/views/requests/screens/requests_screen.dart';
import 'package:silah_app/features/consultations/presentation/views/create_request/models/consultation_request_args.dart';
import 'package:silah_app/features/consultations/presentation/views/create_request/screens/consultation_request_screen.dart';
import 'package:silah_app/features/consultations/presentation/views/details/models/consultation_request_details_args.dart';
import 'package:silah_app/features/consultations/presentation/views/details/screens/consultation_request_details_screen.dart';
import 'package:silah_app/features/discovery/presentation/views/ai_consultation/screens/ai_consultation_screen.dart';
import 'package:silah_app/features/discovery/presentation/views/search/screens/search_filter_screen.dart';
import 'package:silah_app/features/discovery/presentation/views/search/screens/search_results_screen.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/screens/specifications_screen.dart';
import 'package:silah_app/features/messaging/presentation/views/chats/screens/chats_screen.dart';
import 'package:silah_app/features/messaging/presentation/views/conversation/models/chat_conversation_args.dart';
import 'package:silah_app/features/messaging/presentation/views/conversation/screens/chat_conversation_screen.dart';
import 'package:silah_app/features/notifications/presentation/views/notifications/screens/notifications_screen.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';
import 'package:silah_app/features/profiles/presentation/views/lawyer_profile/screens/lawyer_profile_screen.dart';
import 'package:silah_app/features/profiles/presentation/views/personal_info/screens/personal_info_screen.dart';
import 'package:silah_app/features/settings/presentation/views/langauge/screens/language_prefrence_screen.dart';
import 'package:silah_app/features/settings/presentation/views/privacy/screens/privacy_policy_screen.dart';
import 'package:silah_app/features/settings/presentation/views/settings/screens/settings_screen.dart';
import 'package:silah_app/features/support/presentation/views/report/screens/report_problem_screen.dart';
import 'package:silah_app/features/support/presentation/views/ticket_details/models/support_ticket_details_args.dart';
import 'package:silah_app/features/support/presentation/views/ticket_details/screens/support_ticket_details_screen.dart';
import 'package:silah_app/features/support/presentation/views/tickets/screens/support_tickets_screen.dart';
import 'package:silah_app/features/training/presentation/views/application/models/training_application_args.dart';
import 'package:silah_app/features/training/presentation/views/application/screens/training_application_form_screen.dart';
import 'package:silah_app/features/training/presentation/views/application_confirmation/models/training_application_confirmation_args.dart';
import 'package:silah_app/features/training/presentation/views/application_confirmation/screens/training_application_confirmation_screen.dart';
import 'package:silah_app/features/training/presentation/views/application_details/models/training_application_details_args.dart';
import 'package:silah_app/features/training/presentation/views/application_details/screens/training_application_details_screen.dart';
import 'package:silah_app/features/training/presentation/views/opportunities/models/training_opportunities_args.dart';
import 'package:silah_app/features/training/presentation/views/opportunities/screens/training_opportunities_screen.dart';
import 'package:silah_app/features/training/presentation/views/trainees/screens/trainees_screen.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/verification/presentation/views/request/screens/verification_request_screen.dart';
import 'package:silah_app/features/verification/presentation/views/status/screens/verification_status_screen.dart';

import 'route_info.dart';

class AppRoutes {
  // Core
  static final splash = RouteInfo(
    name: 'splash',
    path: '/',
    builder: () => const SplashScreen(),
  );
  static final onboarding = RouteInfo(
    name: 'onboardingScreen',
    path: '/onboarding',
    builder: () => const WelcomeScreen(),
  );

  // Auth
  static final login = RouteInfo(
    name: 'login',
    path: '/login',
    builder: () => const LoginScreen(),
  );

  static final changePassword = RouteInfo(
    name: 'change-password',
    path: '/change-password',
    builder: () => const ForgotPasswordScreen(),
  );

  static final updatePassword = RouteInfo(
    name: 'update-password',
    path: '/update-password',
    builder: () => const ChangePasswordScreen(),
  );
  static final RegistrationisterWizard = RouteInfo(
    name: 'self-Register-wizard',
    path: '/self-Register-wizard',
    builder: () => const AccountTypeScreen(),
  );
  static final userSignUp = RouteInfo(
    name: 'userSignUp',
    path: '/sign-up/user',
    builder: () => const UserSignUpScreen(),
  );
  static final lawyerSignUp = RouteInfo(
    name: 'lawyerSignUp',
    path: '/sign-up/lawyer',
    builder: () => const LawyerSignUpScreen(),
  );
  static final lawyerProfessionalInfo = RouteInfo(
    name: 'lawyerProfessionalInfo',
    path: '/sign-up/lawyer/professional',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is LawyerPersonalInfo) {
        return LawyerProfessionalInfoScreen(personalInfo: extra);
      }
      return const LawyerSignUpScreen();
    },
  );
  static final lawyerLicenseVerification = RouteInfo(
    name: 'lawyerLicenseVerification',
    path: '/sign-up/lawyer/license',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is LawyerProfessionalInfo) {
        return LawyerLicenseVerificationScreen(professionalInfo: extra);
      }
      return const LawyerSignUpScreen();
    },
  );

  // Main tabs
  static final home = RouteInfo(
    name: 'home',
    path: '/home',
    builder: () => const HomeScreen(),
  );
  static final messages = RouteInfo(
    name: 'messages',
    path: '/messages',
    builder: () => const MessagesScreen(),
  );
  static final chatThread = RouteInfo(
    name: 'chat-thread',
    path: '/messages/thread',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is ChatConversationArgs) {
        return ChatConversationScreen(args: extra);
      }
      return const MessagesScreen();
    },
  );
  static final requests = RouteInfo(
    name: 'requests',
    path: '/requests',
    builder: () => const RequestsScreen(),
  );
  static final verificationStatus = RouteInfo(
    name: 'verification-status',
    path: '/verification/status',
    builder: () => const VerificationStatusScreen(),
  );
  static final verificationRequest = RouteInfo(
    name: 'verification-request',
    path: '/verification/request',
    builder: () => const VerificationRequestScreen(),
  );
  static final consultationDetails = RouteInfo(
    name: 'consultation-details',
    path: '/consultations/details',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is ConsultationRequestDetailsArgs) {
        return ConsultationRequestDetailsScreen(args: extra);
      }
      return const RequestsScreen();
    },
  );

  static final specifications = RouteInfo(
    name: 'specifications',
    path: '/specifications',
    builder: () => const SpecificationsScreen(),
  );
  static final trainees = RouteInfo(
    name: 'trainees',
    path: '/trainees',
    builder: () => const TraineesScreen(),
  );
  static final trainingOpportunities = RouteInfo(
    name: 'training-opportunities',
    path: '/training/opportunities',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is TrainingOpportunitiesArgs) {
        return TrainingOpportunitiesScreen(args: extra);
      }
      return const TrainingOpportunitiesScreen();
    },
  );
  static final trainingApplication = RouteInfo(
    name: 'training-application',
    path: '/training/application',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is TrainingApplicationArgs) {
        return TrainingApplicationFormScreen(args: extra);
      }
      return const TrainingOpportunitiesScreen();
    },
  );
  static final trainingApplicationConfirm = RouteInfo(
    name: 'training-application-confirm',
    path: '/training/application/confirm',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is TrainingApplicationConfirmationArgs) {
        return TrainingApplicationConfirmationScreen(args: extra);
      }
      return const TrainingOpportunitiesScreen();
    },
  );
  static final trainingApplicationDetails = RouteInfo(
    name: 'training-application-details',
    path: '/training/application/details',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is TrainingApplicationDetailsArgs) {
        return TrainingApplicationDetailsScreen(args: extra);
      }
      return const TraineesScreen();
    },
  );
  static final settings = RouteInfo(
    name: 'settings',
    path: '/settings',
    builder: () => const SettingsScreen(),
  );
  static final personalInfo = RouteInfo(
    name: 'personal-info',
    path: '/profile/info',
    builder: () => const PersonalInfoScreen(),
  );
  static final privacyPolicy = RouteInfo(
    name: 'privacy-policy',
    path: '/privacy',
    builder: () => const PrivacyPolicyScreen(),
  );
  static final supportTickets = RouteInfo(
    name: 'support-tickets',
    path: '/support',
    builder: () => const SupportTicketsScreen(),
  );
  static final supportReport = RouteInfo(
    name: 'support-report',
    path: '/support/report',
    builder: () => const ReportProblemScreen(),
  );
  static final supportTicketDetails = RouteInfo(
    name: 'support-ticket-details',
    path: '/support/details',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is SupportTicketDetailsArgs) {
        return SupportTicketDetailsScreen(args: extra);
      }
      return const SupportTicketsScreen();
    },
  );
  static final adminTasks = RouteInfo(
    name: 'admin-tasks',
    path: '/admin/tasks',
    builder: () => const AdminTasksScreen(),
  );
  static final adminTaskDetails = RouteInfo(
    name: 'admin-task-details',
    path: '/admin/tasks/details',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is AdminTaskDetailsArgs) {
        return AdminTaskDetailsScreen(args: extra);
      }
      return const AdminTasksScreen();
    },
  );
  static final ai_consultation = RouteInfo(
    name: 'ai-consultation',
    path: '/ai-consultation',
    builder: () => const AiConsultationScreen(),
  );
  static final searchFilter = RouteInfo(
    name: 'search-filter',
    path: '/search',
    builder: () => const SearchFilterScreen(),
  );
  static final searchResults = RouteInfo(
    name: 'search-results',
    path: '/search-results',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is LegalSpecializationEntity) {
        return SearchResultsScreen(specialization: extra);
      }
      return const SearchFilterScreen();
    },
  );
  static final requestConsultation = RouteInfo(
    name: 'request-consultation',
    path: '/consultations/request',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is ConsultationRequestArgs) {
        return ConsultationRequestScreen(args: extra);
      }
      return const SearchFilterScreen();
    },
  );
  static final lawyerProfile = RouteInfo(
    name: 'lawyer-profile',
    path: '/lawyer-profile',
    stateBuilder: (state) {
      final extra = state.extra;
      if (extra is Map<String, dynamic>) {
        final lawyer = extra['lawyer'];
        final specialization = extra['specialization'];
        final specializationId = extra['specializationId'];
        if (lawyer is LawyerProfileEntity) {
          return LawyerProfileScreen(
            lawyer: lawyer,
            specialization: specialization is String ? specialization : null,
            specializationId: specializationId is String
                ? specializationId
                : null,
          );
        }
      } else if (extra is LawyerProfileEntity) {
        return LawyerProfileScreen(lawyer: extra);
      }
      return const SearchFilterScreen();
    },
  );

  /// Tabs used by the main shell (bottom navigation).
  static final tabRoutes = [home, requests, messages, settings];
  static final shellTabRoutes = [...tabRoutes, specifications, trainees];

  // Additional screens
  static final language = RouteInfo(
    name: 'language',
    path: '/language',
    builder: () => const LanguagePreferencesScreen(),
  );
  static final notification = RouteInfo(
    name: 'notification',
    path: '/notification',
    builder: () => const NotificationsScreen(),
  );

  static final success = RouteInfo(
    name: 'success',
    path: '/success',
    builder: () => const SuccessScreen(),
  );

  /// Root-level routes (shell/tab routes are registered separately).
  static final allRoutes = [
    splash,
    onboarding,
    login,
    changePassword,
    updatePassword,
    RegistrationisterWizard,
    userSignUp,
    lawyerSignUp,
    lawyerProfessionalInfo,
    lawyerLicenseVerification,
    verificationStatus,
    verificationRequest,
    language,
    notification,
    privacyPolicy,
    personalInfo,
    success,
    ai_consultation,
    searchFilter,
    searchResults,
    requestConsultation,
    consultationDetails,
    trainingOpportunities,
    trainingApplication,
    trainingApplicationConfirm,
    trainingApplicationDetails,
    lawyerProfile,
    chatThread,
    supportTickets,
    supportReport,
    supportTicketDetails,
    adminTasks,
    adminTaskDetails,
  ];

  /// Basic auth-state route sets. These are intentionally permissive for the simplified app.
  static final firstTimeGuestRoutes = [
    splash,
    onboarding,
    login,
    changePassword,
    success,
    RegistrationisterWizard,
    userSignUp,
    lawyerSignUp,
    lawyerProfessionalInfo,
    lawyerLicenseVerification,
  ];
  static final returningUserRoutes = [...firstTimeGuestRoutes, home];
  static final unverifiedDeviceRoutes = returningUserRoutes;

  static final unverifiedAccountRoutes = [...returningUserRoutes, ...tabRoutes];
  static final fullyVerifiedUserRoutes = [...returningUserRoutes, ...tabRoutes];

  static final timeoutExempt = <RouteInfo>[
    splash,
    onboarding,
    login,
    RegistrationisterWizard,
    userSignUp,
    lawyerSignUp,
    lawyerProfessionalInfo,
    lawyerLicenseVerification,
  ];

  static RouteInfo _placeholderRoute(String name, String path) {
    return RouteInfo(
      name: name,
      path: path,
      builder: () => _PlaceholderScreen(title: name),
      transitionType: RouteTransitionType.none,
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('$title is not available in the simplified Silah app'),
      ),
    );
  }
}
