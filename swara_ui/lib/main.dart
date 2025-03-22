import 'package:flutter/material.dart';
import 'components/login/login_screen.dart';
import 'components/signup/signup_screen.dart';
import 'components/splash/splash_screen.dart';
import 'components/start/start_screen.dart';
import 'components/teacher/home_screen.dart';
import 'theme.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SplashScreen(),
      routes: {
        Routes.splash: (context) => const SplashScreen(),
        Routes.start: (context) => const StartScreen(),
        Routes.login: (context) => const LoginScreen(),
        Routes.signup: (context) => const SignupScreen(),
        Routes.teacherHome: (context) => const TeacherHomeScreen(),
      },
    );
  }
}