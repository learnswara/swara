import 'package:flutter/material.dart';

/// CSS-like styles for SocialButton
class SocialButtonCSS {
  // Default colors
  static const defaultBackgroundColor = Colors.white;
  static const defaultTextColor = Colors.black87;
  
  // Button styles
  static ButtonStyle buttonStyle(Color backgroundColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      minimumSize: const Size(120, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
  
  // Text styles
  static TextStyle textStyle(Color textColor) {
    return TextStyle(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }
  
  // Icon styles
  static const double iconSize = 24.0;
  static const EdgeInsets iconPadding = EdgeInsets.only(right: 12.0);
} 