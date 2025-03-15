import 'package:flutter/material.dart';

/// CSS-like styles for SignupScreen
class SignupScreenCSS {
  // Text styles
  static const textWhite = TextStyle(color: Colors.white);
  static const cursorColor = Colors.white;
  
  // AppBar styles
  static const appBarTitleStyle = TextStyle(color: Colors.white);
  static const appBarBackButtonColor = Colors.white;
  static const appBarBackgroundColor = Colors.transparent;
  static const appBarElevation = 0.0;
  
  // Input styles
  static final inputField = InputDecoration(
    labelStyle: const TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white.withOpacity(0.2),
  );
  
  // Button styles
  static final primaryButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  
  static final primaryButtonText = TextStyle(
    color: const Color(0xFF1A237E),
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  
  // Link styles
  static const linkText = TextStyle(color: Colors.white);
  
  // Layout styles
  static const screenPadding = EdgeInsets.all(16.0);
  static const widgetSpacing = SizedBox(height: 16);
  static const largeWidgetSpacing = SizedBox(height: 24);
  
  // Scaffold styles
  static const scaffoldBackgroundColor = Colors.transparent;
  static const extendBodyBehindAppBar = true;
  
  // SafeArea styles
  static const maintainBottomViewPadding = true;
  
  // Column styles
  static const columnMainAxisAlignment = MainAxisAlignment.center;
  static const columnCrossAxisAlignment = CrossAxisAlignment.stretch;
} 