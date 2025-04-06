import 'package:flutter/material.dart';
import '../common/gradient_background.dart';
import '../common/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_screen.css.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

     // Google Sign-In logic
    Future<User?> signInWithGoogle() async {
      try {
        // Trigger the Google Sign-In flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          return null; // The user canceled the login
        }

        // Obtain the authentication details from the request
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Create a new credential using the obtained tokens
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credentials
        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        // Return the signed-in user
        return userCredential.user;
      } catch (e) {
        print('Error during Google Sign-In: $e');
        return null;
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: LoginScreenCSS.extendBodyBehindAppBar,
      backgroundColor: LoginScreenCSS.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: LoginScreenCSS.appBarBackgroundColor,
        elevation: LoginScreenCSS.appBarElevation,
        automaticallyImplyLeading: false,
      ),
      body: GradientBackground(
        child: SafeArea(
          maintainBottomViewPadding: LoginScreenCSS.maintainBottomViewPadding,
          child: SingleChildScrollView(
            child: Padding(
              padding: LoginScreenCSS.screenPadding,
              child: Column(
                mainAxisAlignment: LoginScreenCSS.columnMainAxisAlignment,
                crossAxisAlignment: LoginScreenCSS.columnCrossAxisAlignment,
                children: [
                  // Logo or app name
                  const Text(
                    'Swara',
                    style: LoginScreenCSS.heading,
                  ),
                  LoginScreenCSS.smallWidgetSpacing,
                  const Text(
                    'Music Learning Platform',
                    style: LoginScreenCSS.subheading,
                  ),
                  LoginScreenCSS.largeWidgetSpacing,
                  
                  // Email field
                  TextField(
                    style: LoginScreenCSS.textWhite,
                    cursorColor: LoginScreenCSS.cursorColor,
                    decoration: LoginScreenCSS.inputField.copyWith(
                      hintText: 'Email',
                    ),
                  ),
                  LoginScreenCSS.widgetSpacing,
                  
                  // Password field
                  TextField(
                    obscureText: true,
                    style: LoginScreenCSS.textWhite,
                    cursorColor: LoginScreenCSS.cursorColor,
                    decoration: LoginScreenCSS.inputField.copyWith(
                      hintText: 'Password',
                    ),
                  ),
                  LoginScreenCSS.smallWidgetSpacing,
                  
                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: LoginScreenCSS.textWhite,
                      ),
                    ),
                  ),
                  LoginScreenCSS.widgetSpacing,
                  
                  // Login button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/teacher/home');
                    },
                    style: LoginScreenCSS.loginButton,
                    child: const Text('Login'),
                  ),
                  LoginScreenCSS.dividerSpacing,
                  
                  // Or continue with
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: LoginScreenCSS.dividerColor,
                          thickness: LoginScreenCSS.dividerThickness,
                          indent: LoginScreenCSS.dividerIndent,
                          endIndent: LoginScreenCSS.dividerEndIndent,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Or continue with',
                          style: LoginScreenCSS.textWhite70,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: LoginScreenCSS.dividerColor,
                          thickness: LoginScreenCSS.dividerThickness,
                          indent: LoginScreenCSS.dividerIndent,
                          endIndent: LoginScreenCSS.dividerEndIndent,
                        ),
                      ),
                    ],
                  ),
                  LoginScreenCSS.largeWidgetSpacing,
                  
                  // Social login buttons
                  Row(
                    mainAxisAlignment: LoginScreenCSS.rowMainAxisAlignment,
                    children: [
                      SocialButton(
                        icon: Icons.g_mobiledata,
                        label: 'Google',
                        onPressed: () async {
                          print('Inside on pressed');
                          User? user = await signInWithGoogle();
                          if (user != null) {
                            print('Logged in as ${user.displayName}');
                            Navigator.pushReplacementNamed(context, '/teacher/home');
                          } else {
                              print('Google Sign-In failed');
                          }
                        },
                      ),
                      LoginScreenCSS.socialButtonSpacing,
                      SocialButton(
                        icon: Icons.facebook,
                        label: 'Facebook',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  LoginScreenCSS.largeWidgetSpacing,
                  
                  // Sign up link
                  Row(
                    mainAxisAlignment: LoginScreenCSS.rowMainAxisAlignment,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: LoginScreenCSS.textWhite70,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text(
                          'Sign Up',
                          style: LoginScreenCSS.textWhiteBold,
                        ),
                      ),
                    ],
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