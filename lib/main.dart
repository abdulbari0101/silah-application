import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA4DrEz2NzlvxFVPEulE_PXm9IYkfN-eYA",
        authDomain: "silah-app-9acb6.firebaseapp.com",
        projectId: "silah-app-9acb6",
        storageBucket: "silah-app-9acb6.firebasestorage.app",
        messagingSenderId: "330197769102",
        appId: "1:330197769102:web:9f34f333b7d0bcd34de2df",
        measurementId: "G-970DHKL9G1",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const SilahApp());
}

class SilahApp extends StatelessWidget {
  const SilahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SILAH',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Cairo'),
      home: const WelcomeScreen(),
    );
  }
}
