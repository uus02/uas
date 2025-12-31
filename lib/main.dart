import 'package:flutter/material.dart';
import 'package:lms/core/theme/app_theme.dart';
// Ganti home dengan SplashScreen nanti di Perintah #2
// import 'package:flutter/cupertino.dart'; // Unused in this snippet but requested by user, I will include if needed or just minimal. User code showed it.

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
      home: const Scaffold(body: Center(child: Text('Loading...'))), // Placeholder sementara with Scaffold for better view
      debugShowCheckedModeBanner: false,
    );
  }
}
