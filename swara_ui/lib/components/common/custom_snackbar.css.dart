import 'package:flutter/material.dart';

/// CSS-like styles for CustomSnackbar
class CustomSnackbarCSS {
  // Colors
  static const Color backgroundColor = Color(0xFF424242); // Gray 800
  static const Color textColor = Colors.white;
  
  // Text styles
  static const TextStyle messageStyle = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w500,
  );
  
  // Shape styles
  static const double borderRadius = 24;
  static BorderRadius roundedShape = BorderRadius.circular(borderRadius);
  
  // Duration
  static const Duration displayDuration = Duration(seconds: 2);
  
  // Margins
  static EdgeInsets getMargin(BuildContext context) {
    return EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height * 0.1,
      left: 16,
      right: 16,
    );
  }
} 