import 'package:flutter/material.dart';
import '../../theme.dart';

/// CSS-like styles for TeacherHomeScreen
class HomeScreenCSS {
  // Scaffold styles
  static const scaffoldBackgroundColor = Colors.white;
  
  // Header styles
  static const headerStyle = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  
  static const headerPadding = EdgeInsets.only(
    top: 24, // This should be dynamic based on status bar height
    left: 24,
    right: 24,
    bottom: 16,
  );
  
  static const headerBackgroundColor = AppTheme.primaryBlue;
  
  // Content styles
  static const contentBackgroundColor = Color(0xFFF5F5F5); // Light gray
  static const contentPadding = EdgeInsets.all(24.0);
  
  // Card styles
  static final cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 2),
      ),
    ],
  );
  
  static const cardPadding = EdgeInsets.all(24);
  
  // Empty state styles
  static final iconContainerDecoration = BoxDecoration(
    color: Colors.blue[50],
    shape: BoxShape.circle,
  );
  
  static const iconContainerSize = 64.0;
  static const iconSize = 32.0;
  static final iconColor = Colors.blue[400];
  
  static const emptyTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  
  static const emptyDescriptionStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
    height: 1.5,
  );
  
  static const emptyTextAlign = TextAlign.center;
  static const buttonWidth = double.infinity;
  
  // Button styles
  static final createButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
  
  static const buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  
  // Navigation bar styles
  static final navBarDivider = Container(
    height: 1,
    color: Colors.grey.withOpacity(0.2),
  );
  
  static const navBarBackgroundColor = Colors.white;
  static const navBarElevation = 0.0;
  static const navBarType = BottomNavigationBarType.fixed;
  
  static const selectedNavItemColor = AppTheme.primaryBlue;
  static final unselectedNavItemColor = AppTheme.primaryBlue.withOpacity(0.4);
  
  static const selectedIconTheme = IconThemeData(
    size: 28,
  );
  
  static const unselectedIconTheme = IconThemeData(
    size: 24,
  );
  
  static const selectedLabelStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  
  static const unselectedLabelStyle = TextStyle(
    fontSize: 12,
  );
  
  // Column styles
  static const columnMainAxisSize = MainAxisSize.min;
  
  // Spacing
  static const smallSpacing = SizedBox(height: 8);
  static const mediumSpacing = SizedBox(height: 16);
  static const largeSpacing = SizedBox(height: 20);
  static const extraLargeSpacing = SizedBox(height: 24);
} 