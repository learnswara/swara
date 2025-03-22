import 'package:flutter/material.dart';
import '../common/gradient_background.dart';
import '../common/social_button.dart';
import 'login_screen.css.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Credentials? _credentials;
  late Auth0 auth0;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0('dev-u44taemtvvs20a0h.us.auth0.com', '4lSI9gZZLnS3oDCjd6Jw1e4JDP10sBRb');
  }

  Future<void> _login() async {
    try {
      final credentials = await auth0.webAuthentication(
        scheme: 'com.example.swara'
      ).login(
        useHTTPS: false,
        redirectUrl: 'com.example.swara://dev-u44taemtvvs20a0h.us.auth0.com/android/com.example.swara/callback'
      );

      setState(() {
        _credentials = credentials;
      });

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/teacher/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: _login,
                    style: LoginScreenCSS.loginButton,
                    child: const Text('Login with Auth0'),
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
                        onPressed: () {},
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