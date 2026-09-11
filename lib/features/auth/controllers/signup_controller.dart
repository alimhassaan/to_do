import 'package:flutter/material.dart';
import 'package:to_do/core/theme/app_constans.dart';
import 'package:to_do/core/theme/services/auth_services.dart';

class SignUpController {
  final AuthService _authService = AuthService();

  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (name.trim().isEmpty ||
        email.trim().isEmpty ||
        password.trim().isEmpty) {
      return 'من فضلك املأ كل الحقول';
    }

    if (password != confirmPassword) {
      return 'كلمة المرور غير متطابقة';
    }

    return await _authService.signUp(
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