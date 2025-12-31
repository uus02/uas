import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';

// Text Styles
const TextStyle kHeadingTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 16,
  color: kTextColor,
);

final ThemeData appTheme = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColor,
  // Mengatur skema warna menggunakan Primary Color
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    primary: kPrimaryColor,
    secondary: kAccentColor,
    background: kBackgroundColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kPrimaryColor, 
    foregroundColor: Colors.white, 
    elevation: 0,
    centerTitle: true,
  ),
  // Mengatur style tombol Elevated Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), 
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  // Mengatur style Text Field (untuk form Login)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor, width: 2),
    ),
    labelStyle: const TextStyle(color: kTextLightColor),
  ),
  textTheme: const TextTheme(
    headlineSmall: kHeadingTextStyle,
    bodyMedium: kBodyTextStyle,
  ),
);
