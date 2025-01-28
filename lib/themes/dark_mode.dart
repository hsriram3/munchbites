// import 'package:flutter/material.dart';

// ThemeData darkMode = ThemeData(
//   colorScheme: ColorScheme.dark(
//     background: const Color.fromARGB(255, 15, 15, 15),
//     primary: const Color.fromARGB(255, 231, 230, 230),
//     secondary: const Color.fromARGB(255, 202, 201, 201),
//     tertiary: const Color.fromARGB(255, 119, 119, 119),
//     inversePrimary: const Color.fromARGB(255, 213, 211, 211),
//   ),
// );
import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 15, 15, 15),
    primary: Color.fromARGB(255, 231, 230, 230), // Light for main text
    secondary: Color.fromARGB(255, 60, 60, 60), // Better card contrast
    tertiary: Color.fromARGB(255, 180, 180, 180), // Softer tertiary text
    inversePrimary: Color.fromARGB(255, 240, 240, 240), // Chip text contrast
  ),
  cardColor: const Color.fromARGB(255, 30, 30, 30), // Dark card background
  scaffoldBackgroundColor:
      const Color.fromARGB(255, 20, 20, 20), // Dark scaffold
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 231, 230, 230), // Light main text
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 202, 201, 201), // Light secondary text
    ),
    headlineLarge: TextStyle(
      color: Color.fromARGB(255, 231, 230, 230), // Light headers
    ),
    headlineMedium: TextStyle(
      color: Color.fromARGB(255, 231, 230, 230), // Light headers
    ),
    labelLarge: TextStyle(
      color: Color.fromARGB(255, 240, 240, 240), // Button text light
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 231, 230, 230), // Light icons
  ),
);
