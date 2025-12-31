import 'package:flutter/material.dart';
import 'package:lms/core/theme/app_theme.dart';
import 'package:lms/features/authentication/presentation/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Hybrid App',
      theme: appTheme, // Terapkan tema
      home: const SplashScreen(), // Ganti home dengan SplashScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
