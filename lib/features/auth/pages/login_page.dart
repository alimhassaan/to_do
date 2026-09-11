import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/app_constans.dart';
import 'package:to_do/features/auth/widgets/custom_buttom.dart';
import 'package:to_do/features/auth/widgets/custom_text_field.dart';
import 'package:to_do/features/auth/widgets/custom_divider.dart';
import 'package:to_do/features/auth/widgets/forgot_password.dart';
import 'package:to_do/features/auth/widgets/google_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  IconData arrow = Icons.arrow_forward;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/background_login.jpeg',
              fit: BoxFit.cover,
            ),

            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(250),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF3DDC97).withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Gap(20),
                          CustomTextField(
                            controller: emailController,
                            label: 'Email',
                            hint: 'Enter your email',
                            icon: Icons.email,
                            obscureText: false,
                          ),
                          const Gap(20),
                          CustomTextField(
                            controller: passwordController,
                            label: 'Password',
                            hint: 'Enter your password',
                            icon: Icons.lock,
                            obscureText: isPasswordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white38,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          Gap(20),
                          const ForgotPassword(),
                          const Gap(20),
                          CustomButtom(text: 'Log In', onPressed: () {}),
                          const Gap(20),
                          const CustomDivider(color: Colors.white),
                          const Gap(20),
                          const GoogleButton(),
                          const Gap(20),
                        ],
                      ),
                    ),
                    const Gap(20),
                    Column(
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                            fontSize: 15,
                          ),
                        ),
                        const Gap(2),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppConstans.signup);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
