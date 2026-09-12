import 'package:flutter/material.dart';
import 'package:to_do/core/theme/app_colors.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: const Text(
          'Forgot password?',
          style: TextStyle(color: AppColors.primaryColor, fontSize: 13),
        ),
      ),
    );
  }
}
