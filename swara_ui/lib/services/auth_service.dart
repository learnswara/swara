import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final Auth0 auth0;
  Credentials? _credentials;

  AuthService() : auth0 = Auth0(
    'dev-u44taemtvvs20a0h.us.auth0.com',
    '4lSI9gZZLnS3oDCjd6Jw1e4JDP10sBRb'
  );

  bool get isAuthenticated => _credentials != null;
  Credentials? get credentials => _credentials;

  Future<void> login() async {
    _credentials = await auth0.webAuthentication(
      scheme: 'com.example.swara'
    ).login(
      useHTTPS: false,
      redirectUrl: 'com.example.swara://dev-u44taemtvvs20a0h.us.auth0.com/android/com.example.swara/callback'
    );
    notifyListeners();
  }

  Future<void> logout() async {
    await auth0.webAuthentication().logout();
    _credentials = null;
    notifyListeners();
  }
}