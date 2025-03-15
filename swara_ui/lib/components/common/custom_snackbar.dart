import 'package:flutter/material.dart';
import 'custom_snackbar.css.dart';

class CustomSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    Color backgroundColor = CustomSnackbarCSS.backgroundColor,
    Color textColor = CustomSnackbarCSS.textColor,
    Duration duration = CustomSnackbarCSS.displayDuration,
    double borderRadius = CustomSnackbarCSS.borderRadius,
    EdgeInsets? margin,
  }) {
    // Calculate default margin if not provided
    final bottomMargin = margin ?? CustomSnackbarCSS.getMargin(context);
        
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: CustomSnackbarCSS.messageStyle.copyWith(color: textColor),
          semanticsLabel: 'Snackbar Message',
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: CustomSnackbarCSS.roundedShape,
        ),
        margin: bottomMargin,
        duration: duration,
      ),
    );
  }
} 