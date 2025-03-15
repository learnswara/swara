import 'package:flutter/material.dart';
import '../common/gradient_background.dart';
import 'signup_screen.css.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: SignupScreenCSS.extendBodyBehindAppBar,
      backgroundColor: SignupScreenCSS.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Sign Up', style: SignupScreenCSS.appBarTitleStyle),
        leading: const BackButton(color: SignupScreenCSS.appBarBackButtonColor),
        backgroundColor: SignupScreenCSS.appBarBackgroundColor,
        elevation: SignupScreenCSS.appBarElevation,
      ),
      body: GradientBackground(
        child: SafeArea(
          maintainBottomViewPadding: SignupScreenCSS.maintainBottomViewPadding,
          child: SingleChildScrollView(
            child: Padding(
              padding: SignupScreenCSS.screenPadding,
              child: Column(
                mainAxisAlignment: SignupScreenCSS.columnMainAxisAlignment,
                crossAxisAlignment: SignupScreenCSS.columnCrossAxisAlignment,
                children: [
                  TextField(
                    style: SignupScreenCSS.textWhite,
                    cursorColor: SignupScreenCSS.cursorColor,
                    decoration: SignupScreenCSS.inputField.copyWith(
                      labelText: 'Full Name',
                    ),
                  ),
                  SignupScreenCSS.widgetSpacing,
                  TextField(
                    style: SignupScreenCSS.textWhite,
                    cursorColor: SignupScreenCSS.cursorColor,
                    decoration: SignupScreenCSS.inputField.copyWith(
                      labelText: 'Email',
                    ),
                  ),
                  SignupScreenCSS.widgetSpacing,
                  TextField(
                    obscureText: true,
                    style: SignupScreenCSS.textWhite,
                    cursorColor: SignupScreenCSS.cursorColor,
                    decoration: SignupScreenCSS.inputField.copyWith(
                      labelText: 'Password',
                    ),
                  ),
                  SignupScreenCSS.widgetSpacing,
                  TextField(
                    obscureText: true,
                    style: SignupScreenCSS.textWhite,
                    cursorColor: SignupScreenCSS.cursorColor,
                    decoration: SignupScreenCSS.inputField.copyWith(
                      labelText: 'Confirm Password',
                    ),
                  ),
                  SignupScreenCSS.largeWidgetSpacing,
                  ElevatedButton(
                    onPressed: () {},
                    style: SignupScreenCSS.primaryButton,
                    child: Text(
                      'Sign Up',
                      style: SignupScreenCSS.primaryButtonText,
                    ),
                  ),
                  SignupScreenCSS.widgetSpacing,
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Already have an account? Login',
                      style: SignupScreenCSS.linkText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 