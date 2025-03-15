import 'package:flutter/material.dart';

/// CSS-like styles for LoginScreen
class LoginScreenCSS {
  // Scaffold styles
  static const scaffoldBackgroundColor = Colors.transparent;
  static const extendBodyBehindAppBar = true;
  
  // AppBar styles
  static const appBarBackgroundColor = Colors.transparent;
  static const appBarElevation = 0.0;
  static const appBarIconColor = Colors.white;
  
  // Text styles
  static const heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  
  static const subheading = TextStyle(
    color: Colors.white70,
  );
  
  static const label = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  
  static const textWhite = TextStyle(color: Colors.white);
  static const textWhite70 = TextStyle(color: Colors.white70);
  static const textWhiteBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const cursorColor = Colors.white;
  
  // Input styles
  static final inputField = InputDecoration(
    hintStyle: const TextStyle(color: Colors.white70),
    filled: true,
    fillColor: Color.fromRGBO(255, 255, 255, 0.2),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );
  
  // Button styles
  static final loginButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: const Color(0xFF1A237E),
    minimumSize: const Size.fromHeight(48),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  
  static final socialButtonSpacing = const SizedBox(width: 16);
  
  // Divider styles
  static const dividerColor = Colors.white30;
  static const dividerThickness = 1.0;
  static const dividerIndent = 32.0;
  static const dividerEndIndent = 32.0;
  
  // Layout styles
  static const screenPadding = EdgeInsets.all(24.0);
  static const widgetSpacing = SizedBox(height: 16);
  static const largeWidgetSpacing = SizedBox(height: 24);
  static const smallWidgetSpacing = SizedBox(height: 8);
  static const dividerSpacing = SizedBox(height: 32);
  
  // SafeArea styles
  static const maintainBottomViewPadding = true;
  
  // Column styles
  static const columnMainAxisAlignment = MainAxisAlignment.center;
  static const columnCrossAxisAlignment = CrossAxisAlignment.stretch;
  
  // Row styles
  static const rowMainAxisAlignment = MainAxisAlignment.center;
} 