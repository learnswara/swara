import 'package:flutter/material.dart';
import '../../theme.dart';

/// CSS-like styles for GradientBackground
class GradientBackgroundCSS {
  // Gradient styles
  static const gradientColors = [
    AppTheme.primaryBlue,
    AppTheme.secondaryBlue,
  ];
  
  static const gradientBegin = Alignment.topCenter;
  static const gradientEnd = Alignment.bottomCenter;
  
  static const boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: gradientBegin,
      end: gradientEnd,
      colors: gradientColors,
    ),
  );
} 