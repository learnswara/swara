import 'package:flutter/material.dart';

/// CSS-like styles for CreateClassroomScreen
class CreateClassroomScreenCSS {
  // Colors
  static const backgroundColor = Colors.white;
  static final borderColor = Colors.grey[300];
  static final focusedBorderColor = Colors.grey[400];
  static final hintTextColor = Colors.grey[500];
  static final optionalTextColor = Colors.grey[600];
  static final saveButtonColor = Colors.grey[400];

  // Text styles
  static const titleStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const subtitleStyle = TextStyle(
    color: Colors.black87,
    fontSize: 16,
  );

  static const labelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle hintStyle = TextStyle(
    color: hintTextColor,
  );

  static TextStyle optionalStyle = TextStyle(
    color: optionalTextColor,
    fontSize: 14,
  );

  static const saveButtonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const addStudentStyle = TextStyle(
    fontSize: 16,
  );

  static const inputTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
  );

  // Input decorations
  static InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle,
      border: _buildBorder(),
      enabledBorder: _buildBorder(),
      focusedBorder: _buildBorder(focused: true),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  static InputDecoration descriptionDecoration(String hintText, String counterText) {
    return inputDecoration(hintText).copyWith(
      counterText: counterText,
      counterStyle: TextStyle(color: optionalTextColor),
    );
  }

  static OutlineInputBorder _buildBorder({bool focused = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: focused ? focusedBorderColor! : borderColor!,
      ),
    );
  }

  // Button styles
  static final saveButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: saveButtonColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 0,
  );

  static final addStudentButtonStyle = TextButton.styleFrom(
    foregroundColor: optionalTextColor,
  );

  // Layout constants
  static const screenPadding = EdgeInsets.all(24.0);
  static const smallSpacing = SizedBox(height: 8);
  static const mediumSpacing = SizedBox(height: 24);
  static const largeSpacing = SizedBox(height: 32);
}