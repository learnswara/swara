import 'package:flutter/material.dart';

class AppTheme {
  // Define color constants
  static const Color primaryBlue = Color(0xFF1A237E);
  static const Color secondaryBlue = Color(0xFF3949AB);
  static const Color white = Colors.white;
  static const Color white70 = Colors.white70;
  
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryBlue,
      // Replace deprecated accentColor with colorScheme
      colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        secondary: secondaryBlue,
        surface: primaryBlue,
        onPrimary: white,
        onSecondary: white,
        onSurface: white,
      ),
      // Replace deprecated text theme properties
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: white),
        bodyMedium: TextStyle(color: white70),
        titleLarge: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 32),
        labelLarge: TextStyle(color: white, fontWeight: FontWeight.w500),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: white),
        titleTextStyle: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 0.2),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: white70),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: white,
          foregroundColor: primaryBlue,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
} 