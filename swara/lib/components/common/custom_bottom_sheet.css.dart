import 'package:flutter/material.dart';

/// CSS-like styles for CustomBottomSheet
class CustomBottomSheetCSS {
  // Colors
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;
  static const Color iconColor = Colors.black;
  
  // Border radius
  static const double borderRadius = 30;
  static final BorderRadius sheetBorderRadius = BorderRadius.vertical(
    top: Radius.circular(borderRadius),
  );
  
  // Text styles
  static const TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
  
  static const TextStyle optionLabelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textColor,
  );
  
  // Icon styles
  static const double iconSize = 28;
  
  // Padding and spacing
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(vertical: 24);
  static const EdgeInsets headerPadding = EdgeInsets.symmetric(horizontal: 24);
  static const EdgeInsets optionPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 24);
  static const double iconTextSpacing = 16;
  static const SizedBox verticalSpacing = SizedBox(height: 24);
  
  // Indicator styles
  static final BoxDecoration indicatorDecoration = BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(2),
  );
  static const double indicatorWidth = 40;
  static const double indicatorHeight = 4;
} 