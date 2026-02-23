import 'package:flutter/material.dart';
import 'package:silah_app/core/presentation/ui/screen/success/screens/success_screen.dart';
import 'package:silah_app/features/app_shell/presentation/views/home/screens/home_screen.dart';
import 'package:silah_app/features/app_shell/presentation/views/splash/screens/splash_screen.dart';
import 'package:silah_app/features/app_shell/presentation/views/welcome/screens/welcome_screen.dart';
import 'package:silah_app/features/auth/presentation/views/login/login/screens/login_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/models/lawyer_registration_data.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/account_type_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/lawyer_license_verification_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/lawyer_professional_info_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/lawyer_sign_up_screen.dart';
import 'package:silah_app/features/auth/presentation/views/registration/screens/user_sign_up_screen.dart';
import 'package:silah_app/features/consultations/presentation/views/requests/screens/requests_screen.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/screens/specifications_screen.dart';
import 'package:silah_app/features/messaging/presentation/views/chats/screens/chats_screen.dart';
import 'package:silah_app/features/settings/presentation/views/langauge/screens/language_prefrence_screen.dart';
import 'package:silah_app/features/settings/presentation/views/settings/screens/settings_screen.dart';
import 'package:silah_app/features/training/presentation/views/trainees/screens/trainees_screen.dart';

import 'route_info.dart';

class AppRoutes {
  // Core
  static final splash = RouteInfo(name: 'splash', path: '/', builder: () => const SplashScreen());
  static final onboarding = RouteInfo(
    name: 'onboardingScreen',
    path: '/onboarding',
    builder: () => const WelcomeScreen(),
  );

  // Auth
  static final login = RouteInfo(name: 'login', path: '/login', builder: () => const LoginScreen());

  static final changePassword = _placeholderRoute('change-password', '/change-password');

  static final updatePassword = _placeholderRoute('update-password', '/update-password');
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
  static final home = RouteInfo(name: 'home', path: '/home', builder: () => const HomeScreen());
  static final messages = RouteInfo(name: 'messages', path: '/messages', builder: () => const MessagesScreen());
  static final requests = RouteInfo(
    name: 'requests',
    path: '/requests',
    builder: () => const RequestsScreen(),
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
  static final settings = RouteInfo(
    name: 'settings',
    path: '/settings',
    builder: () => const SettingsScreen(),
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
  static final notification = _placeholderRoute('notification', '/notification');

  static final success = RouteInfo(
    name: 'success',
    path: '/success',
    builder: () => const SuccessScreen(),
  );

  static final allRoutes = [
    onboarding,
    login,
    changePassword,
    updatePassword,
    RegistrationisterWizard,
    userSignUp,
    lawyerSignUp,
    lawyerProfessionalInfo,
    lawyerLicenseVerification,
    specifications,
    trainees,
    language,
    notification,
    success,
    ...tabRoutes,
  ];

  /// Basic auth-state route sets. These are intentionally permissive for the simplified app.
  static final firstTimeGuestRoutes = [
    splash,
    onboarding,
    login,
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
      body: Center(child: Text('$title is not available in the simplified Silah app')),
    );
  }
}
