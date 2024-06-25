import 'package:flutter/material.dart';
import 'package:vms_application/utils/constant/styles.dart';

ThemeData customTheme() {
  return ThemeData(
    primaryColor: colorWhite,
    hintColor: colorBlack.withOpacity(0.60),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'ReadexPro', // Specify the font family
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontFamily: 'ReadexPro', // Specify the font family
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        fontFamily: readexFontFamily, // Specify the font family
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
}

