import 'package:flutter/material.dart';
import 'screens/welcome_page.dart';

void main() {
  runApp(const SilahApp());
}

class SilahApp extends StatelessWidget {
  const SilahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SILAH',
      theme: ThemeData(useMaterial3: true),
      home: const WelcomeScreen(),
    );
  }
}
