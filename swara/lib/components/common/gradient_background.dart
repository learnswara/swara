import 'package:flutter/material.dart';
import 'gradient_background.css.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: GradientBackgroundCSS.boxDecoration,
      child: child,
    );
  }
} 