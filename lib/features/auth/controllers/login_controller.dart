import 'package:flutter/material.dart';
import 'package:to_do/core/theme/app_constans.dart';
import 'package:to_do/core/services/auth_services.dart';

class LoginController {
  final AuthService _authService = AuthService();

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      return 'من فضلك املأ كل الحقول';
    }

    return await _authService.login(
      email: email.trim(),
      password: password.trim(),
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppConstans.home,
      (route) => false,
    );
  }
}