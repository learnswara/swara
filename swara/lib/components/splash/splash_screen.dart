import 'package:flutter/material.dart';
import '../common/gradient_background.dart';
import 'splash_screen.css.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: SplashScreenCSS.animationDuration,
    );
    
    _scaleAnimation = Tween<double>(
      begin: SplashScreenCSS.scaleBegin,
      end: SplashScreenCSS.scaleEnd,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));
    
    _opacityAnimation = Tween<double>(
      begin: SplashScreenCSS.opacityBegin,
      end: SplashScreenCSS.opacityEnd,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    
    _controller.forward();
    
    // Navigate to login screen after animation completes
    Future.delayed(SplashScreenCSS.animationDuration, () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashScreenCSS.scaffoldBackgroundColor,
      body: GradientBackground(
        child: Container(
          alignment: SplashScreenCSS.containerAlignment,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return FadeTransition(
                opacity: _opacityAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // App logo
                      Icon(
                        Icons.music_note,
                        size: SplashScreenCSS.logoSize,
                        color: SplashScreenCSS.logoColor,
                      ),
                      SplashScreenCSS.logoToTextSpacing,
                      
                      // App name
                      const Text(
                        'Swara',
                        style: SplashScreenCSS.titleStyle,
                      ),
                      SplashScreenCSS.titleToSubtitleSpacing,
                      
                      // App tagline
                      const Text(
                        'Music Learning Platform',
                        style: SplashScreenCSS.subtitleStyle,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
} 