import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_do/core/theme/app_constans.dart';
import 'package:to_do/features/auth/controllers/signup_controller.dart';
import 'package:to_do/features/auth/widgets/custom_buttom.dart';
import 'package:to_do/features/auth/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final SignUpController _controller = SignUpController();
  bool _isLoading = false;

  Future<void> _handleSignUp() async {
    setState(() => _isLoading = true);

    final error = await _controller.signUp(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    setState(() => _isLoading = false);

    if (!mounted) return;

    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    } else {
      _controller.navigateToHome(context);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                    const Gap(80),

                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'Create ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Account',
                            style: TextStyle(color: Color(0xFF3DDC97)),
                          ),
                        ],
                      ),
                    ),
                    const Gap(6),
                    Text(
                      'Start your journey with us',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 14,
                      ),
                    ),
                    const Gap(20),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
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
                            controller: nameController,
                            label: 'Full Name',
                            hint: 'Enter your full name',
                            icon: Icons.person_outline,
                            obscureText: false,
                          ),
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
                                setState(
                                  () => isPasswordVisible = !isPasswordVisible,
                                );
                              },
                            ),
                          ),
                          const Gap(20),
                          CustomTextField(
                            controller: confirmPasswordController,
                            label: 'Confirm Password',
                            hint: 'Re-enter your password',
                            icon: Icons.lock_outline,
                            obscureText: isConfirmPasswordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                isConfirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white38,
                              ),
                              onPressed: () {
                                setState(
                                  () => isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible,
                                );
                              },
                            ),
                          ),
                          const Gap(24),
                          CustomButtom(
                            text: _isLoading ? 'Loading...' : 'Sign Up',
                            onPressed: _isLoading ? null : _handleSignUp,
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                    const Gap(20),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                            fontSize: 15,
                          ),
                        ),
                        const Gap(2),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, AppConstans.login),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              color: Color(0xFF3DDC97),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
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
