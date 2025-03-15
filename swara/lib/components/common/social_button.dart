import 'package:flutter/material.dart';
import 'social_button.css.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: textColor,
        size: SocialButtonCSS.iconSize,
      ),
      label: Text(
        label,
        style: SocialButtonCSS.textStyle(textColor),
        semanticsLabel: '$label Button',
      ),
      onPressed: onPressed,
      style: SocialButtonCSS.buttonStyle(backgroundColor),
    );
  }
} 