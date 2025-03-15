import 'package:flutter/material.dart';

/// CSS-like styles for SplashScreen
class SplashScreenCSS {
  // Scaffold styles
  static const scaffoldBackgroundColor = Colors.transparent;
  
  // Container styles
  static const containerAlignment = Alignment.center;
  
  // Logo styles
  static const logoSize = 120.0;
  static const logoColor = Colors.white;
  
  // Text styles
  static const titleStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  
  static const subtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.white70,
  );
  
  // Animation styles
  static const animationDuration = Duration(milliseconds: 1500);
  static const fadeInDuration = Duration(milliseconds: 800);
  static const scaleBegin = 0.8;
  static const scaleEnd = 1.0;
  static const opacityBegin = 0.0;
  static const opacityEnd = 1.0;
  
  // Layout styles
  static const logoToTextSpacing = SizedBox(height: 24);
  static const titleToSubtitleSpacing = SizedBox(height: 8);
} 